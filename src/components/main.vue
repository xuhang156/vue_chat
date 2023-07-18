<template>
    <div class="mainChat center-item flex-column">
        <div class="mainChat center-item flex-column" style="overflow-y: auto;overflow-x: hidden;">
            <div v-for="chat in testDatas" :key="chat.key" :class="['center-item','full-filling-width',(chat.user == 1)?'is-user':'']">
                <div class="filing-80">
                    <li>
                        <div class="flex-row">
                            <div class="iconfont icon-message-comments fix-square-40"></div>
                            <div style="flex-grow: 1;display: flex;align-items: center;">{{ chat.text }}</div>
                        </div>
                    </li>
                </div>
            </div>
        </div>
        <sendmessage @question="handle_question"/>
    </div>

</template>
<script>
import sendmessage from './sendmessage.vue'
   export default
   {
        components: { sendmessage },
        methods:{
            handle_question(question){
                console.log("Father get:",question);
                this.testDatas.push(question);
            }
        },
        data() {
            return {
                testDatas:
                [
                    {
                        user:1,
                        text:"在上述代码中，我在 .chat-text 的样式中添加了 flex-grow: 1;，以使其在剩余空间中自动扩展。这样，<div>{{ chat.text }}</div> 元素将占满剩余的空间。"
                    },    
                    {
                        user:2,
                        text:"hello world2"
                    },
                    {
                        user:1,
                        text:"在上述代码中，我在 .chat-text 的样式中添加了 flex-grow: 1;，以使其在剩余空间中自动扩展。这样，<div>{{ chat.text }}</div> 元素将占满剩余的空间。"
                    },    
                    {
                        user:2,
                        text:"hello world2"
                    },
                    {
                        user:1,
                        text:"在上述代码中，我在 .chat-text 的样式中添加了 flex-grow: 1;，以使其在剩余空间中自动扩展。这样，<div>{{ chat.text }}</div> 元素将占满剩余的空间。"
                    },    
                    {
                        user:2,
                        text:"hello world2"
                    },
                    {
                        user:1,
                        text:"在上述代码中，我在 .chat-text 的样式中添加了 flex-grow: 1;，以使其在剩余空间中自动扩展。这样，<div>{{ chat.text }}</div> 元素将占满剩余的空间。"
                    },    
                    {
                        user:2,
                        text:"hello world2"
                    },
                    {
                        user:1,
                        text:"在上述代码中，我在 .chat-text 的样式中添加了 flex-grow: 1;，以使其在剩余空间中自动扩展。这样，<div>{{ chat.text }}</div> 元素将占满剩余的空间。"
                    },    
                    {
                        user:2,
                        text:"hello world2"
                    },
                    
                ]
            }
        },
   }
</script>
<style scoped>
.is-user{
    border-top: 1px solid gray; /* 边框样式为实线 */
    border-bottom: 1px solid gray; /* 边框样式为实线 */
    margin: 10px;
    /* background-color: blueviolet; */
}
.fix-square-40
{
    width: 40px;
    height: 40px;
    font-size: 40px; 
}

li{
    list-style:none;
}

.filing-80{
    width: 80%;
}
.full-filling-width
{
    width: 100%;
}
.flex-row{
    display: flex;
    flex-direction: row;
    margin: 15px;
}
.flex-row > *:not(:last-child) {
  margin-right: 20px;
}
.flex-column{
    display: flex;
    width: 100%;
    flex-direction: column;
}

.center-item{
    display: flex;
    align-items: center;
    justify-content: center;
}

.mainChat{
    justify-content: center;
    background-color: rgb(140, 244, 209);
    height: 100%;
}
</style>