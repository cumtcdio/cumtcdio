<template>
    <div class="wrapper">
        <div style="text-align: center">
            学生基本信息表
        </div>
        <el-table
                :data="tableData"
                id="outtable"
                style="width: 100%">
            <el-table-column
                    prop="username"
                    label="学号"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="name"
                    label="姓名"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="class"
                    label="班级">
            </el-table-column>
            <el-table-column
                    prop="qqNumber"
                    label="QQ号">
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
                    username: '09162321',
                    name: '王小虎',
                    class: '2016-2班',
                    qqNumber: '1521231293',
                    email: '123213213@qq.com',
                    address: '上海市普陀区金沙江路 1518 弄'
                },{
                    username: '09162321',
                    name: '王小虎',
                    class: '2016-2班',
                    qqNumber: '1521231293',
                    email: '123213213@qq.com',
                    address: '上海市普陀区金沙江路 1518 弄'
                },{
                    username: '09162321',
                    name: '王小虎',
                    class: '2016-2班',
                    qqNumber: '1521231293',
                    email: '123213213@qq.com',
                    address: '上海市普陀区金沙江路 1518 弄'
                }]
            }
        },
        methods: {
            exportExcel: function () {
                var wb = XLSX.utils.table_to_book(document.querySelector('#outtable'))
                var wbout = XLSX.write(wb, { bookType: 'xlsx', bookSST: true, type: 'array' })
                try {
                    FileSaver.saveAs(new Blob([wbout], { type: 'application/octet-stream' }), 'sheetjs.xlsx')
                } catch (e) { if (typeof console !== 'undefined') alert(e)}
                return wbout
            },
        }
    }
</script>

<style lang="scss" scoped>

</style>