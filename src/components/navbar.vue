<template>
    <div class="all-space">
      <div class="sticky-container">
        <div class="header" :style="navBarStyle">
          <div class="box">
            <h1>
              <img src="../assets/logo.png">
              <span>Aubuary</span>
            </h1>
            <nav>
              <router-link active-class="active" to="/chatgpt">ChatGPT</router-link>
              <router-link active-class="active" to="/dall">DALL.E</router-link>
            </nav>
          </div>
          <div class="box">
            <input class="text" type="text" placeholder="请输入关键词~~~" name="search">
            <input class="button" type="button" value="搜索">
            <img src="../assets/portrait.png">
          </div>
        </div>
      </div>
  
      <div class="contents" :style="fill_the_remaining_height">
        <div class="content">
          <router-view></router-view>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: "navbar",
    data() {
      return {
        height: this.$navBarHeight
      };
    },
    computed: {
      fill_the_remaining_height()
      {
        return {
        height: `calc(100vh - ${this.height}px)`
        };
      },

      navBarStyle() {
        return {
          height: `${this.height}px`
        };
      }
    }
  };
  </script>
  
  <style scoped>
  .all-space{
    height: 100vh;
  }
  .sticky-container {
    position: sticky;
    top: 0;
    z-index: 999;
  }
  
  .header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: #292c2f;
    color: #ffffff;
  }
  
  .box {
    display: flex;
    align-items: center;
  }
  
  h1 {
    display: flex;
    align-items: center;
    font: normal 28px Cookie, Arial, Helvetica, sans-serif;
    padding: 0px 20px;
  }
  
  img {
    width: 40px;
    height: 40px;
  }
  
  nav {
    display: flex;
    align-items: center;
    margin: 0px 40px;
    font: 16px Arial, Helvetica, sans-serif;
  }
  
  nav a {
    padding: 0 25px;
    text-decoration: none;
    color: #ffffff;
    font-size: 16px;
    font-weight: normal;
    opacity: 0.9;
  }
  
  nav a:hover {
    opacity: 1;
  }
  
  .active {
    color: #608bd2;
    pointer-events: none;
    opacity: 1;
  }
  
  .text {
    height: 22px;
    font-size: 14px;
    border: 1px solid #ccc;
    padding: 3px 16px;
    border-radius: 20px;
  }
  
  .text:focus {
    outline: none;
    border-color: rgba(82, 168, 236, 0.8);
    box-shadow: inset 0 2px 2px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
  }
  
  .button {
    width: 60px;
    height: 30px;
    font-size: 14px;
    margin-right: 35px;
    border: 1px solid #608bd2;
    background-color: #608bd2;
    border-radius: 20px;
  }
  
  .contents {
    display: flex;
    justify-content: center;
    flex: 1;
  }
  
  .content {
    display: flex;
    width:100%;
    flex: 1;
    background-color: #f0f2f3;
  }
  </style>
  