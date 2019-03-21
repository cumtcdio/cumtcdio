<template>
    <div>
        <div class="line"></div>
        <div class="block">
            <el-carousel :height="bannerH +'px'">
                <el-carousel-item v-for="item of image"
                                  :key="item.id">
                    <img :src="item.imgUrl" class="wraper-img"width="100%">
                </el-carousel-item>
            </el-carousel>
        </div>
    </div>
</template>
<script>
    export default {
        name: "IndexSlide",
        data () {
            return {
                bannerH:200,
                image: [{
                    id: 1,
                    imgUrl: 'https://get-1257609707.cos.ap-shanghai.myqcloud.com/01.jpg'
                }, {
                    id: 2,
                    imgUrl: 'https://get-1257609707.cos.ap-shanghai.myqcloud.com/04.jpg'
                }, {
                    id: 3,
                    imgUrl: 'https://get-1257609707.cos.ap-shanghai.myqcloud.com/05.jpg'
                }]
            }
        },
    methods:{
        setBannerH(){
            this.bannerH = document.body.clientWidth / 4
        }
    },
    mounted(){
        this.setBannerH()
        window.addEventListener('resize', () => {
            this.setBannerH()
        }, false)
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
