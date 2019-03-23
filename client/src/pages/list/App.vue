<template>
    <div id="list">
        <index-header></index-header>
        <list-content></list-content>
        <index-bottom></index-bottom>
    </div>
</template>
<script>
import IndexHeader from '../index/components/IndexHeader'
import IndexBottom from '../index/components/IndexBottom'
import ListContent from './views/Content'
    export default {
        name: 'ListIndex',
        components: {
            IndexHeader,
            IndexBottom,
            ListContent
        }
    }
</script>
<style scoped>

</style>
