<template>
    <div id="list">
        <div class="row center">
            <br>
            <br>
            <br>
        </div>
        <div class="row center">
            <div class="col-md-2 col-lg-2 col-xl-2"></div>
            <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
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
            <div class="col-md-2 col-lg-8 col-xl-8"></div>
        </div>
        <div class="row">
            <div class="col-md-2 col-lg-2 col-xl-2"></div>
            <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
                <img src="http://www.cumt.edu.cn/_upload/tpl/04/ae/1198/template1198/images/banner.jpg">
                <div class="row content">
                    <div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
                        <span>{{title}}</span>
                    </div>
                    <div class="col-12 col-sm-12 col-md-10 col-lg-10 col-xl-10">
                        <div v-if="titleShow">
                            <span class="left">{{title}}</span>
                            <span class="right">当前位置：首页 | {{title}}</span>
                        </div>
                        <div v-if="!titleShow">
                            <span>当前位置：首页 | {{title}}</span>
                        </div>
                        <hr>
                        <div class="content-list">
                            <div class="content-bottom" v-for="item in list" :key="item.id">
                                <span class="left">{{item.title}}</span>
                                <span class="right" v-if="titleShow">{{item.date}}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-2 col-lg-2 col-xl-2"></div>
        </div>
    </div>
</template>
<script>
    export default {
        name: 'ListIndex',
        data() {
            return {
                title: '通知',
                titleShow: true,
                timer: null,
                screenWidth: document.body.clientWidth,
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
                ],
                list: [
                    {id: '1', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                    {id: '2', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                    {id: '3', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                    {id: '4', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                    {id: '5', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                ]
            }
        },
        mounted() {
            var _this = this;
            window.onresize = function(){ // 定义窗口大小变更通知事件
                _this.screenWidth = document.documentElement.clientWidth; //窗口宽度
            };
        },
        watch: {
            screenWidth: function(val){ //监听屏幕宽度变化
                if (val < 750) {
                    this.titleShow = false
                }else {
                    this.titleShow = true
                }
            }
        }
    }
</script>
<style scoped>
.center {
    background: rgb(0, 41,86);
}
img{
    width: 100%;
}
.navbar {
    margin-bottom: 0px;
    background: rgb(0, 41,86);
}
.content {
    margin: 10px 0px;
}
.right {
    margin-right: 0px;
    float: right;
}
.content-bottom {
    border-bottom: 1px dashed rgb(255, 255, 255);
}
</style>
