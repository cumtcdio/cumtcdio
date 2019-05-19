<template>
    <div>
        <div style="text-align: center">
            老师基本信息表
        </div>
        <el-table
                :data="tableData"
                id="teacherTable"
                style="width: 100%">
            <el-table-column
                    prop="username"
                    label="工号"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="name"
                    label="姓名"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="wxNumber"
                    label="微信号">
            </el-table-column>
            <el-table-column
                    prop="email"
                    label="邮箱">
            </el-table-column>
            <el-table-column
                    prop="address"
                    label="地址">
            </el-table-column>
        </el-table>
        <el-button class="btn btn-primary" @click="exportExcel">导出</el-button>
    </div>
</template>

<script>
    import FileSaver from "file-saver";
    import XLSX from "xlsx";
    export default {
        data() {
            return {
                tableData: [{
                    username: '427111',
                    name: '王XX',
                    wxNumber: '1521231293',
                    email: '123213213@qq.com',
                    address: '上海市普陀区金沙江路 1518 弄'
                },{
                    username: '427111',
                    name: '王XX',
                    wxNumber: '1521231293',
                    email: '123213213@qq.com',
                    address: '上海市普陀区金沙江路 1518 弄'
                },{
                    username: '427111',
                    name: '王XX',
                    wxNumber: '1521231293',
                    email: '123213213@qq.com',
                    address: '上海市普陀区金沙江路 1518 弄'
                }]
            }
        },
        methods: {
            exportExcel: function () {
                var wb = XLSX.utils.table_to_book(document.querySelector('#teacherTable'))
                var wbout = XLSX.write(wb, { bookType: 'xlsx', bookSST: true, type: 'array' })
                try {
                    FileSaver.saveAs(new Blob([wbout], { type: 'application/octet-stream' }), '老师信息表.xlsx')
                } catch (e) { if (typeof console !== 'undefined') alert(e) }
                return wbout
            },
        }
    }
</script>

<style lang="scss" scoped>

</style>