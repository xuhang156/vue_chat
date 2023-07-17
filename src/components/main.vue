<template>
    <div class="mainChat">
        <div>
            <li v-for="chat in testDatas" :key="chat.key">
                <div class="iconfont icon-message-comments">img{{ chat.user }}</div>
                <div>{{ chat.text }}</div>
            </li>
        </div>
    </div>
</template>
<script>
   export default
   {
        data() {
            return {
                testDatas:
                [
                    {
                        key:1,
                        user:1,
                        text:"hello world"
                    },    
                    {
                        key:2,
                        user:2,
                        text:"hello world2"
                    }
                ]
            }
        },
   }
</script>
<style scoped>
.mainChat{
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: rgb(140, 244, 209);
    height: 100%;
}
</style>