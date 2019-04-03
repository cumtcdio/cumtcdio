<template>
    <div>
        <quill-editor
                v-model="formItem.htmlContent"
                ref="myQuillEditor"
                :options="editorOption">
        </quill-editor>
        <button @click="postToServer">提交</button>
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
                    'id': null,
                    'title': '',
                    'type': 0,
                    'htmlAddress': '',
                    'dateTime': null,
                    'summary': '',
                    'htmlContent': ''
                }
            }
        },
        methods: {
            postToServer: function () {
                this.formItem.summary = '通知测试';
                this.formItem.title = 'cos存储通知';
                this.formItem.type = 0;
                console.log(this.formItem)
                this.formItem.htmlContent += `<script type="text/javascript">
                                                window.onload = function () {
                                                     var h = document.body.scrollHeight;
                                                     parent.postMessage(h, "http://localhost:8080");
                                                }<\/script>`;
                axios.post('/api/show/insertShow',this.formItem).then(res =>{
                    // if(res.status === 200){
                    //     this.finish = true
                    //     this.editorFinish = true
                    //     alert(res.status)
                    // }
                    console.log(res)
                }).catch(error =>{
                    alert(error)
                })
            }
        }
    }
</script>

<style lang="scss" scoped>

</style>