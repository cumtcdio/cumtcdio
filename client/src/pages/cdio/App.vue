<template>
  <div id="cdio">
    <div class="bg" style="width:1600px">
        <div>
            <img class="img0 ml-5" src="http://slide-1257444045.cos.ap-shanghai.myqcloud.com/236f1862-2a65-4843-abc8-4acba1b1d68e.jpg">
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
          <el-select v-model="gradeSn" placeholder="请选择" size="medium"
                     @change="changeCurrentGrade"
                     class="m-5 mycard">
            <el-option
                    v-for="(item,index) in grades"
                    :key="index"
                    :label="item.gradeSn + '级'"
                    :value="item.gradeSn">
            </el-option>
          </el-select>
          <Card :padding="0" class="m-5 mycard">
              <CellGroup>
                  <Cell v-for="(item, index) in groups" :key="index" :name="index"
                  @click.native="changeCurrentGroup(item.groupId)"
                  >
                    <span style="width:200px">{{item.groupName}}</span>
                    <Icon type="ios-arrow-forward" slot="extra" />
                  </Cell>
              </CellGroup>
          </Card>
        </div>
        <div class="m1-5" v-if="!hasInfo" style="margin:0;padding:0">
          <div style="position: absolute;left:0; top:0; right:0; bottom: 0; margin: auto;width: 300px;
    height: 300px;">暂无数据!</div>
        </div>
        <div class="ml-5" v-if="hasInfo">
          <!-- 项目信息 -->
          <div class="card" style="width:1000px;margin-top:30px" v-loading="loading">
            <div class="card-header header">项目信息</div>
            <div class="card-body row">
              <div class="col-7">
                <div class="row">
                  <div class="col-6 d-flex">
                    <div style="min-width:80px">项目名称：</div>
                    <div>{{groupInfo.groupName}}</div>
                  </div>
                  <div class="col-6 d-flex">
                    <div style="min-width:80px">指导老师：</div>
                    <div>{{groupInfo.teacher}}</div>
                  </div>
                  <div class="col-12 mt-3 d-flex">
                    <div style="min-width:80px">成员：</div>
                    <div>{{groupInfo.member}}</div>
                  </div>
                  <div class="col-12 mt-3 d-flex">
                    <div style="min-width:80px">项目简介：</div>
                    <div>{{groupInfo.desc}}</div>
                  </div>
                </div>
              </div>
              <div class="col-5">
                <img class="teamImg" :src="groupInfo.groupImg" alt="">
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
                  <div v-if="groupInfo.ccourseVOS.length">
                    <el-select v-model="cIndex" placeholder="请选择" size="medium">
                      <el-option
                        v-for="(course,index) in groupInfo.ccourseVOS"
                        :key="index"
                        :label="course.courseName"
                        :value="index">
                      </el-option>
                    </el-select>
                  </div>
                </td>
                <td>
                  <div v-if="groupInfo.dcourseVOS.length">
                    <el-select v-model="dIndex" placeholder="请选择" size="medium">
                      <el-option
                        v-for="(course,index) in groupInfo.dcourseVOS"
                        :key="index"
                        :label="course.courseName"
                        :value="index">
                      </el-option>
                    </el-select>
                  </div>
                </td>
                <td>
                  <div v-if="groupInfo.icourseVOS.length">
                    <el-select v-model="iIndex" placeholder="请选择" size="medium">
                      <el-option
                        v-for="(course,index) in groupInfo.icourseVOS"
                        :key="index"
                        :label="course.courseName"
                        :value="index">
                      </el-option>
                    </el-select>
                  </div>
                </td>
                <td>
                  <div v-if="groupInfo.ocourseVOS.length">
                    <el-select v-model="oIndex" placeholder="请选择" size="medium">
                      <el-option
                        v-for="(course,index) in groupInfo.ocourseVOS"
                        :key="index"
                        :label="course.courseName"
                        :value="index">
                      </el-option>
                    </el-select>
                  </div>
                </td>
              </tr>
              <!-- achievement -->
              <tr>
                <td style="margin:0;padding:0">
                  <div v-if="groupInfo.ccourseVOS.length">
                    <div v-for="(item,index) in groupInfo.ccourseVOS[cIndex].achievement" :key="index" class="achievement" style="padding:7px 0">
                      <div @click="handlePreview(item.address)">{{item.name}}</div>
                      <div class="time text-muted">{{item.deadLine | dateFormat('yyyy-MM-dd')}}</div>
                    </div>
                  </div>
                </td>
                <td style="margin:0;padding:0">
                  <div v-if="groupInfo.dcourseVOS.length">
                    <div v-for="(item,index) in groupInfo.dcourseVOS[dIndex].achievement" :key="index" class="achievement" style="padding:7px 0">
                      <div @click="handlePreview(item.address)">{{item.name}}</div>
                      <div class="time text-muted">{{item.deadLine | dateFormat('yyyy-MM-dd')}}</div>
                    </div>
                  </div>
                </td>
                <td style="margin:0;padding:0">
                  <div v-if="groupInfo.icourseVOS.length">
                    <div v-for="(item,index) in groupInfo.icourseVOS[iIndex].achievement" :key="index" class="achievement" style="padding:7px 0">
                      <div @click="handlePreview(item.address)">{{item.name}}</div>
                      <div class="time text-muted">{{item.deadLine | dateFormat('yyyy-MM-dd')}}</div>
                    </div>
                  </div>
                </td>
                <td style="margin:0;padding:0">
                  <div v-if="groupInfo.ocourseVOS.length">
                    <div v-for="(item,index) in groupInfo.ocourseVOS[oIndex].achievement" :key="index" class="achievement" style="padding:7px 0">
                      <div @click="handlePreview(item.address)">{{item.name}}</div>
                      <div class="time text-muted">{{item.deadLine | dateFormat('yyyy-MM-dd')}}</div>
                    </div>
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
                  <div v-if="groupInfo.ccourseVOS.length">
                    <div v-for="(item,index) in groupInfo.ccourseVOS[cIndex].processManage" :key="index" class="achievement" @click="cDialogShow(index,item)">
                      <div style="position:relative;padding:7px 0">
                        <div class="ellipsis">{{index+1}}.{{item.title}}</div>
                        <div class="time text-muted">{{item.time | dateFormat('yyyy-MM-dd')}}</div>
                      </div>
                    </div>
                  </div>
                </td>
                <td style="margin:0;padding:0;cursor:pointer">
                  <div v-if="groupInfo.dcourseVOS.length">
                    <div v-for="(item,index) in groupInfo.dcourseVOS[dIndex].processManage" :key="index" class="achievement" @click="dDialogShow(index,item)">
                      <div style="position:relative;padding:7px 0">
                        <div class="ellipsis">{{index+1}}.{{item.title}}</div>
                        <div class="time text-muted">{{item.time | dateFormat('yyyy-MM-dd')}}</div>
                      </div>
                    </div>
                  </div>
                </td>
                <td style="margin:0;padding:0;cursor:pointer">
                  <div v-if="groupInfo.icourseVOS.length">
                    <div v-for="(item,index) in groupInfo.icourseVOS[iIndex].processManage" :key="index" class="achievement" @click="iDialogShow(index,item)">
                      <div style="position:relative;padding:7px 0">
                        <div class="ellipsis">{{index+1}}.{{item.title}}</div>
                        <div class="time text-muted">{{item.time | dateFormat('yyyy-MM-dd')}}</div>
                      </div>
                    </div>
                  </div>
                </td>
                <td style="margin:0;padding:0;cursor:pointer">
                  <div v-if="groupInfo.ocourseVOS.length">
                    <div v-for="(item,index) in groupInfo.ocourseVOS[oIndex].processManage" :key="index" class="achievement" @click="oDialogShow(index,item)">
                      <div style="position:relative;padding:7px 0">
                        <div class="ellipsis">{{index+1}}.{{item.title}}</div>
                        <div class="time text-muted">{{item.time | dateFormat('yyyy-MM-dd')}}</div>
                      </div>
                    </div>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
          <el-dialog
            title="项目过程管理"
            :visible.sync="dialogVisible"
            top="2vh"
            width="60%">
            <div v-text="dialogContent.title"></div>
            <div >{{dialogContent.time | dateFormat('yyyy-MM-dd hh:mm:ss')}}</div>
            <div v-text="dialogContent.require"></div>
            <div v-text="dialogContent.content"></div>
            <iframe :src='officeUrl'
            width='100%' height='600px' frameborder='1'>
            </iframe>
          </el-dialog>
          <el-dialog
              title="文件预览"
              :visible.sync="fileDialogVisible"
              top="2vh"
              width="60%"
              style="height:1000px">
              <iframe :src='officeUrl'
              width='100%' height='600px' frameborder='1'>
              </iframe>
          </el-dialog>
        </div>
      </div>
    </div>

    <!-- 页脚 -->
    <div ref="bottom" class="bottom mt-4" style="width:1600px">
        <div class="line"></div>
        <div class="bg" style="height: 60px;line-height: 3rem;">
            <div class="bottomFont">
              <img class="photo" src="http://slide-1257444045.cos.ap-shanghai.myqcloud.com/b312a710-a8c2-45d7-94d1-b68d8e3876a5.jpg">
              <span>&nbsp;&nbsp;&nbsp;电子商务与数据科学系&nbsp;&nbsp;&nbsp;</span>
              <img class="photo" src="http://slide-1257444045.cos.ap-shanghai.myqcloud.com/00646f06-671c-418f-aa44-b8601f3637cd.jpg">
              <span>&nbsp;&nbsp;&nbsp;微信公众号&nbsp;&nbsp;&nbsp;</span>
            </div>
        </div>
    </div>
    <a :href="zipUrl" id="zip" style="display:none">zip</a>
  </div>
