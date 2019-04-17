<template>
  <div id="app">
    <el-container class="home-container">
      <el-header class="home-header">
        <span class="home_title">电子商务与数据科学系</span>
      </el-header>
      <el-container>
        <el-aside width="180px" class="home-aside">
          <el-menu default-active="1" class="el-menu-vertical-demo" style="background: #ececec;width: 180px;" router>
            <el-submenu v-for="item in routes" :key="item.id" :index="item.id+''">
              <template slot="title">
                <i :class="item.icon"></i>
                <span>{{item.name}}</span>
              </template>
              <el-menu-item v-for="child in item.child" :key="child.id" :index="child.path">
                <!--<i class="el-icon-menu"></i>-->
                <span slot="title">{{child.name}}</span>
              </el-menu-item>
            </el-submenu>
          </el-menu>
        </el-aside>
        <el-main>
          <keep-alive>
            <router-view></router-view>
          </keep-alive>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
      return {
          routes: [
              {id: 1, name: '轮播图', icon: 'el-icon-picture', child: [
                      {id: 1, name: '轮播图', path: '/slide'},
                  ]},
              {id: 2, name: '文章管理',icon: 'el-icon-document', child: [
                      {id: 1, name: '通知', path: '/show/0'},
                      {id: 2, name: '新闻', path: '/show/1'},
                      {id: 3, name: '师生风采', path: '/show/2'},
                      {id: 4, name: '专业信息', path: '/show/3'},
                      {id: 5, name: '专业实习', path: '/show/4'}
                  ]},
              {id: 3, name: 'CUMT-CDIO', icon: 'el-icon-info', child: [
                      {id: 1, name: '项目组管理', path: '/cdio'},
                      {id: 2, name: 'cdio管理', path: '/cdio/admin'}
                  ]}
          ]
      }
  }
}
</script>

<style>
  .home-container {
    height: 100%;
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
  }
  .home-header {
    background-color: #20a0ff;
    color: #333;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: space-between;
    box-sizing: content-box;
    padding: 0px;
  }
  .home-aside {
    background-color: #ECECEC;
  }
  .home_title {
    color: #fff;
    font-size: 22px;
    display: inline;
    margin-left: 8px;
  }
</style>
