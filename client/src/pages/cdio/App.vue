<template>
  <div id="cdio">
    <!-- 页头 -->
    <!--<div class="menu">-->
      <!--<el-menu :default-active="activeIndex" mode="horizontal" class="d-flex justify-content-center" style="height:50px">-->
        <!--<el-menu-item :index="item.index" v-for="(item, index) in menus" :key="index" :route="item.href" class="" style="height:50px;line-height:50px">-->
          <!--{{item.title}}-->
        <!--</el-menu-item>-->
      <!--</el-menu>-->
    <!--</div>-->
    <!-- 页头 -->
    <div class="bg" style="width:1900px">
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10 col-md-4">
                <img class="img0" src="https://get-1257609707.cos.ap-shanghai.myqcloud.com/8_%E8%87%AA%E5%AE%9A%E4%B9%89px_2019.03.22.png">
            </div>
            <div class="col-1"></div>
        </div>
    </div>
    <div class="line"></div>
    <!-- 导航栏 -->
    <div class="row center" style="width:1900px">
      <div class="col-md-2 col-lg-2 col-xl-2"></div>
      <div class="col-12 col-md-8 col-lg-8 col-xl-8">
        <nav class="navbar navbar-expand-md navbar-dark">
            <!--<a class="navbar-brand" href="#">Navbar</a>-->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="nav navbar-nav">
                    <li class="nav-item" v-for="item in menus" :key="item.id">
                        <a class="nav-link" style="color: #fff" :href="item.href">{{item.title}}</a>
                    </li>
                </ul>
            </div>
        </nav>
      </div>
      <div class="col-md-2 col-lg-8 col-xl-8"></div>
    </div>
    <div>
      <div class="d-flex">
        <div>
          <Card :padding="0" class="m-5 mycard">
              <CellGroup>
                  <Cell v-for="(item, index) in groups" :key="index" :name="index"
                  @click.native="changeCurrentGroup(index)"
                  >
                    <span style="width:200px">{{item.title}}</span>
                    <Icon type="ios-arrow-forward" slot="extra" />
                  </Cell>
              </CellGroup>
          </Card>
        </div>
        <div class="ml-5">
          <!-- 项目信息 -->
          <div class="card" style="width:1000px;margin-top:30px" v-loading="loading">
            <div class="card-header header">项目信息</div>
            <div class="card-body row">
              <div class="col-7">
                <div class="row">
                  <div class="col-6 d-flex">
                    <div style="min-width:80px">项目名称：</div>
                    <div>{{currentGroup.name}}</div>
                  </div>
                  <div class="col-6 d-flex">
                    <div style="min-width:80px">指导老师：</div>
                    <div>{{currentGroup.teacher}}</div>
                  </div>
                  <div class="col-6 mt-3 d-flex">
                    <div style="min-width:80px">成员：</div>
                    <div>{{currentGroup.member}}</div>
                  </div>
                </div>
              </div>
              <div class="col-5">
                <img class="teamImg" :src="currentGroup.teamImg" alt="">
              </div>
            </div> 
          </div>
          <!-- CDIO -->
          <table class="table mt-4 mr-5" v-loading="loading">
            <thead class="header-two text-center">
              <tr>
                <td>C</td>
                <td>D</td>
                <td>I</td>
                <td>O</td>
              </tr>
            </thead>
            <tbody class="text-center">
              <tr>
                <td>项目创意</td>
                <td>项目展示</td>
                <td>后端源码下载</td>
                <td>网络营销</td>
              </tr>
              <tr>
                <td>商业计划书</td>
                <td>前端源码</td>
                <td>数据库下载</td>
                <td>电子商务运营管理</td>
              </tr>
              <tr>
                <td>项目概要</td>
                <td></td>
                <td></td>
                <td>商务数据挖掘</td>
              </tr>
              <tr>
                <td>89</td>
                <td>90</td>
                <td>92</td>
                <td>98</td>
              </tr>
            </tbody>
          </table>
          <!-- 项目过程管理 -->
          <div class="card" style="width:1000px;margin-top:30px" v-loading="loading">
            <div class="card-header header-three">项目过程管理</div>
            <div class="card-body">
              <hr>
              <div class="row">
                <div class="col-3">
                  <CellGroup>
                      <Cell :title="item.event" :label="item.time" v-for="(item, index) in currentGroup.processManager.C" :key="index" style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
                        
                      </Cell>
                  </CellGroup>
                </div>
                <div class="col-3">
                  <CellGroup>
                      <Cell :title="item.event" :label="item.time" v-for="(item, index) in currentGroup.processManager.D" :key="index" style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
                        
                      </Cell>
                  </CellGroup>
                </div>
                <div class="col-3">
                  <CellGroup>
                      <Cell :title="item.event" :label="item.time" v-for="(item, index) in currentGroup.processManager.I" :key="index" style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
                        
                      </Cell>
                  </CellGroup>
                </div>
                <div class="col-3">
                  <CellGroup>
                      <Cell :title="item.event" :label="item.time" v-for="(item, index) in currentGroup.processManager.O" :key="index" style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
                        
                      </Cell>
                  </CellGroup>
                </div>
              </div>
              <hr>
            </div>
          </div>
        </div>
      </div>
    </div>



    <!-- 页脚 -->
    <div ref="bottom" class="bottom mt-4" style="width:1900px">
        <div class="line"></div>
        <div class="bg" style="height: 60px;line-height: 3rem;">
            <div class="bottomFont">
                <img class="photo" src="https://get-1257609707.cos.ap-shanghai.myqcloud.com/%E7%B3%BB%E5%BE%BD.png">
                <span>&nbsp;&nbsp;&nbsp;电子商务与数据科学系&nbsp;&nbsp;&nbsp;</span>
                <img class="photo" src="https://get-1257609707.cos.ap-shanghai.myqcloud.com/%E7%B3%BB%E5%BE%BD.png">
                <span>&nbsp;&nbsp;&nbsp;微信公众号&nbsp;&nbsp;&nbsp;</span>
            </div>
        </div>
    </div>
  </div>
