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
        }
    }
}