<template>
    <div class="formItem">
        <el-form ref="formItem" :rules="rules" :model="formItem" label-width="80px">
            <el-form-item label="标题" prop="title">
                <el-input v-model="formItem.title"></el-input>
            </el-form-item>
            <el-form-item label="简要说明" prop="summary">
                <el-input type="textarea" v-model="formItem.summary"></el-input>
            </el-form-item>
            <el-form-item prop="htmlContent" label="正文">
                <quill-editor
                        v-model="formItem.htmlContent"
                        ref="myQuillEditor"
                        :options="editorOption">
                </quill-editor>
            </el-form-item>
            <el-form-item>
                <el-button type="success" size="small" @click="postToServer('formItem')"
                           style="display:block;margin:7px auto">立即提交</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<script>
    import 'quill/dist/quill.core.css'
    import 'quill/dist/quill.snow.css'
    import 'quill/dist/quill.bubble.css'
    import axios from 'axios'
    import { quillEditor } from 'vue-quill-editor'
    export default {
        components:{
            quillEditor
        },
        data () {
            return{
                editorOption:{
                    modules:{
                        toolbar:[
                            ['bold', 'italic', 'underline', 'strike'],    //加粗，斜体，下划线，删除线
                            ['blockquote', 'code-block'],     //引用，代码块

                            [{ 'header': 1 }, { 'header': 2 }],        // 标题，键值对的形式；1、2表示字体大小
                            [{ 'list': 'ordered'}, { 'list': 'bullet' }],     //列表
                            [{ 'script': 'sub'}, { 'script': 'super' }],   // 上下标
                            [{ 'indent': '-1'}, { 'indent': '+1' }],     // 缩进
                            [{ 'direction': 'rtl' }],             // 文本方向

                            [{ 'size': ['small', false, 'large', 'huge'] }], // 字体大小
                            [{ 'header': [1, 2, 3, 4, 5, 6, false] }],     //几级标题

                            [{ 'color': [] }, { 'background': [] }],     // 字体颜色，字体背景颜色
                            [{ 'font': [] }],     //字体
                            [{ 'align': [] }],    //对齐方式

                            ['clean'],    //清除字体样式
                            ['image','video']    //上传图片、上传视频

                        ]
                    },
                    theme:'snow'
                },
                formItem: {
                    id: null,
                    title: '',
                    type: this.$store.state.showType,
                    htmlAddress: '',
                    dateTime: null,
                    summary: '',
                    htmlContent: ''
                },
                rules: {
                    title: [
                        {required: true, message: '请输入标题', trigger: 'blur' }
                    ],
                    summary: [
                        {required: true, message: '请输入简要说明', trigger: 'blur'}
                    ],
                    htmlContent: [
                        {required: true, message: '请输入正文内容', trigger: 'blur'}
                    ]
                },
                showId: 0
            }
        },
        methods: {
            postToServer: function (formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        var id = parseInt(this.$route.params.index);
                        if (id === 0) {
                            this.insetShow()
                        } else {
                            this.updateShow()
                        }

                    } else {
                        return false
                    }
                })
            },
            insetShow: function () {
                this.formItem.type = this.$store.state.showType;
                axios.post('/api/show/insertShow',this.formItem).then(res =>{
                    if(res.status === 200){
                        this.$router.push('/show/' + this.$store.state.showType)
                    }
                }).catch(error =>{
                    alert(error)
                })
            },
            updateShow: function () {
                axios.put('/api/show/updateShowByShowId', this.formItem).then(res => {
                    if (res.status === 200) {
                        this.$router.push('/show/' + this.$store.state.showType)
                    }
                }).catch(error =>{
                    alert(error)
                })
                // console.log(this.formItem)
            },
            getForItemIfExit: function (id) {
                if (id) {
                    axios.get("/api/show/getUpdateShowByShowId/" + id).then(response => {
                        var data = response.data
                        if (data.data){
                            this.formItem = data.data
                            this.formItem.id = data.data.showId
                        }
                    })
                }
            },
            initIfShowIdIsNotZero: function () {
                var id = parseInt(this.$route.params.index);
                if (id === 0) {
                    this.formItem = {
                        id: null,
                        title: '',
                        type: this.$store.state.showType,
                        htmlAddress: '',
                        dateTime: null,
                        summary: '',
                        htmlContent: ''
                    }
                }else {
                    this.showId = id;
                    this.getForItemIfExit(this.showId)
                }
            }
        },
        mounted() {
            this.initIfShowIdIsNotZero()
        },
        watch: {
            $route: function () {
                this.initIfShowIdIsNotZero()
            }
        }
    }
</script>

<style lang="scss" scoped>

</style>