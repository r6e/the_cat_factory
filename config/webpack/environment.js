const { environment } = require("@rails/webpacker");
const path = require("path");

["css", "moduleCss"].forEach((loaderName) => {
  const loader = environment.loaders.get(loaderName);

  loader.test = /\.(p?css)$/i;

  environment.loaders.insert(loaderName, loader);
});

environment.config.merge({
  resolve: {
    extensions: [".js", ".jsx", ".ts", ".tsx"],
    alias: {
      "@": path.resolve(__dirname, "..", "..", "frontend/"),
    },
  },
});

module.exports = environment;
