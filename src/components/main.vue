<template>
    <div class="mainChat center-item flex-column">
      <div class="mainChat center-item flex-column" ref="scrollContainer" style="overflow-y: auto;overflow-x: hidden;">
        <div v-for="chat in testDatas" :key="chat.key" :class="['center-item','full-filling-width',(chat.user == 1)?'is-user':'']">
          <div class="filing-80">
            <li>
              <div class="flex-row">
                <div class="iconfont icon-message-comments fix-square-40"></div>
                <div style="flex-grow: 1;display: flex;align-items: center;" v-html="renderMarkdown(chat.text)"></div>
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
  import MarkdownIt from 'markdown-it'
  import Prism from 'prismjs';
  import axios from 'axios';
  
  export default {
    components: { sendmessage },
    methods: {
      renderMarkdown(text) {
        const md = new MarkdownIt();
        return md.render(text);
      },
      handle_question(question) {
        console.log("Father get:", question);
        const html = this.renderMarkdown(question.text);
        this.testDatas.push({ ...question, html });
        console.log(this.testDatas)
        this.$nextTick(() => {
          this.scrollToBottom();
        });
        axios.post("http://192.168.1.114:9000/process_gpt",{message:question})
        .then(response =>{
            if(response.status == 200)
            {
                console.log('gpt data:',response.data);
                const html = this.renderMarkdown(JSON.stringify(response.data));
                this.testDatas.push({user: 2,text: html,html: html});
            }
        }).catch(error =>{
            console.error('failed:',error);
        });
      },
      scrollToBottom() {
        const scroll = this.$refs.scrollContainer;
        scroll.scrollTop = scroll.scrollHeight;
      }
    },
    data() {
      return {
        testDatas: [
          {
            user: 1,
            text: "在上述代码中，我在 .chat-text 的样式中添加了 flex-grow: 1;，以使其在剩余空间中自动扩展。这样，<div>{{ chat.text }}</div> 元素将占满剩余的空间。",
            html: ""
          },
          {
            user: 2,
            text: "hello world2",
            html: ""
          },
          {
            user: 1,
            text: "在上述代码中，我在 .chat-text 的样式中添加了 flex-grow: 1;，以使其在剩余空间中自动扩展。这样，<div>{{ chat.text }}</div> 元素将占满剩余的空间。",
            html: ""
          },
          {
            user: 2,
            text: "hello world2",
            html: ""
          },
          {
            user: 1,
            text: "在上述代码中，我在 .chat-text 的样式中添加了 flex-grow: 1;，以使其在剩余空间中自动扩展。这样，<div>{{ chat.text }}</div> 元素将占满剩余的空间。",
            html: ""
          },
          {
            user: 2,
            text: "<h1>test</h1>",
            html: ""
          }
        ]
      };
    }
  };
  </script>
  
  <style scoped>
  .is-user {
    border-top: 1px solid gray;
    border-bottom: 1px solid gray;
    margin: 10px;
  }
  
  .fix-square-40 {
    width: 40px;
    height: 40px;
    font-size: 40px;
  }
  
  li {
    list-style: none;
  }
  
  .filing-80 {
    width: 80%;
  }
  
  .full-filling-width {
    width: 100%;
  }
  
  .flex-row {
    display: flex;
    flex-direction: row;
    margin: 15px;
  }
  
  .flex-row > *:not(:last-child) {
    margin-right: 20px;
  }
  
  .flex-column {
    display: flex;
    width: 100%;
    flex-direction: column;
  }
  
  .center-item {
    display: flex;
    align-items: center;
    justify-content: center;
  }
  
  .mainChat {
    justify-content: center;
    background-color: rgb(140, 244, 209);
    height: 100%;
  }
  </style>
  