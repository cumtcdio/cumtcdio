<template>
    <div class="show">
      <show-header></show-header>
      <show-list></show-list>
    </div>
</template>
<script>
    import ShowHeader from './components/ShowHeader'
    import ShowList from './components/ShowList'
    export default {
        name: 'Show',
        components: {
            ShowHeader,
            ShowList
        }
    }
</script>
<style scoped>

</style>