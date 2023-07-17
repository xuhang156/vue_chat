<template>
    <div class="main">
        <sidebar/>
        <div class="content">
            <li>测试1</li>
        </div>
    </div>
</template>

<script>
    import sidebar from '../components/sidebar.vue'
    export default {
    components: { sidebar },
        name: "Dall"
    }
</script>

<style scoped>
.main{
    display: flex;
    width:100%;
}
.content {
  flex: 1; /* 设置内容区域占据剩余空间 */
}
</style>