</template>

<script>
  import axios from 'axios'
  export default {
      data() {
      return {
        zipUrl:"#",
        hasInfo: true,
        officeUrl:"",
        fileDialogVisible:false,
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
                href: 'index'
            },
            {
                index: '2',
                title: '通知',
                href: 'list.html?title=通知'
            },
            {
                index: '3',
                title: '新闻',
                href: 'list.html?title=新闻'
            },
            {
                index: '4',
                title: 'EC-CDIO人才培养',
                href: 'cdio.html'
            },
            {
                index: '5',
                title: '师生风采',
                href: 'list.html?title=师生风采'
            },
            {
                index: '6',
                title: '专业信息',
                href: 'list.html?title=专业信息'
            },
            {
                index: '7',
                title: '项目沙龙',
                href: 'list.html?title=专业实习'
            }
        ],
        loading: false,
        currentGroupId: '0',
        activeIndex:'4',
        groupInfo: {
            "groupId": 0,
            "groupSn": "",
            "groupName": "",
            "member": "",
            "gradeSn": "",
            "groupImg": "",
            "teacher": "",
            "desc": "",
            "ccourseVOS": [
                {
                    "courseId": 0,
                    "courseName": "",
                    "achievement": [
                        {
                            "achievementId": 1,
                            "name": "",
                            "address": null
                        },
                        {
                            "achievementId": 0,
                            "name": "",
                            "address": null
                        },
                        {
                            "achievementId": 0,
                            "name": "",
                            "address": null
                        },
                        {
                            "achievementId": 0,
                            "name": "",
                            "address": null
                        }
                    ],
                    "processManage": [
                        {
                            "processId": 0,
                            "title": "",
                            "require": "",
                            "content": "",
                            "time": "",
                            "address": null
                        },
                        {
                            "processId": 0,
                            "title": "",
                            "require": "",
                            "content": "",
                            "time": "",
                            "address": null
                        },
                        {
                            "processId": 0,
                            "title": "",
                            "require": "",
                            "content": "",
                            "time": "",
                            "address": null
                        }
                    ]
                },
                {
                    "courseId": 0,
                    "courseName": "",
                    "achievement": [
                        {
                            "achievementId": 0,
                            "name": "",
                            "address": null
                        }
                    ],
                    "processManage": [
                        {
                            "processId": 0,
                            "title": "",
                            "require": "",
                            "content": "",
                            "time": "",
                            "address": null
                        }
                    ]
                }
            ],
            "dcourseVOS": [
                {
                    "courseId": 0,
                    "courseName": "",
                    "achievement": [
                        {
                            "achievementId": 0,
                            "name": "",
                            "address": null
                        }
                    ],
                    "processManage": []
                }
            ],
            "icourseVOS": [
                {
                    "courseId": 0,
                    "courseName": "",
                    "achievement": [
                        {
                            "achievementId": 0,
                            "name": "",
                            "address": null
                        }
                    ],
                    "processManage": []
                }
            ],
            "ocourseVOS": [
                {
                    "courseId": 0,
                    "courseName": "",
                    "achievement": [
                        {
                            "achievementId": 0,
                            "name": "",
                            "address": null
                        }
                    ],
                    "processManage": []
                }
            ]
        },
        groups: [{
            "groupId": 0,
            "groupSn": "",
            "groupName": "",
            "gradeSn": "",
            "groupImg": "",
            "teacher": "",
            "desc": ""
        }],
        gradeSn: 0,
        grades: [{id: 1, gradeSn: '2016'}]
      }
    },
    mounted(){
       // 初始化年级，同时初始化小组以及小组信息情况
       this.getAllGrades()
    },
    methods: {
      handlePreview(address){
          if(address.indexOf(".zip") > -1 ||address.indexOf(".pdf") > -1||address.indexOf(".PDF") > -1){
                    this.zipUrl = address
                    setTimeout(() => {
                        document.querySelector('#zip').click()
                    }, 0.5);

                }else{
                    this.officeUrl = "https://view.officeapps.live.com/op/view.aspx?src="+address
                    this.fileDialogVisible = true
                }
      },
      getGroupInfoByGroupId: function () {
          this.loading = true
          axios.get('/api/group/id/' + this.currentGroupId).then(resp => {
              this.groupInfo = resp.data.data
              this.loading = false
          })
      },
      getGroupsByGradeSn: function (gradeSn) {
          axios.get('/api/group/' + gradeSn).then(resp => {
              var data = resp.data
              if (data.data.length <= 0) {
                  this.groups = [{
                      "groupId": 0,
                      "groupSn": "",
                      "groupName": "",
                      "gradeSn": "",
                      "groupImg": "",
                      "teacher": "",
                      "desc": ""
                  }],
                  this.currentGroupId = 0
                  this.groupInfo = {
                      "groupId": 0,
                      "groupSn": "",
                      "groupName": "",
                      "member": "",
                      "gradeSn": "",
                      "groupImg": "",
                      "teacher": "",
                      "desc": "",
                      "ccourseVOS": [
                          {
                              "courseId": 0,
                              "courseName": "",
                              "achievement": [
                                  {
                                      "achievementId": 1,
                                      "name": "",
                                      "address": null
                                  },
                                  {
                                      "achievementId": 0,
                                      "name": "",
                                      "address": null
                                  },
                                  {
                                      "achievementId": 0,
                                      "name": "",
                                      "address": null
                                  },
                                  {
                                      "achievementId": 0,
                                      "name": "",
                                      "address": null
                                  }
                              ],
                              "processManage": [
                                  {
                                      "processId": 0,
                                      "title": "",
                                      "require": "",
                                      "content": "",
                                      "time": "",
                                      "address": null
                                  },
                                  {
                                      "processId": 0,
                                      "title": "",
                                      "require": "",
                                      "content": "",
                                      "time": "",
                                      "address": null
                                  },
                                  {
                                      "processId": 0,
                                      "title": "",
                                      "require": "",
                                      "content": "",
                                      "time": "",
                                      "address": null
                                  }
                              ]
                          },
                          {
                              "courseId": 0,
                              "courseName": "",
                              "achievement": [
                                  {
                                      "achievementId": 0,
                                      "name": "",
                                      "address": null
                                  }
                              ],
                              "processManage": [
                                  {
                                      "processId": 0,
                                      "title": "",
                                      "require": "",
                                      "content": "",
                                      "time": "",
                                      "address": null
                                  }
                              ]
                          }
                      ],
                      "dcourseVOS": [
                          {
                              "courseId": 0,
                              "courseName": "",
                              "achievement": [
                                  {
                                      "achievementId": 0,
                                      "name": "",
                                      "address": null
                                  }
                              ],
                              "processManage": []
                          }
                      ],
                      "icourseVOS": [
                          {
                              "courseId": 0,
                              "courseName": "",
                              "achievement": [
                                  {
                                      "achievementId": 0,
                                      "name": "",
                                      "address": null
                                  }
                              ],
                              "processManage": []
                          }
                      ],
                      "ocourseVOS": [
                          {
                              "courseId": 0,
                              "courseName": "",
                              "achievement": [
                                  {
                                      "achievementId": 0,
                                      "name": "",
                                      "address": null
                                  }
                              ],
                              "processManage": []
                          }
                      ]
                  }
                  this.hasInfo = false
              } else {
                  this.hasInfo = true
                  this.groups = data.data
                  this.currentGroupId = this.groups[0].groupId
                  this.getGroupInfoByGroupId()
              }
          })
      },
      getAllGrades: function () {
          this.loading = true
          axios.get('/api/group/getAllGrades').then(resp => {
              this.grades = resp.data.data
              this.gradeSn = this.grades[0].gradeSn
              axios.get('/api/group/' + this.gradeSn).then(resp => {
                  var data = resp.data
                  if(data.data.length > 0){
                      this.groups = resp.data.data
                      this.currentGroupId = this.groups[0].groupId
                      axios.get('/api/group/id/' + this.currentGroupId).then(resp => {
                          this.groupInfo = resp.data.data
                          this.loading = false
                      })
                  }else {
                      this.hasInfo = false
                      this.loading = false
                  }
              })
          })
      },
      changeCurrentGroup(index) {
        this.currentGroupId = index
        this.getGroupInfoByGroupId()
      },
      changeCurrentGrade: function (gradeSn) {
        this.getGroupsByGradeSn(gradeSn)
      },
      cDialogShow(index,item) {
        if(item.address.indexOf(".zip") > -1||item.address.indexOf(".pdf") > -1||item.address.indexOf(".PDF") > -1){
                    this.zipUrl = item.address
                    setTimeout(() => {
                        document.querySelector('#zip').click()
                    }, 0.5);
                }else{
                    this.dialogContent = this.groupInfo.ccourseVOS[this.cIndex].processManage[index]
                    this.officeUrl = "https://view.officeapps.live.com/op/view.aspx?src="+item.address
                    this.dialogVisible = true
                }
      },
      dDialogShow(index,item){
        if(item.address.indexOf(".zip") > -1||item.address.indexOf(".pdf") > -1||item.address.indexOf(".PDF") > -1){
                    this.zipUrl = item.address
                    setTimeout(() => {
                        document.querySelector('#zip').click()
                    }, 0.5);
                }else{
                    this.dialogContent = this.groupInfo.dcourseVOS[this.dIndex].processManage[index]
                    this.officeUrl = "https://view.officeapps.live.com/op/view.aspx?src="+item.address
                    this.dialogVisible = true
                }
      },
      iDialogShow(index,item){
        if(item.address.indexOf(".zip") > -1||item.address.indexOf(".pdf") > -1||item.address.indexOf(".PDF") > -1){
                    this.zipUrl = item.address
                    setTimeout(() => {
                        document.querySelector('#zip').click()
                    }, 0.5);
                }else{
                    this.dialogContent = this.groupInfo.icourseVOS[this.iIndex].processManage[index]
                    this.officeUrl = "https://view.officeapps.live.com/op/view.aspx?src="+item.address
                    this.dialogVisible = true
                }
      },
      oDialogShow(index,item){
        if(item.address.indexOf(".zip") > -1||item.address.indexOf(".pdf") > -1||item.address.indexOf(".PDF") > -1){
                    this.zipUrl = item.address
                    setTimeout(() => {
                        document.querySelector('#zip').click()
                    }, 0.5);
                }else{
                    this.dialogContent = this.groupInfo.ocourseVOS[this.oIndex].processManage[index]
                    this.officeUrl = "https://view.officeapps.live.com/op/view.aspx?src="+item.address
                    this.dialogVisible = true
                }
      }
    },
    filters: {
      dateFormat: function(value,fmt) {
          let getDate = new Date(value);
          let o = {
              'M+': getDate.getMonth() + 1,
              'd+': getDate.getDate(),
              'h+': getDate.getHours(),
              'm+': getDate.getMinutes(),
              's+': getDate.getSeconds(),
              'q+': Math.floor((getDate.getMonth() + 3) / 3),
              'S': getDate.getMilliseconds()
          };
          if (/(y+)/.test(fmt)) {
              fmt = fmt.replace(RegExp.$1, (getDate.getFullYear() + '').substr(4 - RegExp.$1.length))
          }
          for (let k in o) {
              if (new RegExp('(' + k + ')').test(fmt)) {
              fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (('00' + o[k]).substr(('' + o[k]).length)))
              }
          }
          return fmt;
      }
  }
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
  font-size: 13px;
}
.achievement{
  border-bottom:1px solid #dee2e6;
  align-items: center;
  position: relative;
  text-align: center;
  justify-content: center;
  cursor: pointer;
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
.navbar .nav > li > a:hover {
  color: #024E98;
  background-color: rgb(68,160,253);
}
</style>
