<template>
    <div>
        <el-tabs type="border-card">
            <el-button type="primary" icon="el-icon-edit" class="m-3" size="medium" @click="insertClick">录入</el-button>
            <el-tab-pane v-for="(item, index) in groupInfo" :key="index" :label="item.gradeSn | gradeFilter">
                <el-table
                    :data="item.groupInfoVOS"
                    border
                    style="width: 100%">
                    <el-table-column
                    prop="groupSn"
                    label="组别"
                    width="100">
                    </el-table-column>
                    <el-table-column
                    prop="groupName"
                    label="项目名称">
                    </el-table-column>
                    <el-table-column
                    prop="member"
                    label="成员">
                    </el-table-column>
                    <el-table-column
                    prop="teacher"
                    label="指导老师">
                    </el-table-column>
                    <el-table-column
                    label="小组图片">
                    <template slot-scope="scope">
                        <img :src="scope.row.groupImg" alt="" style="max-height:100px">
                    </template>
                    </el-table-column>
                    <el-table-column
                    label="操作">
                    <template slot-scope="scope">
                        <el-button v-if="$store.state.user.groupSn == scope.row.groupSn && $store.state.user.gradeSn == item.gradeSn" @click="handleClick(item.gradeSn,scope.row.groupSn)" type="text" size="small">基本信息修改</el-button>
                        <el-button v-if="$store.state.user.groupSn == scope.row.groupSn && $store.state.user.gradeSn == item.gradeSn" type="text" size="small" @click="editClick">项目过程管理</el-button>
                    </template>
                    </el-table-column>
                </el-table>
            </el-tab-pane>
        </el-tabs>
    </div>
</template>
<script>
    export default {
        name: 'CumtCDIO',
        data() {
            return {
                groupInfo: [
                    
                ]
            }
        },
        mounted(){
            this.axios.get("/api/group/getAll")
                .then(res =>{
                    this.groupInfo = res.data.data
                })
        },
        filters: {
            gradeFilter: function(value) {
                return value + "级";
            }
        },
        methods: {
            handleClick(grade,sn) {
                this.$router.push("/cdio/group/"+grade+"/"+sn)
            },
            insertClick(){
                this.$router.push("/cdio/group/insert")
            },
            editClick(){
                this.$router.push("/cdio/group/processManage")
            }
        },
        watch:{
            $route (to,from){
                if(to.path == "/cdio" && from.path.indexOf('/cdio/group') != -1){
                    this.axios.get("/api/group/getAll")
                    .then(res =>{
                        this.groupInfo = res.data.data
                    })
                }
            }
        }
    }
</script>
<style scoped>

</style>