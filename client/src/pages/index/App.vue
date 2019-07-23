<template>
  <div>
      <index-header></index-header>
      <index-slide></index-slide>
      <Content></Content>
      <index-bottom></index-bottom>
      <div class="bottom">
          <div class="footer">
              <p style="line-height: 15px;font-size: 15px">版权所有:<span>中国矿业大学电子商务与数据科学系&nbsp;</span></p>
              <p style="line-height: 15px;font-size: 15px">
                  地址:<span>江苏省徐州市大学路1号中国矿业大学南湖校区&nbsp;</span>
                  邮编:<span>221116&nbsp;</span>
              </p>
              <p style="line-height: 15px;font-size: 15px">
                  苏ICP备案 19017115号-1
              </p>
              <p style="line-height: 15px;font-size: 15px">
                  <a target="_blank" href="www.cumtcdio.cn"
                     style="display:inline-block;text-decoration:none;color: #666666;">
                      <img src="../../assets/img/beian.png" style="float:left;"/>
                      <span>苏公网安备 32031102001218号</span>
                  </a>
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
        background-color: #EFEFEF;
    }
    .footer{
        display: inline;
        text-align: center;
        color: #666666;
    }
</style>
