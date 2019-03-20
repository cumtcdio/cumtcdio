<template>
  <div id="cdio">
    <!-- 页头 -->

    <div class="menu">
      <el-menu :default-active="activeIndex" mode="horizontal" class="d-flex justify-content-center" style="height:50px">
        <el-menu-item :index="item.index" v-for="(item, index) in menus" :key="index" :route="item.href" class="" style="height:50px;line-height:50px">
          {{item.title}}
        </el-menu-item>
      </el-menu>
    </div>
    <div class="container-fluid">
      <Card :padding="0" class="m-5 mycard">
          <CellGroup>
              <Cell :title="item.title"  v-for="(item, index) in groups" :key="index">
                <Icon type="ios-arrow-forward" slot="extra" />
              </Cell>
          </CellGroup>
      </Card>
    </div>



    <!-- 页尾 -->

  </div>
</template>

<script>
  export default {
    data() {
      return {
        activeIndex:'4',
        groups: [
          {
            title:'第一组'
          },
          {
            title:'第二组'
          },
          {
            title:'第三组'
          },
          {
            title:'第四组'
          },
          {
            title:'第五组'
          },
          {
            title:'第六组'
          },
          {
            title:'第七组'
          },
        ],
        menus: [
          {
            index: '1',
            title: '首页',
            href: '#'
          },
          {
            index: '2',
            title: '通知',
            href: '#'
          },
          {
            index: '3',
            title: '新闻',
            href: '#'
          },
          {
            index: '4',
            title: 'EC-CDIO项目教学',
            href: '#'
          },
          {
            index: '5',
            title: '师生风采',
            href: '#'
          },
          {
            index: '6',
            title: '专业信息',
            href: '#'
          },
          {
            index: '7',
            title: '电子商务专业实习',
            href: '#'
          }
        ]
      }
    },
  }
</script>


<style scoped>
.mycard{
  width: 200px;
  box-shadow: 0px 5px 12px 0 rgba(42,51,83,.12), 0px 0px 5px rgba(0,0,0,.06);
}
.mycard:hover {
    transition: all .3s;
    box-shadow: 0px 8px 20px 0 rgba(19, 23, 37, 0.12), 0 5px 5px rgba(0,0,0,.06);
}
</style>
