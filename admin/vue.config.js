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
            }
        }
    }
}
