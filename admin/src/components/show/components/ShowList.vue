<template>
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
    </el-table>
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
        }
    }
</script>
<style scoped>

</style>