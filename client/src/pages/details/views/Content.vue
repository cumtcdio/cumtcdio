<template>
    <div>
        <div class="row">
            <div class="col-md-2 col-lg-2 col-xl-2"></div>
            <div class="col-12 col-md-8 col-lg-8 col-xl-8 wrapper">
                <iframe id="iFrame1" name="iFrame1" width="100%"
                        frameborder="0" src="	https://test-1257444045.cos.ap-beijing.myqcloud.com/test..html"
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
            }
        },
        // onload="this.height=iFrame1.document.body.scrollHeight"
        mounted () {
            window.onload = function(){
                window.addEventListener('message',function(event){
                    if(event.origin == "https://test-1257444045.cos.ap-beijing.myqcloud.com") {
                        document.getElementById('iFrame1').style.height = event.data + "px";
                    }
                })
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
</style>
