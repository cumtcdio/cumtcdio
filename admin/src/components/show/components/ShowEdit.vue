<template>
    <div>
        <show-heder></show-heder>
        <div>文章编辑</div>
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
        }
    }
</script>
<style scoped>

</style>