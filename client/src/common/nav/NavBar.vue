<template>
    <div>
        <nav class="navbar navbar-expand-md navbar-dark">
            <!--<a class="navbar-brand" href="#">Navbar</a>-->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="nav navbar-nav">
                    <li class="nav-item" v-for="item in menus" :key="item.id">
                        <a class="nav-link" style="color: #fff" :href="item.href">{{item.title}}</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</template>
<script>
export default {
    name: 'NavBar',
    data () {
        return{
            menus: [
                {
                    index: '1',
                    title: '首页',
                    href: 'index'
                },
                {
                    index: '2',
                    title: '通知',
                    href: 'list.html?title=通知'
                },
                {
                    index: '3',
                    title: '新闻',
                    href: 'list.html?title=新闻'
                },
                {
                    index: '4',
                    title: 'EC-CDIO项目教学',
                    href: 'cdio.html'
                },
                {
                    index: '5',
                    title: '师生风采',
                    href: 'list.html?title=师生风采'
                },
                {
                    index: '6',
                    title: '专业信息',
                    href: 'list.html?title=专业信息'
                },
                {
                    index: '7',
                    title: '电子商务专业实习',
                    href: 'list.html?title=专业实习'
                }
            ]
        }
    }
}
</script>
<style scoped>
.navbar .nav > li > a:hover {
    color: red;
    background-color: rgb(231,141,31);
}
</style>
