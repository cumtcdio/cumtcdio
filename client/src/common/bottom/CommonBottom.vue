<template>
    <!--:class="{'bottom-position': position}"-->
    <div id="bottom" class="bottom">
        <div class="line"></div>
        <div class="bg">
            <div class="bottomFont">
                <img class="photo" src="https://get-1257609707.cos.ap-shanghai.myqcloud.com/3%E2%80%BB%E8%83%8C%E6%99%AF%E7%B3%BB%E5%BE%BD.jpg">
                <span>&nbsp;&nbsp;&nbsp;电子商务与数据科学系&nbsp;&nbsp;&nbsp;</span>
                <img class="photo" src="https://get-1257609707.cos.ap-shanghai.myqcloud.com/%E5%BE%AE%E4%BF%A1%E5%85%AC%E4%BC%97%E5%8F%B7.jpg">
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
                // screenHeight: window.innerHeight,
                // topHeight: '',
                // position: false
            }
        },
        mounted () {
            // this.screenHeight = window.innerHeight
            // this.topHeight = document.getElementById("bottom").offsetTop
            // if (this.screenHeight >= this.topHeight + 80) {
            //     this.position = true
            // } else {
            //     this.position = false
            // }
        },
        watch: {

        }
    }
</script>

<style scoped>
    .bg{
        background-color: #024E98;
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
    /*.bottom-position {*/
        /*position: fixed;*/
    /*}*/
</style>
