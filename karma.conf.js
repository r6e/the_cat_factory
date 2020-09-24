// Require our webpack test configuration
const webpackConfig = require("./config/webpack/test.js");

module.exports = function (config) {
  config.set({
    basePath: "",
    frameworks: ["jasmine"],
    plugins: [
      "karma-jasmine",
      "karma-webpack",
      "karma-chrome-launcher",
      "karma-coverage-istanbul-reporter",
      "karma-spec-reporter",
    ],
    files: ["test/**/*.ts", "test/**/*.tsx"],
    exclude: [],
    webpack: webpackConfig,
    preprocessors: {
      "**/*.ts": ["webpack", "sourcemap"], // old: "karma-typescript"
      "**/*.tsx": ["webpack", "sourcemap"],
    },
    karmaTypescriptConfig: {
      tsconfig: "tsconfig.json",
    },
    mime: { "text/x-typescript": ["ts"] },
    reporters: ["progress", "coverage-istanbul"],
    coverageIstanbulReporter: {
      reports: ["html", "lcovonly", "text-summary"],
      fixWebpackSourcePaths: true,
    },
    port: 9876,
    colors: true,
    logLevel: config.LOG_INFO,
    autoWatch: true,
    browsers: ["Chrome"],
    singleRun: true,
  });
};
