<template>
    <div>
        <div class="line"></div>
        <div class="block">
            <el-carousel :height="bannerH +'px'">
                <el-carousel-item v-for="item of image"
                                  :key="item.id">
                    <!--<img :src="item.img" :to="item.articleAddress" class="wraper-img" width="100%">-->
                    <a target="_blank" :href="item.articleAddress"><img :src="item.img" class="wraper-img" width="100%"></a>
                    <!--<router-link :to="item.articleAddress"><img :src="item.img" class="wraper-img" width="100%"></router-link>-->
                </el-carousel-item>
            </el-carousel>
        </div>
    </div>
</template>
<script>
    import axios from 'axios'
    export default {
        name: "IndexSlide",
        data () {
            return {
                bannerH:250,
                image: {}
            }
        },
        mounted(){
            this.setBannerH()
            window.addEventListener('resize', () => {
                this.setBannerH()
            }, false)
            this.getSlideData()
        },
        methods:{
            setBannerH(){
                this.bannerH = document.body.clientWidth / 3
            },
            getSlideData: function () {
                axios.get('/api/show/getFrontSlide').then(response => {
                    this.getSlideSucc(response)
                })
            },
            getSlideSucc: function (res) {
                var data = res.data
                if (data.code === 0 && data.data) {
                    this.image = data.data
                }
            }
        },
        created(){}
        }
</script>

<style scoped>
    .line{
        height: 1px;
        color: gainsboro;
    }
</style>
