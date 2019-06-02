<template>
    <div class="wrapper">
        <div style="text-align: center">
            学生基本信息表
        </div>
        <el-select v-model="value" placeholder="请选择">
            <el-option
                    v-for="item in options"
                    :key="item.gradeSn"
                    :label="item.gradeSn"
                    :value="item.gradeSn">
            </el-option>
        </el-select>
        <el-table
                v-loading="loading"
                :data="tableData"
                id="outtable"
                style="width: 100%">
            <el-table-column
                    prop="username"
                    label="学号"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="realName"
                    label="姓名"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="groupSn"
                    label="组别"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="phone"
                    label="手机号"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="qqNumber"
                    label="QQ号"
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
                gradeSn: null,
                tableData: [],
                options: [],
                value: '',
                loading: false
            }
        },
        methods: {
            getStudentIndoByGradeSn: function () {
                this.loading = true
                this.getRequest('/api/user/student/info/' + this.value).then(res => {
                    if (res.data){
                        this.loading = false
                        this.tableData = res.data
                    }
                })
            },
            getGrade: function () {
              this.getRequest('/api/group/getAllGrades').then(res => {
                  if (res.data) {
                      this.options = res.data
                      this.value = this.options[0].gradeSn
                      this.getStudentIndoByGradeSn()
                  }
              })
            },
            exportExcel: function () {
                var wb = XLSX.utils.table_to_book(document.querySelector('#outtable'))
                var wbout = XLSX.write(wb, { bookType: 'xlsx', bookSST: true, type: 'array' })
                try {
                    FileSaver.saveAs(new Blob([wbout], { type: 'application/octet-stream' }), this.value + '级学生基本信息表.xlsx')
                } catch (e) { if (typeof console !== 'undefined') alert(e)}
                return wbout
            },
        },
        mounted() {
            this.getGrade()
        },
        watch: {
            value: function () {
                this.getStudentIndoByGradeSn()
            }
        }
    }
</script>

<style lang="scss" scoped>

</style>