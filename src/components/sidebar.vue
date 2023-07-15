<template>
    <div class="sidebar" :style="sidbarStyle">
        <p>侧边栏</p>
    </div>
</template>

<script>
    export default {
        name: "sidebar",
        data() {
            return {
            }
        },
        computed:{
            sidbarStyle(){
                return {
                    margin: '0px',
                    position: 'relative',
                    width:'15%',
                }
            }
        }
    }
</script>

<style scoped>
.sidebar {
    background-color:blueviolet;
}
</style>