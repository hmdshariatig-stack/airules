# Multi-stage Dockerfile for test execution agent
# Supports PHPUnit (PHP), Jest (Node.js), and PyTest (Python)

# Stage 1: Base dependencies
FROM ubuntu:22.04 AS base

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    unzip \
    php \
    php-cli \
    php-mbstring \
    php-xml \
    php-zip \
    nodejs \
    npm \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install testing tools
RUN composer global require phpunit/phpunit \
    && npm install -g jest \
    && pip3 install pytest

# Set working directory
WORKDIR /app

# Stage 2: Test execution environment
FROM base AS test

# Copy test configuration and scripts
COPY docker-compose.yml ./
COPY run-tests.sh ./
COPY test-config/ ./test-config/
COPY reports/ ./reports/

# Make scripts executable
RUN chmod +x run-tests.sh

# Default command
ENTRYPOINT ["./run-tests.sh"]