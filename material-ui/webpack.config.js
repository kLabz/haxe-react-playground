const webpackConfig = require('../common/webpack-config');

module.exports = webpackConfig({
  dirname: __dirname,
  isProd: false,
  isHttps: true,
  useFriendlyErrors: true,
  serverPort: 9161
});

