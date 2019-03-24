<template>
    <div class="wrapper">
        <div class="line"></div>
        <div class="row center">
            <div class="col-md-2 col-lg-2 col-xl-2"></div>
            <div class="col-12 col-md-8 col-lg-8 col-xl-8">
                <nav-bar></nav-bar>
            </div>
            <div class="col-md-2 col-lg-8 col-xl-8"></div>
        </div>
        <div class="row">
            <div class="col-md-2 col-lg-2 col-xl-2"></div>
            <div class="col-12 col-md-8 col-sm">
                <img src="http://www.cumt.edu.cn/_upload/tpl/04/ae/1198/template1198/images/banner.jpg">
                <div class="row content">
                    <div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
                        <div class="title-content">{{title}}</div>
                    </div>
                    <div class="col-12 col-sm-12 col-md-10 col-lg-10 col-xl-10">
                        <div v-if="titleShow">
                            <span class="left">{{title}}</span>
                            <span class="right">当前位置：首页 | {{title}}</span>
                        </div>
                        <div v-if="!titleShow">
                            <span><span class="iconfont arrow-icon">&#xe665;</span>首页 | {{title}}</span>
                        </div>
                        <hr>
                        <div class="content-list">
                            <div class="content-bottom" v-for="item in list" :key="item.id">
                                <span class="left">{{item.title}}</span>
                                <span class="right content-date" v-if="titleShow">{{item.date}}</span>
                            </div>
                        </div>
                        <div class="content-footer">
                            <span class="content-footer-item-1" v-if="titleShow">每页14条记录，总共5条记录</span>
                            <span class="content-footer-item-2">第一页 &lt;&lt;上一页 下一页&gt;&gt; 尾页</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-2 col-lg-2 col-xl-2"></div>
        </div>
    </div>
</template>
<script>
import NavBar from '../../../common/nav/NavBar'
export default {
    name: 'ListContent',
    components: {
      NavBar
    },
    data() {
        return {
            title: '通知',
            titleShow: true,
            timer: null,
            screenWidth: document.body.clientWidth,
            list: [
                {id: '1', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '2', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '3', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '4', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '5', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '6', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '7', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '8', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '9', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '10', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '11', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '12', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '13', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '14', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '15', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '16', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '17', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '18', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '19', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '20', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '21', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '22', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '23', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '24', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
                {id: '25', title: '中国矿大师生热议习近平总书记在学校思政课教师代表座谈会上的讲话', date: '2019-03-19'},
            ]
        }
    },
    methods: {
        deserveIsCOrM: function () {
            if (this.screenWidth <= 750) {
                this.titleShow = false
            }
        }
    },
    mounted() {
        var _this = this;
        window.onresize = function(){ // 定义窗口大小变更通知事件
            _this.screenWidth = document.documentElement.clientWidth; //窗口宽度
            if (_this.screenWidth < 750) {
                this.titleShow = false
            }
        };
        this.deserveIsCOrM()
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
.row {
    margin: 0
}
.center {
    background: #C64718;
}
.wrapper{
    padding: 0px;
    margin-bottom: 67px;
}
img{
    width: 100%;
}
.content {
    margin: 10px 0px;
}
.right {
    margin-right: 0px;
    float: right;
}
.content-bottom {
    border-bottom: 1px dashed rgba(0, 0, 0, 0.8);
    padding: .8rem;
}
.content-date {
    color: rgba(153,153,153)
}
.content-footer {
    float: right;
}
.title-content {
    background: rgb(0, 41,86);
    width: 100%;
    height: 2.5rem;
    padding: .5rem;
    text-align: center;
    color: white;
}
.line{
    height: 1px;
    color: gainsboro;
}
</style>
