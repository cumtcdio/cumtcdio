<template>
    <!--:class="{'bottom-position': position}"-->
    <div id="bottom" class="bottom">
        <div class="line"></div>
        <div class="bg">
            <div class="bottomFont">
                <img class="photo" src="http://slide-1257444045.cos.ap-shanghai.myqcloud.com/b312a710-a8c2-45d7-94d1-b68d8e3876a5.jpg">
                <span>&nbsp;&nbsp;&nbsp;电子商务与数据科学系&nbsp;&nbsp;&nbsp;</span>
                <img class="photo" src="http://slide-1257444045.cos.ap-shanghai.myqcloud.com/00646f06-671c-418f-aa44-b8601f3637cd.jpg">
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
