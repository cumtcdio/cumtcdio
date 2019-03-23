<template>
    <div>
        <div class="row">
            <div class="col-md-2 col-lg-2 col-xl-2"></div>
            <div class="col-12 col-md-8 col-lg-8 col-xl-8 wrapper">
                <iframe id="iframe" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12" src="http://www.runoob.com" scrolling="auto" noresize>
                    <p>您的浏览器不支持  iframe 标签。</p>
                </iframe>
            </div>
            <div class="col-md-2 col-lg-2 col-xl-2"></div>
        </div>
    </div>
</template>
<script>

    export default {
        name: 'Details',
        components: {
        },
        data () {
            return {
                titleShow: true,
                timer: null,
                screenWidth: document.body.clientWidth
            }
        },
        methods : {
            changeMobsIframe: function () {
                const mobsf = document.getElementById('iframe')
                // const deviceWIdth = document.body.clientWidth
                const deviceHeight = document.body.clientHeight
                mobsf.style.height = (Number(deviceHeight)) + 'px'
                // console.log(mobsf.style.height)
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
    }
</script>
<style scoped>
.row {
    margin: 0px;
}
.wrapper{
    margin: 0;
    padding: 0;
}
iframe {
    border: 0;
    margin-top: 7px;
    width: 100%;
    margin-bottom: 57px;
}
</style>
