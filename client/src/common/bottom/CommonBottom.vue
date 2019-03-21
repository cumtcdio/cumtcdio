<template>
    <div class="bottom">
        <div class="line"></div>
        <div class="bg">
            <div class="bottomFont">
                <img class="photo" src="https://get-1257609707.cos.ap-shanghai.myqcloud.com/0.jpg">
                <span>&nbsp;&nbsp;&nbsp;电子商务与数据科学系&nbsp;&nbsp;&nbsp;</span>
                <img class="photo" src="https://get-1257609707.cos.ap-shanghai.myqcloud.com/0.jpg">
                <span>&nbsp;&nbsp;&nbsp;微信公众号&nbsp;&nbsp;&nbsp;</span>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "CommonBottom"
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
    /*.left{*/
        /*width: 20%;*/
    /*}*/
    .line{
        height: 0.1rem;
        color: gainsboro;
    }
    .bottom{
        width:100%
    }
</style>
