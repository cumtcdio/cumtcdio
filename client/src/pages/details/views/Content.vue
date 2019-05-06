<template>
    <div>
        <div class="row ql-container ql-snow">
            <div class="col-md-2 col-lg-2 col-xl-2"></div>
            <div class="col-12 col-md-8 col-lg-8 col-xl-8 wrapper">
                <div class="details-title">{{details.title}}</div>
                <hr />
                <div class="ql-editor">
                    <iframe id="iFrame1" name="iFrame1" width="100%"
                            frameborder="0" :src="details.htmlAddress"
                            scrolling="no"></iframe>
                </div>
            </div>
            <div class="col-md-2 col-lg-2 col-xl-2"></div>
        </div>
    </div>
</template>
<script>
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'
import axios from 'axios'
    export default {
        name: 'Details',
        components: {
        },
        data () {
            return {
                title: '通知',
                titleParam: 1,
                titleIsNews: false,
                details: {}
            }
        },
        // onload="this.height=iFrame1.document.body.scrollHeight"
        mounted () {
            window.onload = function(){
                window.addEventListener('message',function(event){
                    if(event.origin == "http://show-1257444045.cos.ap-shanghai.myqcloud.com") {
                        document.getElementById('iFrame1').style.height = event.data + 20 + "px";
                    }
                })
            }
            this.doInitToGetParams()
        },
        methods: {
            doInitToGetParams: function () {
                var reg = new RegExp("(^|&)" + 'showId' + "=([^&]*)(&|$)", "i");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) {
                    this.titleParam = decodeURI(r[2]);
                } else {
                    alert("something wrong happened！")
                }
                this.getDetailsData()
            },
            getDetailsData: function () {
                axios.get('/api/show/getShowDetailsByShowId/' + this.titleParam).then(response => {
                    this.getDetailsSucc(response)
                })
            },
            getDetailsSucc: function (res) {
                var data = res.data
                if (data.code === 0 && data.data) {
                    this.details = data.data
                }
            }
        }
    }
</script>
<style scoped>
.row {
    margin: 0px;
    margin-bottom: 67px;
}
.details-title {
    text-align: center;
    font-size: 2rem
}
hr{
    height: .1rem;
    background-color: #024E98;
}
.wrapper{
    margin: 0;
    padding: 0;
}
</style>
