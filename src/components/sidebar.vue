<template>
  <div class="sidebar" :style="sidebarStyle">
    <a @click="addChat" class="addChatButton">+ New Chat</a>
    <div class="chatList">
      <ul>
        <li v-for="chat in chatList" :key="chat.key" @click="printChat(chat)">
          <div class="chatItem">
            <div class="avatar">
              <img src="../assets/globe-solid.svg" alt="">
            </div>
            <div class="chatInfo">
              <input  class="listInput" v-if="chat.editable" v-model="chat.name">
              <div class="listInput" v-else>{{ chat.name }}</div>
            </div>
            <div class="flushright chatItem">
              <button @click="modifyChat(chat)" v-if="!chat.editable">
                <span class="iconfont icon-chuangzuo" ></span>
              </button>
              <button @click="deleteChat(chat)" v-if="!chat.editable">
                <span class="iconfont icon-delete" ></span>
              </button>
              <button @click="modifyOk(chat)" v-if="chat.editable">
                <span class="iconfont icon-down" ></span>
              </button>
              <button @click="revocation(chat)" v-if="chat.editable">
                <span class="iconfont icon-close" ></span>
              </button>
            </div>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: "sidebar",
  data() {
    return {
      chatList: [
        {key:1, name: "Test1", editable: false, backup: "" },
        {key:2, name: "Test2", editable: false, backup: "" }
      ]
    };
  },
  methods: {
    modifyOk(chat) {
      chat.editable = false;
      chat.backup = "";
      console.log("修改后", chat.name);
    },
    revocation(chat) {
      console.log("撤销：", chat.backup, chat.name);
      chat.name = chat.backup;
      chat.editable = false;
      chat.backup = "";
    },
    modifyChat(chat) {
      chat.editable = !chat.editable;
      chat.backup = chat.name;
    },
    deleteChat(chat) {
      this.chatList = this.chatList.filter(item => item.name !== chat.name);
      console.log("删除聊天:", chat);
    },
    addChat() {
      alert("Add chat");
      this.chatList.unshift({ name: "新建聊天" });
    },
    printChat(chat) {
      console.log(chat);
    }
  },
  computed: {
    sidebarStyle() {
      return {
        margin: "0px",
        width: "250px"
      };
    }
  }
};
</script>
<style scoped>
  ul{
    margin: 0px;
  }
  a {
    margin-top:10px ;
    width: 80%;
    height: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
    border: 1px solid wheat;
    border-radius: 7px;
    user-select: none;
  }
  li{
    list-style:none;
    margin: 0px;
  }

  img {
    width: 25px; /* 设置宽度为200像素 */
    height: 25px; /* 设置高度为150像素 */
  }
  .addChatButton:hover {
    background-color: aliceblue;
    cursor: pointer;
  }
  
  .flushright
  {
    margin-left: auto;
  }
  .listInput{
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
    width:90px;
  }
  .chatItem
  {
    padding: 5px;
    display: flex;
    flex-direction: row;
    align-items: center;
  }
  .sidebar {
    background-color: blueviolet;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .avatar {
    margin-right: 10px;
    align-items: center;
  }
  .chatList {
    margin-top: 20px;
    width: 100%;
  }
  .chatList p {
    margin: 0;
  }
  .chatList button{
    border: none;
    margin: 2px;
    background-color: transparent;
  }
  </style>
  