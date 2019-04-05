<template>
    <div>
        <el-tabs type="border-card">
            <el-button type="primary" icon="el-icon-edit" class="m-3" size="medium" @click="insertClick">录入</el-button>
            <el-tab-pane v-for="(item, index) in groupInfo" :key="index" :label="item.grade | gradeFilter">
                <el-table
                    :data="item.groups"
                    border
                    style="width: 100%">
                    <el-table-column
                    prop="groupSn"
                    label="组别"
                    width="100">
                    </el-table-column>
                    <el-table-column
                    prop="name"
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
                        <img :src="scope.row.img" alt="" style="max-height:100px">
                    </template>
                    </el-table-column>
                    <el-table-column
                    label="操作">
                    <template slot-scope="scope">
                        <el-button @click="handleClick(item.grade,scope.row.groupSn)" type="text" size="small">查看</el-button>
                        <el-button type="text" size="small" @click="editClick">编辑</el-button>
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
                    {
                        grade: 2016,
                        groups: [
                            {
                                groupSn: 6 ,
                                name: "大学生创客联盟",
                                member: "冯潇潇、陈帆、冯东昆、丘启君、孙瑞雪",
                                teacher: "冯文龙",
                                img: "http://www.mydlipin.com/uploads/allimg/110609/1_110609102731_1.JPG"
                            },
                            {
                                groupSn: 7 ,
                                name: "吃哆哆",
                                member: "XXX、XXXX、XXX、XX、XXX",
                                teacher: "王贺朝",
                                img: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554460159495&di=0c54da42513d9a7ee2c1b20ab41676a9&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180605%2F2b450d511ee243ec8f17de4338fdd320.jpg"
                            }
                        ]
                    },
                    {
                        grade: 2017,
                        groups: [
                            {
                                groupSn: 6 ,
                                name: "大学生创客联盟",
                                member: "冯潇潇、陈帆、冯东昆、丘启君、孙瑞雪",
                                teacher: "冯文龙",
                                img: "http://www.mydlipin.com/uploads/allimg/110609/1_110609102731_1.JPG"
                            }
                        ]
                    },
                    {
                        grade: 2018,
                        groups: [
                            {

                            }
                        ]
                    }
                ]
            }
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
                this.$router.push("/cdio/group/update")
            }
        },
    }
</script>
<style scoped>

</style>