<template>
  <div>
      <index-header></index-header>
      <index-slide></index-slide>
      <Content></Content>
      <index-bottom></index-bottom>
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
    .bottom {
        background-color: black;
    }
    .footer{
        display: inline;
        text-align: center;
        color: white;
    }
</style>
