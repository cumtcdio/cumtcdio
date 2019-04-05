<template>
    <el-container>
        <el-header style="padding: 0px;display:flex;justify-content:space-between;align-items: center">
            <div style="display: inline">
                <el-button type="primary" size="mini" icon="el-icon-plus"
                           @click="toShowEdit(0)"
                        style="margin-right: 5px;">
                    添加
                </el-button>
                <el-input
                        placeholder="通过标题搜索"
                        clearable
                        style="width: 300px;padding: 0px;"
                        size="mini"
                        prefix-icon="el-icon-search"/>
                <el-button type="primary" size="mini" style="margin-left: 5px" icon="el-icon-search" >
                    搜索
                </el-button>
            </div>
        </el-header>
        <el-table
                :data="tableData"
                border
                style="width: 100%">
            <el-table-column
                    prop="id"
                    label="#"
                    width="50">
            </el-table-column>
            <el-table-column
                    prop="title"
                    label="标题">
            </el-table-column>
            <el-table-column
                    prop="htmlAddress"
                    label="地址">
            </el-table-column>
            <el-table-column
                    prop="date"
                    label="日期">
            </el-table-column>
            <el-table-column
                    prop="summary"
                    label="说明">
            </el-table-column>
            <el-table-column
                label="操作">
                <template slot-scope="scope">
                    <el-button @click="toShowEdit(scope.row)" type="primary"
                               style="padding: 3px 4px 3px 4px;margin: 2px"
                               size="mini"
                                icon="el-icon-edit">编辑
                    </el-button>
                    <el-button type="danger" style="padding: 3px 4px 3px 4px;margin: 2px" size="mini" icon="el-icon-delete"
                               @click="deleteShow(scope.row)">删除
                    </el-button>
                </template>
            </el-table-column>
        </el-table>
    </el-container>
</template>
<script>
    export default {
        name: 'ShowList',
        data() {
            return{
                tableData: [
                    {id: '1', title: '第一条数据', htmlAddress: 'www.1111.com', date: '2019-3-4', summary: 'aa'},
                    {id: '2', title: '第二条数据', htmlAddress: 'www.2222.com', date: '2019-3-15', summary: 'bb'},
                    {id: '3', title: '第三条数据', htmlAddress: 'www.3333.com', date: '2019-4-1', summary: 'cc'},
                    {id: '4', title: '第四条数据', htmlAddress: 'www.4444.com', date: '2019-4-3', summary: 'dd'},
                ]
            }
        },
        methods: {
            toShowEdit: function (val) {
                var index = 0;
                var id  = parseInt(this.$route.params.id);
                if (val === 0) {
                    index = 0
                }else {
                    index = val.id
                }
                this.$router.push('/show/' + id + '/' + index);
            },
            deleteShow: function (show) {
                alert(show)
                // console.log(show)
            }
        }
    }
</script>
<style scoped>

</style>