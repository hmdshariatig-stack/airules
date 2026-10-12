#!/bin/bash
# Test runner entry point script for the tester agent
# Supports PHPUnit, Jest, and PyTest execution with reporting

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default configuration
TEST_FRAMEWORKS="${TEST_FRAMEWORKS:-phpunit,jest,pytest}"
REPORT_FORMAT="${REPORT_FORMAT:-junit,html,json}"
CI_MODE="${CI_MODE:-false}"

# Parse comma-separated frameworks into array
IFS=',' read -ra FRAMEWORKS <<< "$TEST_FRAMEWORKS"
IFS=',' read -ra FORMATS <<< "$REPORT_FORMAT"

echo -e "${BLUE}=== Tester Agent - Test Execution ===${NC}"
echo -e "Frameworks: ${FRAMEWORKS[*]}"
echo -e "Report formats: ${FORMATS[*]}"
echo -e "CI Mode: ${CI_MODE}"
echo ""

# Create reports directory
mkdir -p reports/php reports/node reports/python

# Function to run PHPUnit tests
run_phpunit() {
    echo -e "${YELLOW}Running PHPUnit tests...${NC}"
    if [ -f "composer.json" ]; then
        composer install --no-interaction --prefer-dist
        php vendor/bin/phpunit --configuration test-config/phpunit.xml
    else
        echo -e "${RED}No composer.json found, skipping PHPUnit${NC}"
        return 1
    fi
}

# Function to run Jest tests
run_jest() {
    echo -e "${YELLOW}Running Jest tests...${NC}"
    if [ -f "package.json" ]; then
        npm install
        npx jest --config test-config/jest.config.js --ci --reporters=default --reporters=jest-junit
    else
        echo -e "${RED}No package.json found, skipping Jest${NC}"
        return 1
    fi
}

# Function to run PyTest tests
run_pytest() {
    echo -e "${YELLOW}Running PyTest tests...${NC}"
    if [ -f "requirements.txt" ]; then
        pip install -r requirements.txt
        pytest test-config/pytest.ini --junitxml=reports/python/junit.xml --html=reports/python/report.html
    else
        echo -e "${RED}No requirements.txt found, skipping PyTest${NC}"
        return 1
    fi
}

# Execute tests based on selected frameworks
FAILED=0

for framework in "${FRAMEWORKS[@]}"; do
    case "$framework" in
        phpunit)
            run_phpunit || FAILED=1
            ;;
        jest)
            run_jest || FAILED=1
            ;;
        pytest)
            run_pytest || FAILED=1
            ;;
        *)
            echo -e "${RED}Unknown framework: $framework${NC}"
            FAILED=1
            ;;
    esac
    echo ""
done

# Generate summary report
echo -e "${BLUE}=== Test Execution Summary ===${NC}"
if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}All tests passed!${NC}"
    exit 0
else
    echo -e "${RED}Some tests failed!${NC}"
    exit 1
fi