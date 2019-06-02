<template>
    <div>
        <div style="text-align: center">
            老师基本信息表
        </div>
        <el-table
                v-loading="loading"
                :data="tableData"
                id="teacherTable"
                style="width: 100%">
            <el-table-column
                    prop="username"
                    label="工号"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="realName"
                    label="姓名"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="phone"
                    label="手机号"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="wxNumber"
                    label="微信号"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="email"
                    label="邮箱"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="family_address"
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
                tableData: [],
                loading: false
            }
        },
        methods: {
            getTeacherInfo: function () {
                this.loading = true
              this.getRequest('/api/user/teacher/info').then(res => {
                  if(res.data){
                      this.loading = false
                      this.tableData = res.data
                  }
              })
            },
            exportExcel: function () {
                var wb = XLSX.utils.table_to_book(document.querySelector('#teacherTable'))
                var wbout = XLSX.write(wb, { bookType: 'xlsx', bookSST: true, type: 'array' })
                try {
                    FileSaver.saveAs(new Blob([wbout], { type: 'application/octet-stream' }), '老师基本信息表.xlsx')
                } catch (e) { if (typeof console !== 'undefined') alert(e) }
                return wbout
            },
        },
        mounted() {
            this.getTeacherInfo()
        }
    }
</script>

<style lang="scss" scoped>

</style>