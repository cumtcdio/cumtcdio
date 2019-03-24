<template>
    <div>
        <div class="row">
            <div class="col-md-2 col-lg-2 col-xl-2"></div>
            <div class="col-12 col-md-8 col-lg-8 col-xl-8 wrapper">
                <div>
                    <select v-model="title">
                        <option v-for="(item,index) in titles" :key="index">
                            {{item}}
                        </option>
                    </select>
                </div>
                <iframe id="iFrame1" name="iFrame1" width="100%"
                        frameborder="0" :src="details.src"
                        scrolling="no"></iframe>
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
                titles: ['通知', '新闻'],
                title: '通知',
                details: {}
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
            this.getDetailsData()
        },
        methods: {
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
        },
        watch: {
            title: function () {
                this.getDetailsData()
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
