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
                        @keyup.enter.native="searchShowList"
                        v-model="keyWord"
                        prefix-icon="el-icon-search"/>
                <el-button type="primary" size="mini" style="margin-left: 5px" icon="el-icon-search" @click="searchShowList">
                    搜索
                </el-button>
            </div>
        </el-header>
        <el-table
                :data="tableData"
                border
                v-loading="tableLoading"
                style="width: 100%">
            <el-table-column
                    prop="showId"
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
                    prop="dateTime"
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
                    <el-dialog
                            title="提示"
                            :visible.sync="dialogVisible"
                            width="30%">
                        <span>是否删除这一条数据</span>
                        <span slot="footer" class="dialog-footer">
                            <el-button @click="dialogVisible = false">取 消</el-button>
                            <el-button type="primary" @click="deleteShowConfirmed">确 定</el-button>
                        </span>
                    </el-dialog>
                </template>
            </el-table-column>
        </el-table>
        <div style="margin-bottom: 8px;">
            <div style="display: flex;justify-content: space-between;margin: 2px" v-if="paginationShow">
                <span>&nbsp;</span>
                <el-pagination
                        background
                        :current-page="currentPage"
                        @current-change="currentChange"
                        :page-size="10"
                        layout="prev, pager, next"
                        :total="totalCount">
                </el-pagination>
            </div>
        </div>
    </el-container>
</template>
<script>
    export default {
        name: 'ShowList',
        data() {
            return{
                tableData: [],
                dialogVisible: false,
                deleteShowId: null,
                tableLoading: true,
                keyWord: '',
                currentPage: 0,
                offset: 0,
                totalCount: -1,
                paginationShow: true
            }
        },
        methods: {
            currentChange(currentChange){
                this.currentPage = currentChange
                this.offset = (currentChange - 1) * 10;
                this.getShowList()
            },
            getTotalCount: function () {
                var type = this.$store.state.showType
                this.getRequest('/api/show/countOneTypeShowList/' + type).then(res => {
                    var data = res.data
                    if (data) {
                        this.totalCount = data
                    }
                })
            },
            getShowList: function () {
                this.tableLoading = true
                var type = this.$store.state.showType
                this.getRequest('/api/show/getShowListLazied/' + type + '/' + this.offset).then(res => {
                    var data = res.data
                    if (data) {
                        this.tableLoading = false
                        this.tableData = data
                    }
                })
            },
            searchShowList: function () {
                this.tableLoading = true
                var type = this.$store.state.showType
                if (this.keyWord === ''){
                    this.getShowList()
                    this.getTotalCount()
                    this.paginationShow = true
                }else {
                    this.getRequest('api/show/getShowListByShowTitleAndType/' + this.keyWord + '/' + type).then(response => {
                        var data = response.data
                        if (data.data) {
                            this.tableLoading = false
                            this.tableData = data.data
                            this.paginationShow = false
                        }else {
                            alert('there is something wrong')
                        }
                    })
                }
            },
            toShowEdit: function (val) {
                var index = 0;
                var id  = parseInt(this.$route.params.id);
                if (val === 0) {
                    index = 0
                }else {
                    index = val.showId
                }
                this.$router.push('/show/' + id + '/' + index);
            },
            deleteShow: function (show) {
                this.deleteShowId = show.showId
                this.dialogVisible = true
            },
            deleteShowConfirmed: function () {
                this.deleteRequest('/api/show/deleteByShowId/' + this.deleteShowId).then(response => {
                    var data = response
                    if (data.code === 0){
                        this.dialogVisible = false
                        this.getShowList()
                    }
                })
            }
        },
        mounted() {
            this.getTotalCount()
            this.getShowList()
        },
        watch: {
            $route: function (to) {
                if (to.path.startsWith('/show')){
                    this.getTotalCount()
                    this.getShowList()
                }
            }
        }
    }
</script>
<style scoped>

</style>