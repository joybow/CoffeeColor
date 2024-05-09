process.env.NODE_ENV = process.env.NODE_ENV || 'production'
const environment = require('./environment')
environment.config.set('entry', {
  application: './app/javascript/packs/application.js'
});

module.exports = environment.toWebpackConfig();
