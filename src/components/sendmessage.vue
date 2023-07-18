<template>
    <div class="full-filling-width center-item flex-column transparent-bg">
      <div class="filing-60">
        <textarea ref="textarea" rows="1" 
            @keydown.enter.prevent
            placeholder="请输入内容" @input="updateInputValue" @keydown.enter="sendData" :style="{ height: textareaHeight } ">
        </textarea>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
        return {
            textareaHeight: "40px",
        }
    },
    methods: {
        updateInputValue() {
            const textarea = this.$refs.textarea;
            console.log("textarea.scrollHeight",textarea.scrollHeight);
            textarea.style.height = "auto";
            textarea.style.height = textarea.scrollHeight + "px";
            if (textarea.scrollHeight > textarea.clientHeight) {
                textarea.style.overflowY = "scroll";
            } else {
                textarea.style.overflowY = "hidden";
            }
        },
        sendData(event){
            if (event.keyCode === 13) {
              const textarea = this.$refs.textarea;
              const data = textarea.value.trim();
              if (data !== "") {
                textarea.value = "";
                this.$refs.textarea.rows = 1;
                console.log("发送数据:", data);
              }
            }
        }
    },
  };
  </script>
  
  <style scoped>
  textarea {
    width: 100%;
    overflow-y: auto;
    max-height: 200px;
    padding: 0px;
    resize: none; /* 禁止调整大小 */
    overflow: hidden; /* 隐藏溢出内容 */
    line-height: 40px; /* 设置行高，确保每行的高度为20px */
    border-radius: 5px;
  }
  
  .flex-column {
    display: flex;
    flex-direction: column;
  }
  
  .transparent-bg{
    background-color: transparent;
  }
  .full-filling-width {
    width: 100%;
    height: 240px;
  }
  
  .center-item {
    display: flex;
    align-items: center;
    justify-content: center;
  }
  
  .filing-60 {
    width: 60%;
  }
  </style>
  