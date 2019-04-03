<template>
    <!--头部内容-->
    <div>{{title}}</div>
</template>
<script>
    export default {
        name: 'ShowHeader',
        data() {
            return{
                title: ''
            }
        },
        methods: {
            getTitleFromRoute: function () {
                var id  = parseInt(this.$route.params.id);
                switch (id){
                    case 1: this.title = '通知';
                        break;
                    case 2: this.title = '新闻';
                        break;
                    case 3: this.title = '师生风采';
                        break;
                    case 4: this.title = '专业信息';
                        break;
                    case 5: this.title = '专业实习';
                        break;
                    default:
                        break;
                }
            }
        },
        mounted() {
            this.getTitleFromRoute()
        },
        watch: {
            $route: function () {
                this.getTitleFromRoute()
            }
        }
    }
</script>
<style scoped>

</style>