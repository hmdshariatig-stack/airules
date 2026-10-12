module.exports = {
    testEnvironment: 'node',
    verbose: true,
    collectCoverage: true,
    coverageDirectory: 'reports/node/coverage',
    coverageReporters: ['text', 'text-summary', 'lcov', 'html'],
    coverageThreshold: {
        global: {
            branches: 80,
            functions: 80,
            lines: 80,
            statements: 80
        }
    },
    testMatch: ['**/__tests__/**/*.js', '**/?(*.)+(spec|test).js'],
    transform: {
        '^.+\\.jsx?$': 'babel-jest'
    },
    moduleFileExtensions: ['js', 'json', 'jsx', 'ts', 'tsx', 'node'],
    transformIgnorePatterns: [
        '[/\\\\]node_modules[/\\\\].+\\.(js|jsx|mjs|cjs|ts|tsx)$'
    ],
    testTimeout: 30000,
    forceExit: true,
    clearMocks: true,
    resetMocks: true,
    restoreMocks: true,
    reporters: [
        'default',
        [
            'jest-junit',
            {
                outputDirectory: 'reports/node',
                outputName: 'junit.xml',
                classNameTemplate: '{classname}',
                titleTemplate: '{classname} {title}',
                addFileAttribute: 'true'
            }
        ]
    ],
    watchPathIgnorePatterns: ['<rootDir>/node_modules', '<rootDir>/reports', '<rootDir>/dist'],
    snapshotSerializers: ['enzyme-to-json/serializer']
};