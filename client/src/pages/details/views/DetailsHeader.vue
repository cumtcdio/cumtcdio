<template>
    <div class="row">
        <div class="col-md-2 col-lg-2 col-xl-2"></div>
        <div class="col-12 col-md-8 col-lg-8 col-xl-8 wrapper">
            <index-header></index-header>
        </div>
        <div class="col-md-2 col-lg-2 col-xl-2"></div>
    </div>
</template>
<script>
import IndexHeader from '../../index/components/IndexHeader'
export default {
    name: 'DetailsHeader',
    components: {
        IndexHeader,
    }
}
</script>
<style scoped>
.row{
    margin: 0;
}
.wrapper{
    margin: 0;
    padding: 0;
}
</style>