</template>

<script>
  export default {
      data() {
      return {
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
        ],
        loading: false,
        currentIndex: '0',
        activeIndex:'4',
        groups: [
          {
            title:'第一组',
            name: '校园移动微创客联盟',
            teacher: '冯文龙',
            member: 'XXX、XXX、XXX、XXX、XXX',
            teamImg: 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1967724590,2451003767&fm=11&gp=0.jpg',
            processManager:{
              C:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
              ],
              D:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
              ],
              I:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
              ],
              O:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
              ],
            },
          },
          {
            title:'第二组',
            name: '吃货联盟',
            teacher: '张卫华',
            member: 'XXX、XXX、XXX、XXX、XXX',
            teamImg: 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1967724590,2451003767&fm=11&gp=0.jpg',
            processManager:{
              C:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
              ],
              D:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计完成前端首页设计'
                  },
              ],
              I:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
              ],
              O:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
              ],
            },
          },
          {
            title:'第三组',
            name: '校园移动微创客联盟',
            teacher: '冯文龙',
            member: 'XXX、XXX、XXX、XXX、XXX',
            teamImg: 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1967724590,2451003767&fm=11&gp=0.jpg',
            processManager:{
              C:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
              ],
              D:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计完成前端首页设计'
                  },
              ],
              I:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
              ],
              O:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
              ],
            },
          },
          {
            title:'第四组',
            name: '校园移动微创客联盟',
            teacher: '冯文龙',
            member: 'XXX、XXX、XXX、XXX、XXX',
            teamImg: 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1967724590,2451003767&fm=11&gp=0.jpg',
            processManager:{
              C:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
              ],
              D:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计完成前端首页设计'
                  },
              ],
              I:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
              ],
              O:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
              ],
            },
          },
          {
            title:'第五组',
            name: '校园移动微创客联盟',
            teacher: '冯文龙',
            member: 'XXX、XXX、XXX、XXX、XXX',
            teamImg: 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1967724590,2451003767&fm=11&gp=0.jpg',
            processManager:{
              C:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
              ],
              D:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计完成前端首页设计'
                  },
              ],
              I:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
              ],
              O:[
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
                  {
                    time: '2019/3/20',
                    event: '完成前端首页设计'
                  },
              ],
            },
          },
        ],
      }
    },
    computed: {
      currentGroup() {
        return this.groups[this.currentIndex] 
      }
    },
    methods: {
      changeCurrentGroup(index) {
        this.loading = true;
        setTimeout(() => {
          this.loading = false;
        }, 400);
        this.currentIndex = index
      }
    },
  }
</script>


<style scoped>
.ivu-cell-main{
  width: 100%;
}
.line{
  height: 1px;
  color: gainsboro;
}
.header-three{
  background: linear-gradient(180deg, rgba(217, 237, 247, 1) 0%, rgba(217, 237, 247, 1) 0%, rgba(196, 227, 243, 1) 100%, rgba(196, 227, 243, 1) 100%)
}
.table{
  border: 1px solid rgba(0,0,0,.125);
  width: 1000px;
}
.header-two{
  background:linear-gradient(180deg, rgba(242, 222, 222, 1) 0%, rgba(242, 222, 222, 1) 0%, rgba(235, 204, 204, 1) 100%, rgba(235, 204, 204, 1) 100%);
}
.teamImg{
  max-width: 80%;
}
.header{
  background:linear-gradient(180deg, rgba(66, 139, 202, 1) 0%, rgba(66, 139, 202, 1) 0%, rgba(53, 126, 189, 1) 100%, rgba(53, 126, 189, 1) 100%);
  color: #fff;
}
.mycard{
  width: 200px;
  box-shadow: 0px 5px 12px 0 rgba(42,51,83,.12), 0px 0px 5px rgba(0,0,0,.06);
}
.mycard:hover {
    transition: all .3s;
    box-shadow: 0px 8px 20px 0 rgba(19, 23, 37, 0.12), 0 5px 5px rgba(0,0,0,.06);
}
.center {
  background: #C64718;
}
.bg{
background-color: #C64718;
/*height: 8rem;*/
}
.img0{
    width: 100%;
    /*height: 5rem;*/
}
.bottomFont{
    color: white;
    margin-left: 10%;
}
.photo{
    height: 2rem;
}
.line{
    height: 0.1rem;
    color: gainsboro;
}
.bottom{
    width:100%;
    bottom: 0;
}
.bottom-position {
    position: fixed;
}
</style>
