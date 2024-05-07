const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
const bootstrap = require('bootstrap')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: ['popper.js', 'default']
  })
)
module.exports = environment
