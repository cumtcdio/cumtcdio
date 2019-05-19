<template>
    <div>
        <div>
            <el-button type="primary" size="mini" icon="el-icon-plus"
                       @click="dialogV"
                style="margin-right: 5px;margin-bottom: 5px">添加</el-button>
        </div>
        <el-table
                :data="tableData"
                border
                style="width: 100%">
            <el-table-column
                    prop="id"
                    label="#."
                    width="50px">
            </el-table-column>
            <el-table-column
                    prop="title"
                    label="标题"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="img"
                    label="图片地址">
            </el-table-column>
            <el-table-column
                    prop="articleAddress"
                    label="链接文章地址">
            </el-table-column>
            <el-table-column
                    prop="deleted"
                    label="是否显示"
                    :formatter="formatDeleted"
                    width="100px">
            </el-table-column>
            <el-table-column
                    label="操作">
                <template slot-scope="scope">
                    <el-button type="primary" icon="el-icon-edit"
                               circle @click="getSlideBySlideId(scope.row)"></el-button>
                    <el-button type="danger" icon="el-icon-delete"
                               circle @click="deleteSlideBySlideId(scope.row)"></el-button>
                </template>
            </el-table-column>
        </el-table>
        <el-dialog
                :title="dialogTitle"
                :visible.sync="dialogVisible"
                width="40%"
                :before-close="handleClose">
            <el-form ref="slideForm" :rules="rules" :model="slideForm" label-width="80px" enctype="multipart/form-data">
                <el-form-item label="图片标题" prop="title">
                    <el-input v-model="slideForm.title"></el-input>
                </el-form-item>
                <el-form-item label="文章ID">
                    <el-input v-model="slideForm.articleId"></el-input>
                </el-form-item>
                <el-form-item label="官网显示" v-if="!isInsert">
                    <el-select v-model="slideForm.deleted">
                        <el-option  v-for="item in options"
                                    :key="item.key"
                                    :label="item.label"
                                    :value="item.value">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="图片上传" prop="avatar" v-if="isInsert">
                    <div class="rz-picter">
                       <img :src="slideForm.avatar" class="img-avatar"><br>
                       <input type="file" name="avatar" id="uppic" accept="image/gif,image/jpeg,image/jpg,image/png" @change="changeImage($event)" ref="avatarInput" class="uppic">
                    </div>
                </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="submitToServer('slideForm')">提交</el-button>
            </span>
        </el-dialog>
        <el-dialog
                title="提示"
                :visible.sync="editDialogVisible"
                width="30%">
            <span>是否确认修改数据</span>
            <span slot="footer" class="dialog-footer">
                            <el-button @click="editDialogVisible = false">取 消</el-button>
                            <el-button type="primary" @click="editSlideConfirmed">确 定</el-button>
                        </span>
        </el-dialog>
        <el-dialog
                title="提示"
                :visible.sync="deleteDialogVisible"
                width="30%">
            <span>是否确认删除数据</span>
            <span slot="footer" class="dialog-footer">
                            <el-button @click="deleteDialogVisible = false">取 消</el-button>
                            <el-button type="primary" @click="deleteSlideConfirmed">确 定</el-button>
                        </span>
        </el-dialog>
    </div>
</template>
<script>
    export default {
        name: 'Slide',
        data() {
            return {
                dialogTitle: '添加轮播图',
                isInsert: true,
                dialogVisible: false,
                editDialogVisible: false,
                deleteDialogVisible: false,
                deleteSlideId: null,
                slideForm: {
                    id: null,
                    title: '',
                    img: '',
                    articleAddress: '',
                    articleId: '',
                    deleted: null,
                    avatar: '',
                },
                rules: {
                    title: [
                        {required: true, message: '请输入图片标题', trigger: 'blur'}
                    ],
                    avatar: [
                        {required: true, message: '请插入图片', trigger: 'blur'}
                    ]
                },
                tableData: [{
                    "id": null,
                    "title": "",
                    "img": "",
                    "articleAddress": "",
                    "deleted": null
                }],
                options: [
                    {value: 0,label: '是'},
                    {value: 1,label: '否'}
                ]
            }
        },
        methods: {
            getSlideListInfo: function () {
                this.getRequest("api/show/getAllSlide").then(res => {
                    var data = res.data
                    this.tableData = data
                })
            },
            submitToServer: function (formName) {
                if (this.isInsert){
                    this.$refs[formName].validate((valid) =>{
                        if (valid){
                            var file = new FormData()
                            file.append('file',this.$refs.avatarInput.files[0])
                            this.postRequest('/api/slide/insertSlide', this.slideForm).then(res => {
                                var slideId = res.data
                                if (slideId>0){
                                    this.postRequest('/api/slide/updateSlideImg/' + slideId,file).then(res => {
                                        var data = res.data
                                        if (data>0){
                                            this.dialogVisible = false
                                            this.slideForm = {
                                                id: null,
                                                title: '',
                                                img: '',
                                                articleAddress: '',
                                                deleted: null,
                                                avatar: ''
                                            }
                                            this.getSlideListInfo()
                                        }
                                    })
                                }
                            })
                        }
                    })
                }else {
                    this.editDialogVisible = true
                }
            },
            editSlideConfirmed: function(){
                this.editDialogVisible = false
                var slideVo = this.slideForm
                this.putRequest('api/slide/updateSlide',slideVo).then(res => {
                    var data = res.data
                    if (data > 0){
                        this.dialogVisible = false
                        this.slideForm = {
                            id: null,
                            title: '',
                            img: '',
                            articleAddress: '',
                            deleted: null,
                            avatar: ''
                        }
                        this.getSlideListInfo()
                    }
                })
            },
            deleteSlideConfirmed: function () {
                this.deleteRequest('api/slide/deleteSlideById/'+this.deleteSlideId).then(res => {
                    var data = res.data
                    if (data > 0){
                        this.deleteDialogVisible = false
                        this.getSlideListInfo()
                    }
                })
            },
            getSlideBySlideId: function (val) {
                this.dialogTitle = '修改轮播图'
                this.isInsert = false
                this.dialogVisible = true
                this.getRequest('/api/slide/getSlideInfoBySlidId/'+ val.id).then(res => {
                    var slide = res.data
                    if (slide != null){
                        this.slideForm = slide
                    }
                })
            },
            deleteSlideBySlideId: function (val) {
                this.deleteDialogVisible = true
                this.deleteSlideId = val.id
            },
            handleClose(done) {
                this.$confirm('确认关闭？')
                    .then(_ => {
                        done();
                        this.slideForm = {
                            id: null,
                            title: '',
                            img: '',
                            articleAddress: '',
                            deleted: null,
                            avatar: ''
                        }
                    })
                    .catch(_ => {});
            },
            changeImage: function (e) {
                var file = e.target.files[0]
                var reader = new FileReader()
                var that = this
                reader.readAsDataURL(file)
                reader.onload = function() {
                    that.slideForm.avatar = this.result
                }
            },
            formatDeleted: function (row) {
                return row.deleted === 1 ? '否' : '是'
            },
            dialogV: function () {
                this.dialogVisible = true
                this.dialogTitle = '添加轮播图'
                this.isInsert = true
            }
        },
        mounted() {
            this.getSlideListInfo()
        }
    }
</script>
<style scoped>
.uppic {
    height: 3rem;
    width: 6rem;
}
.img-avatar {
    width: 200px;
    height: 150px;
    margin-bottom: 5px;
}
</style>
