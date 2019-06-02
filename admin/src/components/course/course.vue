<template>
    <div class="wrapper">
        <el-tabs type="border-card" v-model="activeGradeSn">
            <el-tab-pane :label="item.gradeSn" :name="item.gradeSn" v-for="(item, index) in courses" :key="index">
                <el-tabs v-model="activeCourseId" type="card">
                    <el-tab-pane :label="item.courseName" :name="item.courseId+''" v-for="(item, index) in item.course" :key="index">
                        <el-card class="box-card m-2">
                            <div slot="header" class="clearfix">
                                <span>成果</span>
                                <el-button style="float: right; padding: 3px 0" type="text" @click="achiDialogVisible = true">添加课程所需成果</el-button>
                            </div>
                            <el-collapse>
                                <el-collapse-item :title="item.achievementName" v-for="(item, index) in item.achievements" :key="index">
                                    <!-- 删除按钮 -->
                                    <span></span>
                                    <div>截止日期：{{item.deadline | dateFormat('yyyy-MM-dd hh:mm:ss')}}</div>
                                    <el-table
                                    :data="item.groups"
                                    style="width: 700px">
                                        <el-table-column
                                            prop="groupSn"
                                            label="组别">
                                        </el-table-column>
                                        <el-table-column
                                            prop="name"
                                            label="状态">
                                            <template slot-scope="scope">
                                                 <div v-if="scope.row.address">已提交</div>
                                                 <div v-if="!scope.row.address">未提交</div>
                                            </template>
                                        </el-table-column>
                                        <el-table-column
                                            label="得分">
                                            <template slot-scope="scope">
                                                 <div v-if="scope.row.score">{{scope.row.score}}</div>
                                                 <div v-if="!scope.row.score">未打分</div>
                                            </template>
                                        </el-table-column>
                                        <el-table-column
                                            label="操作">
                                            <template slot-scope="scope">
                                                 <el-button v-if="scope.row.address" @click="handleView(scope)" type="text" size="small">查看</el-button>
                                                 <el-button v-if="!scope.row.score" @click="handleScore(scope)" type="text" size="small">打分</el-button>
                                                 <el-button v-if="scope.row.score" @click="handleScore(scope)" type="text" size="small">重新打分</el-button>
                                            </template>
                                        </el-table-column>
                                    </el-table>
                                </el-collapse-item>
                            </el-collapse>
                        </el-card>
                        <el-card class="box-card m-2">
                            <div slot="header" class="clearfix">
                                <span>项目过程管理</span>
                                <el-button style="float: right; padding: 3px 0" type="text" @click="taskDialogVisible = true">发布任务</el-button>
                            </div>
                            <el-collapse>
                                <el-collapse-item :title="item.title" v-for="(item, index) in item.tasks" :key="index">
                                    <div class="m-2">
                                        <div>任务要求：<pre>{{item.require}}</pre></div>
                                        <div>任务内容：{{item.content}}</div>   
                                        <div>截止时间：{{item.deadline | dateFormat('yyyy-MM-dd hh:mm:ss')}}</div>
                                    </div>
                                    <el-table
                                    :data="item.groups"
                                    style="width: 700px">
                                        <el-table-column
                                            prop="groupSn"
                                            label="组别">
                                        </el-table-column>
                                        <el-table-column
                                            label="状态">
                                            <template slot-scope="scope">
                                                 <div v-if="scope.row.address">已提交</div>
                                                 <div v-if="!scope.row.address">未提交</div>
                                            </template>
                                        </el-table-column>
                                        <el-table-column
                                            label="得分">
                                            <template slot-scope="scope">
                                                 <div v-if="scope.row.score">{{scope.row.score}}</div>
                                                 <div v-if="!scope.row.score">未打分</div>
                                            </template>
                                        </el-table-column>
                                        <el-table-column
                                            label="操作">
                                            <template slot-scope="scope">
                                                 <el-button v-if="scope.row.address" @click="handleTaskView(scope)" type="text" size="small">查看</el-button>
                                                 <el-button v-if="!scope.row.score" @click="handleTaskScore(scope)" type="text" size="small">打分</el-button>
                                                 <el-button v-if="scope.row.score" @click="handleTaskScore(scope)" type="text" size="small">重新打分</el-button>
                                            </template>
                                        </el-table-column>
                                    </el-table>
                                </el-collapse-item>
                            </el-collapse>
                        </el-card>
                    </el-tab-pane>
                </el-tabs>

            </el-tab-pane>
        </el-tabs>
        <el-dialog
        title="添加成果"
        :visible.sync="achiDialogVisible"
        width="30%">
        <el-form ref="form" :model="achiFormItem" label-width="80px">
            <el-form-item label="成果名称" prop="title">
                <el-input v-model="achiFormItem.name" placeholder="请输入成果名称"></el-input>
            </el-form-item>
            <el-form-item label="截止时间" prop="deadLine">
                <el-date-picker
                    v-model="achiFormItem.deadLine"
                    type="datetime"
                    placeholder="选择截止日期">
                </el-date-picker>
            </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
            <el-button @click="achiDialogVisible = false">取 消</el-button>
            <el-button type="primary" @click="handleAddAchievement">发 布</el-button>
        </span>
        </el-dialog>
        <el-dialog
        title="发布任务"
        :visible.sync="taskDialogVisible"
        width="30%">
        <el-form ref="form" :model="taskFormItem" label-width="80px">
            <el-form-item label="任务标题" prop="title">
                <el-input v-model="taskFormItem.title" placeholder="请输入任务标题"></el-input>
            </el-form-item>
            <el-form-item label="任务要求" prop="require">
                <el-input type="textarea" :rows="2" v-model="taskFormItem.require" placeholder="请输入任务要求"></el-input>
            </el-form-item>
            <el-form-item label="任务内容" prop="desc">
                <el-input v-model="taskFormItem.desc" placeholder="请输入任务内容"></el-input>
            </el-form-item>
            <el-form-item label="截止时间" prop="deadLine">
                <el-date-picker
                    v-model="taskFormItem.deadLine"
                    type="datetime"
                    placeholder="选择截止日期">
                </el-date-picker>
            </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
            <el-button @click="handleTaskCancel">取 消</el-button>
            <el-button type="primary" @click="handleTaskAdd">发 布</el-button>
        </span>
        </el-dialog>
        <el-dialog
            title="项目过程管理"
            :visible.sync="dialogVisible"
            top="2vh"
            width="60%"
            style="height:1000px">
            <iframe :src='officeUrl'
             width='100%' height='600px' frameborder='1'>
            </iframe>
        </el-dialog>
        <a :href="zipUrl" id="zip" style="display:none">zip</a>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                achiFormItem:{
                    name:"",
                    deadLine:""
                },
                achiDialogVisible:false,
                zipUrl:"#",
                officeUrl:"",
                dialogVisible: false,
                taskFormItem:{
                    title:"",
                    require:"",
                    desc:"",
                    deadLine:""
                },
                taskDialogVisible: false,
                activeGradeSn: '2016',
                activeCourseId: '1',
                courses:[
                    
                ],
            }
        },
        mounted(){
            this.init()
        },
        methods: {
            init() {
                this.axios.get("/api/course/teacher/"+this.$store.state.user.id)
                    .then(res =>{
                        this.courses = res.data
                        this.activeGradeSn = this.courses[0].gradeSn
                        this.activeCourseId = this.courses[0].course[0].courseId+''
                    })
                
            },
            initData(){
                this.axios.get("/api/course/teacher/4")
                    .then(res =>{
                        this.courses = res.data
                    })
            },
            handleAddAchievement(){
                this.achiDialogVisible = false
                let formItem = {
                    gradeSn : this.activeGradeSn,
                    courseId : this.activeCourseId,
                    achievementName : this.achiFormItem.name,
                    deadLine: this.achiFormItem.deadLine
                }
                this.axios.post("/api/admin/achievement/insert",formItem)
                    .then(res =>{
                        if(res.status == 200){
                            this.$message({
                                type: 'success',
                                message: '发布成功!'
                            });
                            this.initData()
                            this.taskFormItem.title = ""
                            this.taskFormItem.require = ""
                            this.taskFormItem.desc = ""
                        }
                    })
                // this.$prompt('请输入成果名', '提示', {
                //         confirmButtonText: '确定',
                //         cancelButtonText: '取消'
                //     }).then(({ value }) => {
                //         let formItem = {
                //             gradeSn : this.activeGradeSn,
                //             courseId : this.activeCourseId,
                //             achievementName : value
                //         }
                //         this.axios.post("/api/admin/achievement/insert",formItem)
                //             .then(res =>{
                //                 if(res.status == 200){
                //                     this.$message({
                //                         type: 'success',
                //                         message: '添加成功'
                //                     });
                //                     this.initData()
                //                 }
                //             })
                //     })
            },
            handleTaskCancel(){
                this.taskDialogVisible = false,
                this.taskFormItem.title = ""
                this.taskFormItem.require = ""
                this.taskFormItem.desc = ""
            },
            handleTaskDelete(scope){
                this.$confirm('此操作将删除该任务, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    this.axios.delete("/api/admin/task/delete?taskId="+scope.row.id)
                        .then(res =>{
                            if(res.status == 200){
                                this.$message({
                                    type: 'success',
                                    message: '删除成功!'
                                });
                                this.initData()
                            }
                        })
                }).catch(() => {

                });
            },
            handleTaskAdd(){
                this.taskDialogVisible = false
                let formItem = {
                    title: this.taskFormItem.title,
                    requires: this.taskFormItem.require,
                    desc: this.taskFormItem.desc,
                    deadLine: this.taskFormItem.deadLine,
                    gradeSn: this.activeGradeSn,
                    courseId: this.activeCourseId
                }
                this.axios.post("/api/admin/task/insert",formItem)
                    .then(res =>{
                        if(res.status == 200){
                            this.$message({
                                type: 'success',
                                message: '发布成功!'
                            });
                            this.initData()
                            this.taskFormItem.title = ""
                            this.taskFormItem.require = ""
                            this.taskFormItem.desc = ""
                        }
                    })
            },
            handleScore(scope){
                this.$prompt('请输入分数', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消'
                    }).then(({ value }) => {
                        this.axios.put("/api/course/score/achievement?addressId="+scope.row.addressId+"&score="+value)
                            .then(res =>{
                                if(res.status == 200){
                                    this.$message({
                                        type: 'success',
                                        message: '打分成功'
                                    });
                                    this.initData()
                                }
                            })
                    })
                
            },
            handleTaskScore(scope){
                this.$prompt('请输入分数', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消'
                    }).then(({ value }) => {
                        this.axios.put("/api/course/score/task?addressId="+scope.row.addressId+"&score="+value)
                            .then(res =>{
                                if(res.status == 200){
                                    this.$message({
                                        type: 'success',
                                        message: '打分成功'
                                    });
                                    this.initData()
                                }
                            })
                    })
                
            },
            handleView(scope){
                if(scope.row.address.indexOf(".zip") > -1){
                    this.zipUrl = scope.row.address
                    setTimeout(() => {
                        document.querySelector('#zip').click()
                    }, 0.5);

                }else{
                    this.officeUrl = "https://view.officeapps.live.com/op/view.aspx?src="+scope.row.address
                    this.dialogVisible = true   
                }
            },
            handleTaskView(scope){
                if(scope.row.address.indexOf(".zip") > -1){
                    this.zipUrl = scope.row.address
                    setTimeout(() => {
                        document.querySelector('#zip').click()
                    }, 0.5);

                }else{
                    this.officeUrl = "https://view.officeapps.live.com/op/view.aspx?src="+scope.row.address
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

</style>