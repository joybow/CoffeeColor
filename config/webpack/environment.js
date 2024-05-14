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
module.exports = environment

// if (process.env.NODE_ENV === 'production') {
//   environment.config.merge({
//     plugins: [
//       new webpack.NormalModuleReplacementPlugin(/bootstrap/,(result) =>{
//         result.request = undefined
//       })
//     ]
//   })
// } else {
//   const bootstrapEntries = ['bootstrap']
//   environment.entries.get('package').entries.forEach((entry)=> {
//     bootstrapEntries.forEach((path)=>{
//       entry.import(path).catch(console.error)
//     })
//   })
// }

