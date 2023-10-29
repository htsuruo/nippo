module.exports = {
  preset: 'ts-jest',
  roots: ['<rootDir>/src'],
  // https://github.com/facebook/jest/issues/7780#issuecomment-645989788
  testEnvironment: 'node',
  transform: {
    '^.+\\.m?[tj]sx?$': ['ts-jest'],
  },
}
