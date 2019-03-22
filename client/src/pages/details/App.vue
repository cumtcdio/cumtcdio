<template>
  <div id="details">
    <details-header></details-header>
    <details-content></details-content>
    <index-bottom></index-bottom>
  </div>
</template>
<script>
import IndexBottom from '../index/components/IndexBottom'
import DetailsHeader from './views/DetailsHeader'
import DetailsContent from  './views/Content'
export default {
    name: 'Details',
    components: {
        IndexBottom,
        DetailsContent,
        DetailsHeader
    }
}
</script>
<style scoped>
#details {
  background-image: url("http://xwzx.cumt.edu.cn/_upload/tpl/00/37/55/template55/images/shuiy.gif");
}
.row {
  margin: 0px;
  padding: 0px;
}
</style>
