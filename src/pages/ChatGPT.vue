<template>
    <div class="main">
        <sidebar/>
        <div class="content">
            <Main/>
        </div>
    </div>
</template>

<script>
    import sidebar from '../components/sidebar.vue'
    import Main from '../components/main.vue';
    export default {
        components: { sidebar, Main },
        name: "ChatGPT"
    }
</script>

<style scoped>
.main{
    display: flex;
    width:100%;
}
.content {
  flex: 1;
}
</style>