<template>
  <div id="app">
    <el-container class="home-container">
      <el-header class="home-header">
        <span class="home_title">电子商务与数据科学系</span>
      </el-header>
      <el-container>
        <el-aside width="180px" class="home-aside">
          <el-menu default-active="1" class="el-menu-vertical-demo">
            <el-submenu index="1">
              <template slot="title">
                <!--<i class="el-icon-location"></i>-->
                <span>测试</span>
              </template>
            </el-submenu>
            <el-menu-item index="2">
              <!--<i class="el-icon-menu"></i>-->
              <router-link to="/slide" slot="title">轮播图</router-link>
            </el-menu-item>
            <el-menu-item index="2">
              <!--<i class="el-icon-menu"></i>-->
              <router-link to="/cdio" slot="title">CUMT-CDIO</router-link>
            </el-menu-item>
            <el-menu-item index="3">
              <!--<i class="el-icon-document"></i>-->
              <router-link to="/show" slot="title">文章管理</router-link>
            </el-menu-item>
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
