<template>
    <div class="wrapper">
        <el-tabs v-model="activeGrade" type="card" editable @edit="handleGradeEdit">
            <el-tab-pane v-for="(item, index) in grades" :key="index" :label="item.grade" :name="item.grade">
                <!-- CDIO tab -->
                <el-tabs v-model="activeName" type="border-card">
                    <el-tab-pane label="C" name="C">
                        <!-- 课程 tab -->
                        <el-tabs v-model="courseName" type="card" editable @edit="handleTabsEdit">
                            <el-tab-pane
                                :key="index"
                                v-for="(item, index) in item.courses"
                                :label="item.title"
                                :name="item.name"
                            >
                                <el-card class="box-card m-3">
                                    <div slot="header" class="clearfix">
                                        <span>成果</span>
                                        <el-button style="float: right; padding: 3px 0" type="text">添加课程所需成果</el-button>
                                    </div>
                                    <div class="text item">
                                        商业计划书
                                    </div>
                                </el-card>
                                <el-card class="box-card m-3">
                                    <div slot="header" class="clearfix">
                                        <span>项目过程管理</span>
                                        <el-button style="float: right; padding: 3px 0" type="text">发布任务</el-button>
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
                                                prop="require"
                                                label="要求">
                                                    <template slot-scope="scope">
                                                        <pre>{{scope.row.require}}</pre>
                                                    </template>
                                                </el-table-column>
                                                <el-table-column
                                                prop="content"
                                                label="任务内容">
                                                </el-table-column>
                                                <el-table-column
                                                prop="time"
                                                label="发布时间">
                                                </el-table-column>
                                                <el-table-column
                                                label="操作">
                                                    <template slot-scope="scope">
                                                        <el-button @click="handleEditDelete(scope)" type="text" size="small">删除该任务</el-button>
                                                    </template>
                                                </el-table-column>
                                        </el-table>

                                    </div>
                                </el-card>
                            </el-tab-pane>
                        </el-tabs>
                    </el-tab-pane>
                    <el-tab-pane label="D" name="D">
                        
                    </el-tab-pane>
                    <el-tab-pane label="I" name="I">
                        
                    </el-tab-pane>
                    <el-tab-pane label="O" name="O">
                        
                    </el-tab-pane>
                </el-tabs>
            </el-tab-pane>
        </el-tabs>
        
    </div>
</template>

<script>
    export default {
        data() {
            return {
                activeGrade: '2016',
                courseName: '1',
                grades:[
                    {
                        grade: '2016',
                        courses:[
                                    {
                                title: '互联网商业模式设计',
                                name: '1',
                                achievement: [
                                    {
                                        name: '商业计划书'
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
                                title: '课程 2',
                                name: '2',
                                achievement: [

                                ],
                                processManage: [
                                    
                                ]
                            }
                        ]
                    },
                    {
                        grade: '2017',
                        courses:[
                                    {
                                title: '互联网商业模式设计',
                                name: '1',
                                achievement: [
                                    {
                                        name: '商业计划书'
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
                                title: '课程 2',
                                name: '2',
                                achievement: [

                                ],
                                processManage: [
                                    
                                ]
                            }
                        ]
                    }
                ],
                tabIndex: 2,
                activeName: 'C'
            }
        },
        methods: {
            handleTabsEdit(targetName, action) {
                if (action === 'add') {
                    this.$prompt('请输入课程名称', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消'
                    }).then(({ value }) => {
                        let newTabName = ++this.tabIndex + '';
                        this.courses.push({
                            title: value,
                            name: newTabName,
                            achievement: [

                            ],
                            processManage: [
                                
                            ]
                        });
                        this.courseName = newTabName;
                    }).catch(() => {
                        this.$message({
                            type: 'info',
                            message: '已取消'
                        });       
                    });
                }
                if (action === 'remove') {
                    this.$confirm('此操作将删除该课程, 是否继续?', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning'
                    }).then(() => {
                        let tabs = this.courses;
                        let activeName = this.courseName;
                        if (activeName === targetName) {
                            tabs.forEach((tab, index) => {
                            if (tab.name === targetName) {
                                let nextTab = tabs[index + 1] || tabs[index - 1];
                                if (nextTab) {
                                activeName = nextTab.name;
                                }
                            }
                            });
                        }
                        this.courseName = activeName;
                        this.courses = tabs.filter(tab => tab.name !== targetName);
                        this.$message({
                            type: 'success',
                            message: '删除成功!'
                        });
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
                        let newTabName = ++this.tabIndex + '';
                        this.grades.push({
                            grade: value,
                            courses:[
                                       
                            ]
                        });
                        this.courseName = newTabName;
                    }).catch(() => {
                        this.$message({
                            type: 'info',
                            message: '已取消'
                        });       
                    });
                }
                if (action === 'remove') {
                    this.$confirm('此操作将删除该课程, 是否继续?', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning'
                    }).then(() => {
                        let tabs = this.courses;
                        let activeName = this.courseName;
                        if (activeName === targetName) {
                            tabs.forEach((tab, index) => {
                            if (tab.name === targetName) {
                                let nextTab = tabs[index + 1] || tabs[index - 1];
                                if (nextTab) {
                                activeName = nextTab.name;
                                }
                            }
                            });
                        }
                        
                        this.courseName = activeName;
                        this.courses = tabs.filter(tab => tab.name !== targetName);
                        this.$message({
                            type: 'success',
                            message: '删除成功!'
                        });
                    }).catch(() => {
                        this.$message({
                            type: 'info',
                            message: '已取消删除'
                        }); 
                    });
                }
            },
            handleEditDelete(scope){
                this.$confirm('此操作将删除该任务, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    this.courses[0].processManage.splice(scope.$index,1)
                    this.$message({
                        type: 'success',
                        message: '删除成功!'
                    });
                }).catch(() => {

                });
            },
        },
        
    }
</script>

<style scoped>

</style>