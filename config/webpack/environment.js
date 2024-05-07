const { environment } = require('@rails/webpacker')
const webpack = require('webpack')


environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    'window.jQuery': 'jquery',
    Popper: ['popper.js', 'default']
  })
)

if (process.env.NODE_ENV === 'production') {
  environment.loaders.delete('file-loader');
  environment.plugins.delete('file-loader');
  environment.config.merge({
    plugins: [
      new webpack.NormalModuleReplacementPlugin(/bootstrap/,(result) =>{
        result.request = undefined
      })
    ]
  })
} else {
  const bootstrapEntries = ['bootstrap']
  environment.entries.forEach((entry, name)=> {
    bootstrapEntries.forEach((path)=>{
      entry.import(path).catch(console.error)
    })
  })
}

module.exports = environment
