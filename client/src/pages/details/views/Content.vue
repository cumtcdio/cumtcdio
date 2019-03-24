<template>
    <div>
        <div class="row">
            <div class="col-md-2 col-lg-2 col-xl-2"></div>
            <div class="col-12 col-md-8 col-lg-8 col-xl-8 wrapper">
                <!--<iframe id="iframe" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12" src="http://www.runoob.com" scrolling="auto" noresize>-->
                    <!--<p>您的浏览器不支持  iframe 标签。</p>-->
                <!--</iframe>-->
                <iframe id="iFrame1" name="iFrame1" width="100%"
                        onload="this.height=iFrame1.document.body.scrollHeight" frameborder="0" src="http://blog-1258589922.cos.ap-beijing.myqcloud.com/b8e7f650-0c3b-4782-b472-e31acf89f2fe.html"
                        scrolling="no"></iframe>
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
/*iframe {*/
    /*border: 0;*/
    /*margin-top: 7px;*/
    /*width: 100%;*/
    /*margin-bottom: 57px;*/
/*}*/
</style>
