const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
environment.plugins.append('provide',
	new webpack.providePlugin({
		$: 'jquery',
		JQuery: 'jquery',
		Popper: ['popper.js', 'default']
	})
)
module.exports = environment
