<template>
  <div id="details">
    <div class="row">
      <div class="col-md-2 a" v-if="titleShow"></div>
      <div class="col-12 col-sm-12 col-md-8 b">
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
        <iframe id="iframe" class="row" src="http://www.runoob.com" scrolling="auto" noresize>
          <p>您的浏览器不支持  iframe 标签。</p>
        </iframe>
      </div>
      <div class="col-md-2 c" v-if="titleShow"></div>
    </div>
  </div>
</template>
<script>
export default {
    name: 'Details',
    data () {
        return {
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
            ]
        }
    },
    methods : {
        changeMobsIframe: function () {
            const mobsf = document.getElementById('iframe')
            const deviceWIdth = document.body.clientWidth
            const deviceHeight = document.body.clientHeight
            mobsf.style.height = (Number(deviceHeight)) + 'px'
            console.log(mobsf.style.height)
        }
    },
    mounted() {
        this.changeMobsIframe()
        var _this = this;
        window.onresize = function(){ // 定义窗口大小变更通知事件
            _this.screenWidth = document.documentElement.clientWidth; //窗口宽度
            _this.changeMobsIframe()
        };
    },
    watch: {
        screenWidth: function(val){ //监听屏幕宽度变化
            if (val < 770) {
                this.titleShow = false
            }else {
                this.titleShow = true
            }
        }
    }
    // created: {
    //     this.setIframeHeight()
    // }
}
</script>
<style>
#details {
  background-image: url("http://xwzx.cumt.edu.cn/_upload/tpl/00/37/55/template55/images/shuiy.gif");
}
.center {
  background: rgb(51, 105,167);
}
.row {
  margin-right: 0px;
}
iframe {
  border: 0;
  margin-top: 7px;
  width: 100%;
  /*height: 100%;*/
}
</style>
