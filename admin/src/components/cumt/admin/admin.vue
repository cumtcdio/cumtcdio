<template>
    <div class="wrapper">
        <el-tabs v-model="activeGradeId" type="card" editable @edit="handleGradeEdit" @tab-click="changeGradeSn">
            <el-tab-pane v-for="(item, index) in grades" :key="index" :label="item.gradeSn" :name="item.gradeId+''">
                <!-- CDIO tab -->
                <el-tabs v-model="activeType" type="border-card">
                    <el-tab-pane label="C" name="C">
                        <!-- 课程 tab -->
                        <el-tabs v-model="activeCourseId" type="card" editable @edit="handleCourseEdit">
                            <el-tab-pane
                                :key="index"
                                v-for="(item, index) in item.cCourses"
                                :label="item.courseName"
                                :name="item.courseId+''"
                            >
                                <el-card class="box-card m-3">
                                    <div slot="header" class="clearfix">
                                        <span>成果</span>
                                        <el-button style="float: right; padding: 3px 0" type="text" @click="achiDialogVisible = true">添加课程所需成果</el-button>
                                    </div>
                                    <div class="text item">
                                        <div v-for="(item, index) in item.achievement" :key="index">{{item.achievementName}}</div>
                                    </div>
                                </el-card>
                                <el-card class="box-card m-3">
                                    <div slot="header" class="clearfix">
                                        <span>项目过程管理</span>
                                        <el-button style="float: right; padding: 3px 0" type="text" @click="taskDialogVisible = true">发布任务</el-button>
                                    </div>
                                    <div class="text item">
                                        <el-table
                                        :data="item.processManage"
                                        stripe
                                        style="width: 100%">
                                                <el-table-column
                                                prop="title"
                                                label="任务名称">
                                                </el-table-column>
                                                <el-table-column
                                                label="要求">
                                                    <template slot-scope="scope">
                                                        <pre>{{scope.row.requires}}</pre>
                                                    </template>
                                                </el-table-column>
                                                <el-table-column
                                                prop="desc"
                                                label="任务内容">
                                                </el-table-column>
                                                <el-table-column
                                                label="发布时间">
                                                    <template slot-scope="scope">
                                                        <div>{{scope.row.time | dateFormat('yyyy-MM-dd hh:mm:ss')}}</div>
                                                    </template>
                                                </el-table-column>
                                                <el-table-column
                                                label="操作">
                                                    <template slot-scope="scope">
                                                        <el-button @click="handleTaskDelete(scope)" type="text" size="small">删除该任务</el-button>
                                                    </template>
                                                </el-table-column>
                                        </el-table>
                                    </div>
                                </el-card>
                            </el-tab-pane>
                        </el-tabs>
                    </el-tab-pane>
                    <el-tab-pane label="D" name="D">
                        <!-- 课程 tab -->
                        <el-tabs v-model="activeCourseId" type="card" editable @edit="handleCourseEdit">
                            <el-tab-pane
                                :key="index"
                                v-for="(item, index) in item.dCourses"
                                :label="item.courseName"
                                :name="item.courseId+''"
                            >
                                <el-card class="box-card m-3">
                                    <div slot="header" class="clearfix">
                                        <span>成果</span>
                                        <el-button style="float: right; padding: 3px 0" type="text" @click="achiDialogVisible = true">添加课程所需成果</el-button>
                                    </div>
                                    <div class="text item">
                                        <div v-for="(item, index) in item.achievement" :key="index">{{item.achievementName}}</div>
                                    </div>
                                </el-card>
                                <el-card class="box-card m-3">
                                    <div slot="header" class="clearfix">
                                        <span>项目过程管理</span>
                                        <el-button style="float: right; padding: 3px 0" type="text" @click="taskDialogVisible = true">发布任务</el-button>
                                    </div>
                                    <div class="text item">
                                        <el-table
                                        :data="item.processManage"
                                        stripe
                                        style="width: 100%">
                                                <el-table-column
                                                prop="title"
                                                label="任务名称">
                                                </el-table-column>
                                                <el-table-column
                                                label="要求">
                                                    <template slot-scope="scope">
                                                        <pre>{{scope.row.requires}}</pre>
                                                    </template>
                                                </el-table-column>
                                                <el-table-column
                                                prop="desc"
                                                label="任务内容">
                                                </el-table-column>
                                                <el-table-column
                                                label="发布时间">
                                                    <template slot-scope="scope">
                                                        <div>{{scope.row.time | dateFormat('yyyy-MM-dd hh:mm:ss')}}</div>
                                                    </template>
                                                </el-table-column>
                                                <el-table-column
                                                label="操作">
                                                    <template slot-scope="scope">
                                                        <el-button @click="handleTaskDelete(scope)" type="text" size="small">删除该任务</el-button>
                                                    </template>
                                                </el-table-column>
                                        </el-table>
                                    </div>
                                </el-card>
                            </el-tab-pane>
                        </el-tabs>
                    </el-tab-pane>
                    <el-tab-pane label="I" name="I">
                        <!-- 课程 tab -->
                        <el-tabs v-model="activeCourseId" type="card" editable @edit="handleCourseEdit">
                            <el-tab-pane
                                :key="index"
                                v-for="(item, index) in item.iCourses"
                                :label="item.courseName"
                                :name="item.courseId+''"
                            >
                                <el-card class="box-card m-3">
                                    <div slot="header" class="clearfix">
                                        <span>成果</span>
                                        <el-button style="float: right; padding: 3px 0" type="text" @click="achiDialogVisible = true">添加课程所需成果</el-button>
                                    </div>
                                    <div class="text item">
                                        <div v-for="(item, index) in item.achievement" :key="index">{{item.achievementName}}</div>
                                    </div>
                                </el-card>
                                <el-card class="box-card m-3">
                                    <div slot="header" class="clearfix">
                                        <span>项目过程管理</span>
                                        <el-button style="float: right; padding: 3px 0" type="text" @click="taskDialogVisible = true">发布任务</el-button>
                                    </div>
                                    <div class="text item">
                                        <el-table
                                        :data="item.processManage"
                                        stripe
                                        style="width: 100%">
                                                <el-table-column
                                                prop="title"
                                                label="任务名称">
                                                </el-table-column>
                                                <el-table-column
                                                label="要求">
                                                    <template slot-scope="scope">
                                                        <pre>{{scope.row.requires}}</pre>
                                                    </template>
                                                </el-table-column>
                                                <el-table-column
                                                prop="desc"
                                                label="任务内容">
                                                </el-table-column>
                                                <el-table-column
                                                label="发布时间">
                                                    <template slot-scope="scope">
                                                        <div>{{scope.row.time | dateFormat('yyyy-MM-dd hh:mm:ss')}}</div>
                                                    </template>
                                                </el-table-column>
                                                <el-table-column
                                                label="操作">
                                                    <template slot-scope="scope">
                                                        <el-button @click="handleTaskDelete(scope)" type="text" size="small">删除该任务</el-button>
                                                    </template>
                                                </el-table-column>
                                        </el-table>
                                    </div>
                                </el-card>
                            </el-tab-pane>
                        </el-tabs>
                    </el-tab-pane>
                    <el-tab-pane label="O" name="O">
                        <!-- 课程 tab -->
                        <el-tabs v-model="activeCourseId" type="card" editable @edit="handleCourseEdit">
                            <el-tab-pane
                                :key="index"
                                v-for="(item, index) in item.oCourses"
                                :label="item.courseName"
                                :name="item.courseId+''"
                            >
                                <el-card class="box-card m-3">
                                    <div slot="header" class="clearfix">
                                        <span>成果</span>
                                        <el-button style="float: right; padding: 3px 0" type="text" @click="achiDialogVisible = true">添加课程所需成果</el-button>
                                    </div>
                                    <div class="text item">
                                        <div v-for="(item, index) in item.achievement" :key="index">{{item.achievementName}}</div>
                                    </div>
                                </el-card>
                                <el-card class="box-card m-3">
                                    <div slot="header" class="clearfix">
                                        <span>项目过程管理</span>
                                        <el-button style="float: right; padding: 3px 0" type="text" @click="taskDialogVisible = true">发布任务</el-button>
                                    </div>
                                    <div class="text item">
                                        <el-table
                                        :data="item.processManage"
                                        stripe
                                        style="width: 100%">
                                                <el-table-column
                                                prop="title"
                                                label="任务名称">
                                                </el-table-column>
                                                <el-table-column
                                                label="要求">
                                                    <template slot-scope="scope">
                                                        <pre>{{scope.row.requires}}</pre>
                                                    </template>
                                                </el-table-column>
                                                <el-table-column
                                                prop="desc"
                                                label="任务内容">
                                                </el-table-column>
                                                <el-table-column
                                                label="发布时间">
                                                    <template slot-scope="scope">
                                                        <div>{{scope.row.time | dateFormat('yyyy-MM-dd hh:mm:ss')}}</div>
                                                    </template>
                                                </el-table-column>
                                                <el-table-column
                                                label="操作">
                                                    <template slot-scope="scope">
                                                        <el-button @click="handleTaskDelete(scope)" type="text" size="small">删除该任务</el-button>
                                                    </template>
                                                </el-table-column>
                                        </el-table>
                                    </div>
                                </el-card>
                            </el-tab-pane>
                        </el-tabs>
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
            title="提示"
            :visible.sync="courseDialogVisible"
            width="30%">
            <el-input v-model="courseName" placeholder="课程名称" class="mb-4"></el-input>
            <el-select v-model="teacherId" placeholder="请选择">
                        <el-option
                        v-for="(item, index) in teachers" 
                        :key="index"
                        :label="item.realName"
                        :value="item.userId">
                        </el-option>
                    </el-select>
            <span slot="footer" class="dialog-footer">
                <el-button @click="courseDialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="courseFormSubmit">确 定</el-button>
            </span>
        </el-dialog>

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
                courseName:"",
                courseDialogVisible: false,
                teacherId:null,
                teachers:null,
                taskFormItem:{
                    title:"",
                    require:"",
                    desc:"",
                    deadLine:""
                },
                taskDialogVisible: false,
                activeGradeSn: "0",
                activeGradeId: "0",
                activeType: 'C',
                activeCourseId: "0",
                grades:[
                            
                ],
            }
        },
        mounted(){
            this.init()
            
        },
        methods: {
            init(){
                this.axios.get("/api/admin/gradeCourse")
                    .then(res => {
                        this.grades = res.data
                        this.activeGradeId = this.grades[0].gradeId + ""
                        this.activeGradeSn = this.grades[0].gradeSn + ""
                        this.activeCourseId = this.grades[0].cCourses[0].courseId+ ""
                    })
                this.axios.get("/api/user/teacher/info")
                    .then(res =>{
                        this.teachers = res.data.data
                    })
            },
            initData(){
                this.axios.get("/api/admin/gradeCourse")
                    .then(res => {
                        this.grades = res.data
                    })
            },
            changeGradeSn(tab){
                this.activeGradeSn = tab.label
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
            },
            handleCourseEdit(targetName, action) {
                if (action === 'add') {
                    // this.$prompt('请输入课程名称', '提示', {
                    //     confirmButtonText: '确定',
                    //     cancelButtonText: '取消'
                    // }).then(({ value }) => {
                    //     let formItem = {
                    //         courseName: value,
                    //         courseType: this.activeType,
                    //         gradeId: this.activeGradeId
                    //     }
                    //     this.axios.post("/api/admin/course/insert",formItem)
                    //         .then(res =>{
                    //             if(res.status == 200){
                    //                 this.$message({
                    //                     type: 'success',
                    //                     message: '添加成功'
                    //                 });
                    //                 this.initData()
                    //             }
                    //         })
                    // }).catch(() => {
                    //     this.$message({
                    //         type: 'info',
                    //         message: '已取消'
                    //     });       
                    // });
                    this.courseDialogVisible = true
                }
                if (action === 'remove') {
                    this.$confirm('此操作将删除该课程, 是否继续?', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning'
                    }).then(() => {
                        let formItem = {
                            courseId: targetName,
                            gradeId: this.activeGradeId
                        }
                        this.axios.delete("/api/admin/course/delete",{params:formItem})
                            .then(res =>{
                                if(res.status == 200){
                                    this.$message({
                                        type: 'success',
                                        message: '删除成功'
                                    });
                                    this.initData()
                                }
                            })
                    }).catch(() => {
                        this.$message({
                            type: 'info',
                            message: '已取消删除'
                        }); 
                    });
                }
            },
            handleGradeEdit(targetName, action){
                    if (action === 'add') {
                    this.$prompt('请输入年级', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消'
                    }).then(({ value }) => {
                        this.axios.post("/api/admin/grade/insert?gradeSn="+value)
                            .then(res =>{
                                if(res.status == 200){
                                    this.$message({
                                        type: 'success',
                                        message: '添加成功'
                                    });
                                    this.initData()
                                }
                            })
                    }).catch(() => {
                        this.$message({
                            type: 'info',
                            message: '已取消'
                        });       
                    });
                }
                if (action === 'remove') {
                    this.$confirm('此操作将删除该年级, 是否继续?', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning'
                    }).then(() => {
                        this.axios.delete("/api/admin/grade/delete?gradeId="+targetName)
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
                        this.$message({
                            type: 'info',
                            message: '已取消删除'
                        }); 
                    });
                }
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
            courseFormSubmit(){
                let formItem = {
                    courseName: this.courseName,
                    teacherId : this.teacherId,
                    courseType: this.activeType,
                    gradeId: this.activeGradeId
                }
                this.axios.post("/api/admin/course/insert",formItem)
                    .then(res =>{
                        if(res.status == 200){
                            this.courseDialogVisible = false
                            this.$message({
                                type: 'success',
                                message: '添加成功'
                            });
                            this.initData()
                        }
                    })
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