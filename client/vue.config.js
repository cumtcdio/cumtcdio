module.exports = {
    pages: {
        index:{
            entry: 'src/pages/index/main.js',
            template: 'public/index.html',
            filename: 'index.html',
            title: '首页'
        },
        cdio: {
            entry: 'src/pages/cdio/main.js',
            template: 'public/cdio.html',
            filename: 'cdio.html',
            title: '详情'
        },
        project: {
            entry: 'src/pages/project/main.js',
            template: 'public/project.html',
            filename: 'project.html',
            title: '项目制介绍'
        },
        list: {
            entry: 'src/pages/list/main.js',
            template: 'public/list.html',
            filename: 'list.html',
            title: '列表页面'
        },
        details: {
            entry: 'src/pages/details/main.js',
            template: 'public/details.html',
            filename: 'details.html',
            title: '详情界面'
        }
    },
    devServer: {
        proxy: {
            '/api': {
                target: 'http://localhost:8080',
                changeOrigin: true,
                pathRewrite: {
                    '^/api': '/mock'
                }
            }
        }
    }
}
