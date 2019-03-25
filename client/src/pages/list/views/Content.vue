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
                                <a target="_blank" :href="link + '?title=' + title">
                                    <div class="row">
                                        <span class="col-10 left">{{item.title}}</span>
                                        <span class="col-2 right content-date" v-if="titleShow">{{item.date_time}}</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="content-footer" style="margin-top: 8px">
                            <span class="content-footer-item-1" v-if="titleShow">总共<span>{{totalList}}</span>条记录</span>&nbsp;
                            <span class="content-footer-item-2">
                                <span class="page-link">第一页</span>
                                &lt;&lt;上一页 下一页&gt;&gt;
                                <span class="page-link">尾页</span> </span>
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
import axios from 'axios'
export default {
    name: 'ListContent',
    components: {
      NavBar
    },
    data() {
        return {
            title: '通知',
            totalList: 0,
            titleShow: true,
            timer: null,
            screenWidth: document.body.clientWidth,
            link: 'details.html',
            list: []
        }
    },
    methods: {
        doInitToGetParams: function () {
            var reg = new RegExp("(^|&)" + 'title' + "=([^&]*)(&|$)", "i");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) {
                this.title = decodeURI(r[2]);
            } else {
                return null;
            }
        },
        deserveIsCOrM: function () {
            if (this.screenWidth <= 750) {
                this.titleShow = false
            }
        },
        getListData: function () {
            if (this.title === "新闻") {
                axios.get('/api/news/news.json').then(response => {
                    this.getListDataSucc(response)
                })
            }else {
                axios.get('/api/tongzhi/tongzhi.json').then(response => {
                    this.getListDataSucc(response)
                })
            }
        },
        getListDataSucc: function(res) {
            var data = res.data
            if (data.ret && data.data) {
                this.list = data.data
                this.totalList = this.list.length
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
        this.getListData()
        this.doInitToGetParams()
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
    color: rgba(153,153,153,0.8);
}
.content-footer {
    float: right;
}
.title-content {
    background: #C64718;
    width: 100%;
    height: 2.5rem;
    padding: .5rem;
    text-align: center;
    color: white;
}
.left{
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
}
.line{
    height: 1px;
    color: gainsboro;
}
.page-link {
    display: inline;
    border: none;
    background: none;
}
a {color:#000;}
a:active  {color:#000;}
a:link    {color:#000;}
a:visited {color:#000;}
a:hover   {color:#E67F11;  text-decoration: none;}
</style>
