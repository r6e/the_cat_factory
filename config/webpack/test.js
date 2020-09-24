process.env.NODE_ENV = process.env.NODE_ENV || "development";

const environment = require("./environment");

environment.plugins.get("Manifest").options.writeToFileEmit =
  process.env.NODE_ENV !== "test";
module.exports = environment.toWebpackConfig();
