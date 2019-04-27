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
    <div class="bg" style="width:1600px">
        <div>
            <img class="img0 ml-5" src="https://get-1257609707.cos.ap-shanghai.myqcloud.com/3%E2%80%BB%E7%B3%BB%E5%BE%BD%2B%E7%B3%BB%E5%90%8D-1-3.jpg">
        </div>
    </div>
    <div class="line"></div>
    <!-- 导航栏 -->
    <div class="center" style="width:1600px">
        <nav class="navbar navbar-expand-md navbar-dark" style="margin-left:400px">
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
                  <div class="col-12 mt-3 d-flex">
                    <div style="min-width:80px">成员：</div>
                    <div>{{currentGroup.member}}</div>
                  </div>
                  <div class="col-12 mt-3 d-flex">
                    <div style="min-width:80px">项目简介：</div>
                    <div>{{currentGroup.desc}}</div>
                  </div>
                </div>
              </div>
              <div class="col-5">
                <img class="teamImg" :src="currentGroup.teamImg" alt="">
              </div>
            </div>
          </div>
          <!-- CDIO -->

          <table class="table mt-4 mr-5 table-bordered" v-loading="loading">
            <thead class="header-two text-center">
              <tr>
                <th>C</th>
                <th>D</th>
                <th>I</th>
                <th>O</th>
              </tr>
            </thead>
            <tbody class="text-center">
              <tr>
                <td>
                  <el-select v-model="cIndex" placeholder="请选择" size="medium">
                    <el-option
                      v-for="(course,index) in currentGroup.c"
                      :key="index"
                      :label="course.courseName"
                      :value="index">
                    </el-option>
                  </el-select>
                </td>
                <td>
                  <el-select v-model="dIndex" placeholder="请选择" size="medium">
                    <el-option
                      v-for="(course,index) in currentGroup.d"
                      :key="index"
                      :label="course.courseName"
                      :value="index">
                    </el-option>
                  </el-select>
                </td>
                <td>
                  <el-select v-model="iIndex" placeholder="请选择" size="medium">
                    <el-option
                      v-for="(course,index) in currentGroup.i"
                      :key="index"
                      :label="course.courseName"
                      :value="index">
                    </el-option>
                  </el-select>
                </td>
                <td>
                  <el-select v-model="oIndex" placeholder="请选择" size="medium">
                    <el-option
                      v-for="(course,index) in currentGroup.o"
                      :key="index"
                      :label="course.courseName"
                      :value="index">
                    </el-option>
                  </el-select>
                </td>
              </tr>
              <!-- achievement -->
              <tr>
                <td style="margin:0;padding:0">
                  <div v-for="(item,index) in currentGroup.c[cIndex].achievement" :key="index" class="achievement">
                    <a :href="item.address">{{item.name}}</a>
                  </div>
                </td>
                <td style="margin:0;padding:0">
                  <div v-for="(item,index) in currentGroup.d[dIndex].achievement" :key="index" class="achievement">
                    <a :href="item.address">{{item.name}}</a>
                  </div>
                </td>
                <td style="margin:0;padding:0">
                  <div v-for="(item,index) in currentGroup.i[iIndex].achievement" :key="index" class="achievement">
                    <a :href="item.address">{{item.name}}</a>
                  </div>
                </td>
                <td style="margin:0;padding:0">
                  <div v-for="(item,index) in currentGroup.o[oIndex].achievement" :key="index" class="achievement">
                    <a :href="item.address">{{item.name}}</a>
                  </div>
                </td>
              </tr>
              <!-- processManage -->
              <tr class="table-secondary">
                <td>项目过程管理</td>
                <td>项目过程管理</td>
                <td>项目过程管理</td>
                <td>项目过程管理</td>
              </tr>
              <tr>
                <td style="margin:0;padding:0;cursor:pointer">
                  <div v-for="(item,index) in currentGroup.c[cIndex].processManage" :key="index" class="achievement" @click="cDialogShow(index)">
                    <div style="position:relative">
                      <div class="ellipsis">{{item.title}}</div>
                      <div class="time text-muted">{{item.time}}</div>
                    </div>
                  </div>
                </td>
                <td style="margin:0;padding:0;cursor:pointer">
                  <div v-for="(item,index) in currentGroup.d[dIndex].processManage" :key="index" class="achievement" @click="dDialogShow(index)">
                    <div style="position:relative">
                      <div class="ellipsis">{{item.title}}</div>
                      <div class="time text-muted">{{item.time}}</div>
                    </div>
                  </div>
                </td>
                <td style="margin:0;padding:0;cursor:pointer">
                  <div v-for="(item,index) in currentGroup.i[iIndex].processManage" :key="index" class="achievement" @click="iDialogShow(index)">
                    <div style="position:relative">
                      <div class="ellipsis">{{item.title}}</div>
                      <div class="time text-muted">{{item.time}}</div>
                    </div>
                  </div>
                </td>
                <td style="margin:0;padding:0;cursor:pointer">
                  <div v-for="(item,index) in currentGroup.o[oIndex].processManage" :key="index" class="achievement" @click="oDialogShow(index)">
                    <div style="position:relative">
                      <div class="ellipsis">{{item.title}}</div>
                      <div class="time text-muted">{{item.time}}</div>
                    </div>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
          <el-dialog
            title="项目过程管理"
            :visible.sync="dialogVisible"
            width="30%">
            <div v-text="dialogContent.title"></div>
            <div v-text="dialogContent.time"></div>
            <div v-text="dialogContent.require"></div>
            <div v-text="dialogContent.content"></div>
          </el-dialog>
        </div>
      </div>
    </div>

    <!-- 页脚 -->
    <div ref="bottom" class="bottom mt-4" style="width:1600px">
        <div class="line"></div>
        <div class="bg" style="height: 60px;line-height: 3rem;">
            <div class="bottomFont">
                <img class="photo" src="https://get-1257609707.cos.ap-shanghai.myqcloud.com/3%E2%80%BB%E8%83%8C%E6%99%AF%E7%B3%BB%E5%BE%BD.jpg">
                <span>&nbsp;&nbsp;&nbsp;电子商务与数据科学系&nbsp;&nbsp;&nbsp;</span>
                <img class="photo" src="https://get-1257609707.cos.ap-shanghai.myqcloud.com/%E5%BE%AE%E4%BF%A1%E5%85%AC%E4%BC%97%E5%8F%B7.jpg">
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
        dialogContent: {
          title: '',
          time: '',
          require: '',
          content: ''
        },
        dialogVisible: false,
        cIndex: 0,
        dIndex: 0,
        iIndex: 0,
        oIndex: 0,
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
            desc: '这里是项目概要这里是项目概要这里是项目概要这里是项目概要这里是项目概要项目概要项目概要项目概要',
            c:[
              {
                courseId: 1,
                courseName: '互联网商业模式设计',
                achievement:[
                  {
                    name: '商业计划书',
                    address: '#'
                  },
                  {
                    name: '商业计划书2',
                    address: '#'
                  }
                ],
                processManage: [
                  {
                    title: '完成商业计划书',
                    require: `这里是任务的要求
                    1.要求一
                    2.要求二`,
                    content: '这里是任务的内容',
                    time:'2019/4/10'
                  }
                ]
              },
              {
                courseId: 1,
                courseName: '互联网商业模式设计2',
                achievement:[
                  {
                    name: '商业计划书3',
                    address: '#'
                  },
                  {
                    name: '商业计划书4',
                    address: '#'
                  }
                ],
                processManage: [
                  {
                    title: '完成商业计划书完成商业计划书完成完成商业计划书完成商业计划书完成商业计划书',
                    require: `这里是任务的要求
                    1.要求一
                    2.要求二`,
                    content: '这里是任务的内容',
                    time:'2019/4/10'
                  }
                ]
              }
            ],
            d:[
              {
                courseId: 1,
                courseName: 'web前端',
                achievement:[
                  {
                    name: '商业计划书',
                    address: '#'
                  }
                ],
                processManage: [
                  {
                    title: '完成商业计划书',
                    require: `这里是任务的要求
                    1.要求一
                    2.要求二`,
                    content: '这里是任务的内容',
                    time:'2019/4/10'
                  }
                ]
              }
            ],
            i:[
              {
                courseId: 1,
                courseName: '互联网商业模式设计',
                achievement:[
                  {
                    name: '商业计划书',
                    address: '#'
                  }
                ],
                processManage: [
                  {
                    title: '完成商业计划书',
                    require: `这里是任务的要求
                    1.要求一
                    2.要求二`,
                    content: '这里是任务的内容',
                    time:'2019/4/10'
                  }
                ]
              }
            ],
            o:[
              {
                courseId: 1,
                courseName: '互联网商业模式设计',
                achievement:[
                  {
                    name: '商业计划书',
                    address: '#'
                  }
                ],
                processManage: [
                  {
                    title: '完成商业计划书',
                    require: `这里是任务的要求
                    1.要求一
                    2.要求二`,
                    content: '这里是任务的内容',
                    time:'2019/4/9'
                  }
                ]
              }
            ]
          }
        ]
      }
    },
    computed: {
      currentGroup() {
        return this.groups[this.currentIndex]
      }
    },
    mounted(){
      // this.cValue = this.currentGroup.c[0].courseId
      // this.dValue = this.currentGroup.d[0].courseId
      // this.iValue = this.currentGroup.i[0].courseId
      // this.oValue = this.currentGroup.o[0].courseId
    },
    methods: {
      changeCurrentGroup(index) {
        this.loading = true;
        setTimeout(() => {
          this.loading = false;
        }, 400);
        this.currentIndex = index
      },
      cDialogShow(index){
        this.dialogContent = this.currentGroup.c[this.cIndex].processManage[index]
        this.dialogVisible = true
      },
      dDialogShow(index){
        this.dialogContent = this.currentGroup.d[this.dIndex].processManage[index]
        this.dialogVisible = true
      },
      iDialogShow(index){
        this.dialogContent = this.currentGroup.i[this.iIndex].processManage[index]
        this.dialogVisible = true
      },
      oDialogShow(index){
        this.dialogContent = this.currentGroup.o[this.oIndex].processManage[index]
        this.dialogVisible = true
      }
    },
  }
</script>


<style scoped>
.ellipsis{
  overflow: hidden;
  text-overflow:ellipsis;
  white-space: nowrap;
  max-width: 250px;
}
.time{
  position: absolute;
  font-size: 13px;
  right: 0;
  bottom: -15px
}
.achievement{
  border-bottom:1px solid #dee2e6;
  line-height: 50px;
  align-items: center;
  position: relative;
  text-align: center;
  justify-content: center;
}
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
  background: #024E98;
}
.bg{
background-color: #024E98;
/*height: 8rem;*/
}
.img0{
    height: 160px;
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
a{
  color: #212529
}
a:hover{
  color: #212529;
  text-decoration: none
}
</style>
