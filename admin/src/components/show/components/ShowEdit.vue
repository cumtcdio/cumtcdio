<template>
    <div>
        <show-heder></show-heder>
        <div>文章{{edit}}</div>
        <quill-editor></quill-editor>
    </div>
</template>
<script>
    import ShowHeder from './ShowHeader'
    import QuillEditor from './QuillEditor'
    export default {
        name: 'ShowEditor',
        components: {
            ShowHeder,
            QuillEditor
        },
        data () {
            return {
                edit: '添加'
            }
        },
        methods: {
            initEdit: function () {
                var index = parseInt(this.$route.params.index);
                if (index === 0){
                    this.edit = '添加'
                }else {
                    this.edit = '编辑'
                }
            }
        },
        mounted() {
            this.initEdit()
        },
        watch: {
            $route: function () {
                this.initEdit()
            }
        }
    }
</script>
<style scoped>

</style>