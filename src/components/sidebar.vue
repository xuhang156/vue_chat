<template>
  <div class="sidebar" >
    <div class="addChatContainer">
      <a @click="addChat" class="addChatButton">+ 新建聊天</a>
    </div>
    <div class="chatList"  @mouseover="showScrollBar" @mouseleave="hideScrollBar" :style="sidebarStyle">
      <li v-for="chat in chatList" :key="chat.key" @click="printChat(chat)" :class="{active:chat.selected}">
        <div class="chatItem">
          <div class="avatar iconfont icon-message-comments">
          </div>
          <div class="chatInfo">
            <input  class="listInput" v-if="chat.editable" v-model="chat.name">
            <div class="listInput" v-else>{{ chat.name }}</div>
          </div>
          <div class="flushright chatItem">
            <button @click="modifyChat(chat)" v-if="chat.selected && !chat.editable">
              <span class="iconfont icon-chuangzuo" ></span>
            </button>
            <button @click="deleteChat(chat)" v-if="chat.selected && !chat.editable">
              <span class="iconfont icon-delete" ></span>
            </button>
            <button @click="modifyOk(chat)" v-if="chat.selected && chat.editable">
              <span class="iconfont icon-down" ></span>
            </button>
            <button @click="revocation(chat)" v-if="chat.selected && chat.editable">
              <span class="iconfont icon-close" ></span>
            </button>
          </div>
        </div>
      </li>
    </div>
  </div>
</template>

<script>
export default {
  name: "sidebar",
  data() {
    return {
      scrollBar:"auto",
      chatList: [
        {key:1, name: "Test1", editable: false, backup: "",selected:false},
        {key:2, name: "Test2", editable: false, backup: "",selected:false}
      ]
    };
  },
  methods: {
    showScrollBar()
    {
      this.scrollBar = "scroll";
      console.log(this.scrollBar);
    },
    hideScrollBar()
    {
      this.scrollBar = "auto";
      console.log(this.scrollBar);
    },
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
      this.chatList.forEach(item => {
        if (item !== chat) {
          item.selected = false;
        }
      });
      chat.selected = true;
      console.log(chat);
    }
  },
  computed: {
    sidebarStyle() {
      return {
        margin: "0px",
        width: "250px",
        overflowY:this.scrollBar
      };
    }
  }
};
</script>
<style scoped>
.chatList::-webkit-scrollbar {
  width: 8px; /* scrollbar width */
}

.chatList::-webkit-scrollbar-track {
  background-color: #eee; /* track background color */
}

.chatList::-webkit-scrollbar-thumb {
  background-color: #888; /* thumb color */
}
  a {
    margin:10px ;
    width: 80%;
    height: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
    border: 1px solid wheat;
    border-radius: 7px;
    user-select: none;
  }
  li :hover{
    border-radius: 10px;
    background-color: lightblue;
  }
  li{
    list-style:none;
    margin: 10px;
    border-radius: 10px;
  }

  img {
    width: 25px;
    height: 25px;
  }
.addChatContainer {
  width: 100%;
  justify-content: center;
  align-items: center;
}
  .addChatButton:hover {
    background-color: aliceblue;
    cursor: pointer;
  }
  
  .flushright
  {
    height: 30px;
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
    width:20px;
    height: 20px;
    margin-right: 10px;
    align-items: center;
  }
  .chatList {
    margin-top: 20px;
    width: 100%;
    overflow-y: auto;
  }
  .chatList p {
    margin: 0;
  }
  .chatList button{
    border: none;
    margin: 2px;
    background-color: transparent;
  }
  .active {
    background-color: lightblue;
}
  </style>
  