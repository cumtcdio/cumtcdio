<template>
    <div>
        <common-bottom></common-bottom>
        <div class="bottom">
            <div class="footer">
                <p>版权所有:<span>中国矿业大学电子商务与数据科学系&nbsp;</span>
                    地址:<span>江苏省徐州市大学路1号中国矿业大学南湖校区&nbsp;</span>
                    邮编:<span>221116&nbsp;</span>
                    苏ICP备案19017115号-1
                </p>
            </div>
        </div>
    </div>
</template>

<script>
    import CommonBottom from '../../../common/bottom/CommonBottom'
    export default {
        name: "IndexBottom",
        components:{
            CommonBottom
        }
    }
</script>

<style scoped>
.bottom {
    background-color: black;
}
.footer{
    display: inline;
    text-align: center;
    color: white;
}
</style>
