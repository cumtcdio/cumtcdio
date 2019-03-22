<template>
    <div>
        <nav class="navbar navbar-expand-md navbar-dark">
            <!--<a class="navbar-brand" href="#">Navbar</a>-->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item" v-for="item in menus" :key="item.id">
                        <a class="nav-link" :href="item.href">{{item.title}}</a>
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
                    href: '#'
                },
                {
                    index: '2',
                    title: '通知',
                    href: '#'
                },
                {
                    index: '3',
                    title: '新闻',
                    href: '#'
                },
                {
                    index: '4',
                    title: 'EC-CDIO项目教学',
                    href: '#'
                },
                {
                    index: '5',
                    title: '师生风采',
                    href: '#'
                },
                {
                    index: '6',
                    title: '专业信息',
                    href: '#'
                },
                {
                    index: '7',
                    title: '电子商务专业实习',
                    href: '#'
                }
            ]
        }
    }
}
</script>
<style scoped>

</style>