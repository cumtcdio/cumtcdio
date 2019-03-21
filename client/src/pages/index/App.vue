<template>
  <div>
      <index-header></index-header>
      <index-slide></index-slide>
      <Content></Content>
      <index-bottom></index-bottom>
  </div>
</template>

<script>
  import IndexHeader from './components/IndexHeader'
  import IndexSlide from './components/IndexSlide'
  import IndexBottom from './components/IndexBottom'
  import Content from './components/Content'
  export default {
      name: 'Index',
      components: {
          IndexSlide,
          IndexHeader,
          IndexBottom,
          Content
      }
  }
</script>
<style scoped>
</style>
