<template>
    <div ref="bottom" class="bottom" :class="{'bottom-position': position}">
        <div class="line"></div>
        <div class="bg">
            <div class="bottomFont">
                <img class="photo" src="https://get-1257609707.cos.ap-shanghai.myqcloud.com/%E7%B3%BB%E5%BE%BD.png">
                <span>&nbsp;&nbsp;&nbsp;电子商务与数据科学系&nbsp;&nbsp;&nbsp;</span>
                <img class="photo" src="https://get-1257609707.cos.ap-shanghai.myqcloud.com/%E7%B3%BB%E5%BE%BD.png">
                <span>&nbsp;&nbsp;&nbsp;微信公众号&nbsp;&nbsp;&nbsp;</span>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "CommonBottom",
        data () {
            return {
                screenHeight: window.innerHeight,
                topHeight: '',
                position: false
            }
        },
        mounted () {
            // var bottom = document.getElementById('bottom')
            this.screenHeight = window.innerHeight
            // this.height = document.body.clientHeight
            // this.topHeight =  bottom.offsetTop
            this.topHeight = this.$refs.bottom.getBoundingClientRect().top
            if (this.screenHeight >= this.topHeight + 500) {
                this.position = true
            } else {
                this.position = false
            }
        },
        watch: {

        }
    }
</script>

<style scoped>
    .bg{
        background-color: #C64718;
        height: 60px;
        line-height: 3rem;
    }
    .bottomFont{
        color: white;
        margin-left: 10%;
    }
    .photo{
        height: 2rem;
    }
    .line{
        height: 0.1rem;
        color: gainsboro;
    }
    .bottom{
        width:100%;
        bottom: 0;
    }
    .bottom-position {
        position: fixed;
    }
</style>
