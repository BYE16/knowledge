<template>
  <div> 

    <!-- 导航栏开始 -->
    <div class="container-xl">
      <div class="row head-nav m-0">
        <!-- 左栏开始 -->
        <div class="col-lg">
          <!-- 嵌套分栏,左栏文字 -->
          <div class="row align-items-center m-0">
            <div class="col col-lg-12">
              <span>个人知识库</span>
            </div>
            <!-- 嵌套分栏,右栏button -->
            <div class="col-auto d-lg-none">
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
        <div class="col-lg-auto">
          <div id="nav1" class="collapse d-lg-block">
            <el-menu
              :default-active="activeIndex"
              class="el-menu-demo d-flex flex-column flex-lg-row justify-content-end align-items-end"
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

    <toolbar></toolbar>
    <note-list></note-list> 
    <editor></editor> 
  </div>
</template>

<script>
import Toolbar from '@/components/Toolbar'
import NoteList from '@/components/NoteList'
import Editor from '@/components/Editor'

export default {
  data(){
    return{
      currentUser:'',
    }
  },
    name:'test1',
  components:{
    Toolbar,
    NoteList,
    Editor
  },
  created() {
    this.getParams();
  },
  methods:{
    getParams(){
      this.currentUser = this.$route.query.name;
      console.log(this.currentUser+'???????')
    },
  }
};
</script>
<style type="text/css">
html, #test1 {
  height: 100%;
}

body {
  margin: 0;
  padding: 0;
  border: 0;
  height: 100%;
  max-height: 100%;
  position: relative;
}

@media (min-width: 1200px) {
  .container-xl {
    max-width: 1650px;
  }
}
.container-xl {
  float: left;
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
</style>

