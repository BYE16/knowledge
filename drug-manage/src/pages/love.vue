<template>
  <div>
    <!-- 导航栏开始 -->
    <div class="container-xl">
      <div class="row head-nav m-0">
        <!-- 左栏开始 -->
        <div class="col-md">
          <!-- 嵌套分栏,左栏文字 -->
          <div class="row align-items-center m-0">
            <div class="col col-md-12">
              <span>个人知识库</span>
            </div>
            <!-- 嵌套分栏,右栏button -->
            <div class="col-auto d-md-none">
              <button
                class="navbar-toggler p-0"
                data-toggle="collapse"
                data-target="#nav1"
              >
                <span class="navbar-toggler-icon">
                  <svg
                    width="0.7em"
                    height="0.7em"
                    viewBox="0 0 16 16"
                    class="bi bi-list"
                    fill="currentColor"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      fill-rule="evenodd"
                      d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"
                    /></svg
                ></span>
              </button>
            </div>
          </div>
        </div>
        <!-- 右栏开始 -->
        <div class="col-md-auto">
          <div id="nav1" class="collapse d-md-block">
            <el-menu
              :default-active="activeIndex"
              class="el-menu-demo d-flex flex-column flex-md-row justify-content-end align-items-end"
              mode="horizontal"
              @select="handleSelect"
              background-color="#545c64"
              text-color="#fff"
              active-text-color="#ffd04b"
            >
              <el-menu-item index="1"
                ><router-link :to="{path:'index',query:{name:currentUser}}">首页</router-link></el-menu-item
              >
              <el-menu-item index="2"
                ><router-link :to="{path:'Book',query:{name:currentUser}}">知识库</router-link></el-menu-item
              >
              <el-menu-item index="3"
                ><router-link :to="{path:'Text',query:{name:currentUser}}">待办事项</router-link></el-menu-item
              >
              <el-menu-item index="4"
                ><router-link :to="{path:'love',query:{name:currentUser}}">我的收藏</router-link></el-menu-item
              >
              <el-menu-item index="5"
                ><router-link to="/">登录/注册</router-link></el-menu-item
              >
              <el-menu-item index="6">
                <el-dropdown trigger="click">
                  <span class="el-dropdown-link" style="font-size:14px; font-family:'幼圆'; font-style:normal;">
                    {{currentUser}}<i class="el-icon-arrow-down el-icon--right" style="font-size:14px;"></i>
                  </span>
                  <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item icon="el-icon-close"><router-link to="/">退出登录</router-link></el-dropdown-item>
                  </el-dropdown-menu>
                </el-dropdown>
              </el-menu-item >
            </el-menu>
          </div>
        </div>
      </div>
    </div>
    <!-- 导航栏结束 -->
    <!-- 收藏开始 -->
    <div class="container-xl" style="background:#F2F6FC">
      <div>
        <h2 class="pt-5 px-5 pb-2" style="letter-spacing:0.1em; font-size:3.2em">我的收藏</h2>
      </div>
      <div class="row m-0">
        <div class="m-0 p-3 col-lg-6" v-for="(item, index) in loveData1" :key="index">
          <el-row :gutter="12" >
            <el-col>
              <el-card shadow="hover" style="font-size:1.6em"> {{item.text}} <el-button type="danger" size="mini" style="float:right" class="m-3" @click="moveTextFromLove(item.id)">移除</el-button></el-card>
            </el-col>
          </el-row>
          
        </div>
      </div>
      <el-divider></el-divider>
      <div>
        <div class="row m-0 py-4">
          <el-row :gutter="12" class="m-0 p-3 col-lg-4 col-md-6" v-for="(item, index) in loveData2" :key="index">
            <el-col>
              <el-card shadow="hover" style="font-size:1.6em"> {{attachFile(item.file)}}<el-button type="danger" size="mini" style="float:right" class="m-3" @click="moveFileFromLove(item.id)">移除</el-button></el-card>
            </el-col>
          </el-row>
        </div>
      </div>
    </div>
    <!-- 收藏结束 -->

    <!-- footer开始 -->
    <div class="container-xl" style="background-color:#545c64">
      <footer class="text-white text-center p-3" style="letter-spacing:0.2em">
        <span>©个人知识库</span>
        <div class="text-white" style="letter-spacing:0.1em; font-size:0.8em">
          <router-link :to="{path:'index',query:{name:currentUser}}" class="routerL">首页</router-link>
          <el-divider direction="vertical"></el-divider>
          <router-link :to="{path:'Book',query:{name:currentUser}}" class="routerL">知识库</router-link>
          <el-divider direction="vertical"></el-divider>
          <router-link :to="{path:'Text',query:{name:currentUser}}" class="routerL">待办事项</router-link>
          <el-divider direction="vertical"></el-divider>
          <router-link :to="{path:'love',query:{name:currentUser}}" class="routerL">我的收藏</router-link>
          <el-divider direction="vertical"></el-divider>
          <router-link to="/" class="routerL">登录/注册</router-link>
        </div>
      </footer>
    </div>
    <!-- footer结束 -->
  </div>
</template>

<script>
import axios from "axios";
import { mixin } from "../mixins/index.js";

export default {
    name:'love',
    mixins: [mixin],
  data() {
    return {
      loveData1: [],
      loveData2: [],
      activeIndex: "1",
      currentUser:'',
    };
  },
  created(){
    this.getParams();
    this.getData();
  },
  methods: {
      handleSelect(key, keyPath) {
    //   console.log(key, keyPath);
    },
    getParams(){
      this.currentUser = this.$route.query.name;
      console.log(this.currentUser+'!!!!!!')
    },
    getData() {
        this.loveData1 = [];
        this.loveData2 = [];
        let name = this.currentUser;
        //通过axios向服务器发出post请求，以获取全部知识的信息。
        axios.post("api/knowledge/getallknowledgetext",{name}).then((res) => {
          console.log(res);
          this.loveData1 = res.data.filter(function(item){return item.text_flag === 1});
          console.log(this.loveData1);
        });
        axios.post("api/knowledge/getallknowledgefile",{name}).then((res) => {
          console.log(res);
          this.loveData2 = res.data.filter(function(item){return item.file_flag === 1});
          console.log(this.loveData2);
        });
    },
    moveTextFromLove(id){
        console.log(id+',,,,,,')
        let text_flag = 0;
        let params ={text_flag,id};
        axios.post("api/knowledge/updatetextflag",params).then((res) => {
          this.getData();
        });
    },
    moveFileFromLove(id){
        console.log(id+'......')
        let file_flag = 0;
        let params ={file_flag,id};
        axios.post("api/knowledge/updatefileflag",params).then((res) => {
          this.getData();
        });
    },
  },
};
</script>

<style scoped>
@media (min-width: 1200px) {
  .container-xl {
    max-width: 1650px;
  }
}
.container-xl {
  padding: 0;
  margin: 0;
}
.head-nav {
  background: #545c64;
}
.head-nav span {
  font-family: "楷体";
  font-size: 40px;
  color: #fff;
  padding-left: 2%;
  font-weight: bold;
  font-style: oblique;
}
a {
  text-decoration: none;
}
a:hover {
  text-decoration: none;
}
.routerL{
  color: white;
}
.routerL:hover{
  color:rgb(255, 208, 75)
}
</style>