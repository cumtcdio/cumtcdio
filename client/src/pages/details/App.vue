<template>
  <div id="details">
    <index-header></index-header>
    <div class="line"></div>
    <div class="row center">
      <div class="col-md-2 col-lg-2 col-xl-2"></div>
      <div class="col-12 col-md-8 col-lg-8 col-xl-8">
        <nav-bar></nav-bar>
      </div>
      <div class="col-md-2 col-lg-8 col-xl-8"></div>
    </div>
    <details-content></details-content>
    <index-bottom></index-bottom>
  </div>
</template>
<script>
import IndexBottom from '../index/components/IndexBottom'
import IndexHeader from '../index/components/IndexHeader'
import NavBar from '../../common/nav/NavBar'
import DetailsContent from  './views/Content'
export default {
    name: 'Details',
    components: {
        IndexBottom,
        DetailsContent,
        IndexHeader,
        NavBar
    }
}
</script>
<style scoped>
.center {
  background: #C64718;
}
.line{
  height: 1px;
  color: gainsboro;
}
.row {
  margin-right: 0px;
  padding: 0px;
}
</style>
