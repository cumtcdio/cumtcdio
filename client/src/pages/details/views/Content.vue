<template>
    <div>
        <div class="row">
            <div class="col-md-2 col-lg-2 col-xl-2"></div>
            <div class="col-12 col-md-8 col-lg-8 col-xl-8 wrapper">
                <div class="details-title">{{details.title}}</div>
                <hr />
                <iframe id="iFrame1" name="iFrame1" width="100%"
                        frameborder="0" :src="details.src"
                        scrolling="no"></iframe>
                <div v-if="!titleIsNews">
                    <div class="details-from">{{details.from}}</div><br>
                    <div class="details-from">{{details.date_time}}</div>
                </div>
                <div class="details-right-form" v-else>
                    <div>新闻来源：{{details.newsFrom}}</div>
                    <div>摄影：{{details.photo}}</div>
                    <div>责任编辑：{{details.editor}}</div>
                    <div>审查：{{details.audit}}</div>
                </div>
            </div>
            <div class="col-md-2 col-lg-2 col-xl-2"></div>
        </div>
    </div>
</template>
<script>
import axios from 'axios'
    export default {
        name: 'Details',
        components: {
        },
        data () {
            return {
                title: '通知',
                titleIsNews: false,
                details: {}
            }
        },
        // onload="this.height=iFrame1.document.body.scrollHeight"
        mounted () {
            window.onload = function(){
                window.addEventListener('message',function(event){
                    if(event.origin == "https://test-1257444045.cos.ap-beijing.myqcloud.com") {
                        document.getElementById('iFrame1').style.height = event.data + 20 + "px";
                    }
                })
            }
            this.doInitToGetParams()
        },
        methods: {
            doInitToGetParams: function () {
                var reg = new RegExp("(^|&)" + 'title' + "=([^&]*)(&|$)", "i");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) {
                    this.title = decodeURI(r[2]);
                    if (this.title === '通知') {
                        this.titleIsNews = false
                    }else {
                        this.titleIsNews = true
                    }
                } else {
                    alert("something wrong happened！")
                }
                this.getDetailsData()
            },
            getDetailsData: function () {
                if (this.title === "通知"){
                    axios.get('/api/tongzhi/tzDetails.json').then(response => {
                        this.getDetailsSucc(response)
                    })
                }else {
                    axios.get('/api/news/newsDetails.json').then(response => {
                        this.getDetailsSucc(response)
                    })
                }
            },
            getDetailsSucc: function (res) {
                var data = res.data
                if (data.ret) {
                    this.details = data
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
    background-color: #C64718;
}
.details-from{
    float: right;
}
.details-right-form {
    float: left;
}
.wrapper{
    margin: 0;
    padding: 0;
}
</style>
