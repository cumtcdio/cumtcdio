const webpack = require('webpack')
module.exports = {
    pages: {
        index:{
            entry: 'src/main.js',
            template: 'public/index.html',
            filename: 'index.html',
            title: 'admin'
        }
    },
    devServer: {
        proxy: {
            '/api': {
                target: 'http://localhost:8090',
                changeOrigin: true,
                // pathRewrite: {
                //     '^/api': '/mock'
                // }
            },
            '/auth': {
               target: 'http://localhost:8090',
               changeOrigin: true
            }
        }
    },
    chainWebpack: config => {
        config.plugin('provide').use(webpack.ProvidePlugin, [{
            $: 'jquery',
            jquery: 'jquery',
            jQuery: 'jquery',
            'window.jQuery': 'jquery',
            'window.Quill': 'quill/dist/quill.js',
            'Quill': 'quill/dist/quill.js'
        }]);
    }
}
