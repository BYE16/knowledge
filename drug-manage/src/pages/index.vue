 -<template>
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
                ><router-link
                  :to="{ path: 'index', query: { name: currentUser } }"
                  >首页</router-link
                ></el-menu-item
              >
              <el-menu-item index="2"
                ><router-link
                  :to="{ path: 'Book', query: { name: currentUser } }"
                  >知识库</router-link
                ></el-menu-item
              >
              <el-menu-item index="3"
                ><router-link
                  :to="{ path: 'Text', query: { name: currentUser } }"
                  >待办事项</router-link
                ></el-menu-item
              >
              <el-menu-item index="4"
                ><router-link
                  :to="{ path: 'love', query: { name: currentUser } }"
                  >我的收藏</router-link
                ></el-menu-item
              >
              <el-menu-item index="5"
                ><router-link to="/">登录/注册</router-link></el-menu-item
              >
              <el-menu-item index="6">
                <el-dropdown trigger="click">
                  <span
                    class="el-dropdown-link"
                    style="
                      font-size: 14px;
                      font-family: '幼圆';
                      font-style: normal;
                    "
                  >
                    {{ currentUser
                    }}<i
                      class="el-icon-arrow-down el-icon--right"
                      style="font-size: 14px"
                    ></i>
                  </span>
                  <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item icon="el-icon-close"
                      ><router-link to="/"
                        >退出登录</router-link
                      ></el-dropdown-item
                    >
                  </el-dropdown-menu>
                </el-dropdown>
              </el-menu-item>
            </el-menu>
          </div>
        </div>
      </div>
    </div>
    <!-- 导航栏结束 -->

    <!-- 轮播图开始 -->
    <div class="carouselPart">
      <div class="block">
        <el-carousel height="600px">
          <el-carousel-item v-for="(item, index) in carouselItems" :key="index">
            <img :src="item.url" alt="..." width="100%" height="600px" />
          </el-carousel-item>
        </el-carousel>
      </div>
    </div>
    <!-- 轮播图结束 -->

    <!-- 知识精选开始 -->
    <div class="part1 container-xl" style="background: #f2f6fc">
      <div
        class="part1-title d-flex flex-row justify-content-between px-4 pt-5 pb-3"
      >
        <i class="el-icon-paperclip">知识精选</i>
        <router-link :to="{ path: 'Book', query: { name: currentUser } }"
          >更多>></router-link
        >
      </div>
      <div class="part1-main">
        <div class="part1-main-item row m-0">
          <a
            @click="allText(item.id, item.text)"
            v-for="(item, index) in textData.slice(0, 4)"
            :key="index"
            class="col-lg-3 col-md-6"
          >
            <div
              class="p-3 mx-1 my-2"
              style="border: 0.2em solid #c7cdd3; border-radius: 5%"
            >
              <p>{{ item.text }}</p>
            </div>
          </a>
        </div>
      </div>
    </div>

    <!-- 知识详情内容 -->
    <el-dialog title="详情内容" :visible.sync="allVisible" width="500px">
      <el-form
        ref="form"
        :model="form"
        style="height: 250px; font-size: 1.1em; text-indent: 2em"
      >
        {{ form.text }}
      </el-form>
    </el-dialog>
    <!-- 知识精选结束 -->

    <el-divider></el-divider>

    <!-- 待办事项开始 -->
    <div class="part1 container-xl">
      <div
        class="part1-title d-flex flex-row justify-content-between px-4 pt-5 pb-3"
      >
        <i class="el-icon-date">待办事项</i>
        <router-link :to="{ path: 'Text', query: { name: currentUser } }"
          >更多>></router-link
        >
      </div>
      <div class="part1-main">
        <div class="part1-main-item">
          <el-collapse
            v-model="activeNames"
            @change="handleChange"
            class="p-3 row m-0"
          >
            <el-collapse-item
              :title="item.title"
              :name="index"
              v-for="(item, index) in thingsData.slice(0, 6)"
              :key="index"
              class="col-sm-12 col-md-6 col-lg-4"
            >
              <div style="font-size: 1.2em">
                <p>{{ item.matter }}</p>
              </div>
              <div class="d-flex flex-row justify-content-end align-items-center">
                <div class="pr-4">
                  <p>{{ attachDate(item.date) }}</p>
                </div>
                <div class="pr-4">
                  <p class="el-icon-delete" @click="finish(item.id)"></p>
                </div>
              </div>
            </el-collapse-item>
          </el-collapse>
        </div>
      </div>
    </div>
    <!-- 待办事项结束 -->

    <el-divider></el-divider>

    <!-- 在线文档开始 -->
    <div class="part1 container-xl" style="background: #f2f6fc">
      <div
        class="part1-title d-flex flex-row justify-content-between px-4 pt-5 pb-3"
      >
        <i class="el-icon-folder-opened">在线文档</i>
        <router-link :to="{ path: 'love', query: { name: currentUser } }"
          >更多>></router-link
        >
      </div>
      <div class="part1-main">
        <div class="part1-main-item row m-0">
          <div class="row m-0 align-items-center" style="width: 100%">
            <div
              class="demo-image__preview d-flex flex-column col-xs-6 col-sm-4 col-md-3 col-lg-2 justify-content-center align-items-center"
              style="width: 50%"
              v-for="(item, index) in filesData"
              :key="index"
            >
              <el-image
                style="
                  width: 150px;
                  height: 150px;
                  border: 2px dotted #cccccc;
                  border-radius: 10px;
                "
                :src="getUrl(item.file)"
              >
                <!-- :preview-src-list="srcList" -->
              </el-image>
              <a
                :href="'http://127.0.0.1:3300' + item.file"
                class="text-center p-2"
                style="width: 150px; font-size: 1.5em"
                >{{ attachFile(item.file) }}</a
              >
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 在线文档结束 -->

    <!-- footer开始 -->
    <div class="container-xl" style="background-color: #545c64">
      <footer class="text-white text-center p-3" style="letter-spacing: 0.2em">
        <span>©个人知识库</span>
        <div class="text-white" style="letter-spacing: 0.1em; font-size: 0.8em">
          <router-link
            :to="{ path: 'index', query: { name: currentUser } }"
            class="routerL"
            >首页</router-link
          >
          <el-divider direction="vertical"></el-divider>
          <router-link
            :to="{ path: 'Book', query: { name: currentUser } }"
            class="routerL"
            >知识库</router-link
          >
          <el-divider direction="vertical"></el-divider>
          <router-link
            :to="{ path: 'Text', query: { name: currentUser } }"
            class="routerL"
            >待办事项</router-link
          >
          <el-divider direction="vertical"></el-divider>
          <router-link
            :to="{ path: 'love', query: { name: currentUser } }"
            class="routerL"
            >我的收藏</router-link
          >
          <el-divider direction="vertical"></el-divider>
          <router-link to="/" class="routerL">登录/注册</router-link>
        </div>
      </footer>
    </div>
    <!-- footer结束 -->
  </div>
</template>

<script>
//导入axios
import axios from "axios";
import { mixin } from "../mixins/index.js";

export default {
  name: "index",
  mixins: [mixin],
  data() {
    return {
      carouselItems: [
        {
          url: require("@/assets/img/1.jpg"),
        },
        {
          url: require("@/assets/img/2.jpg"),
        },
        {
          url: require("@/assets/img/3.jpg"),
        },
        {
          url: require("@/assets/img/4.jpg"),
        },
      ],
      routers: this.$router.options.routes,
      activeIndex: "1",
      textData: [],
      thingsData: [],
      filesData: [],
      activeNames: ["1"],
      currentUser: "",
      allVisible: false,
      form: {
        id: "",
        text: "",
      },
    };
  },
  created() {
    this.getParams();
    this.getData();
  },
  methods: {
    handleSelect(key, keyPath) {
      // console.log(key, keyPath);
    },
    uploadUrl(id) {
      return `/api/knowledgeUpload/updateknowledgefile?id=${id}`;
    },
    getParams() {
      this.currentUser = this.$route.query.name;
      console.log(this.currentUser + "???????");
    },
    getData() {
      let name = this.currentUser;
      (this.textDate = []),
        (this.thingsData = []),
        //通过axios向服务器发出post请求，以获取全部知识的信息。
        axios
          .post("api/knowledge/getallknowledgetext", { name })
          .then((res) => {
            // console.log(res);
            this.textData = res.data;
            // console.log(this.textData);
          });
      //通过axios向服务器发出post请求，以获取全部的待办事项。
      axios.post("api/knowledge/getallthings", { name }).then((res) => {
        // console.log(res);
        this.thingsData = res.data.filter(function (item) {
          return item.thing_flag === 0;
        });
        // console.log(this.thingsData);
      });
      // axios.post("api/knowledgeUpload/updateknowledgefile").then((res) => {
      //   // console.log(res);
      //   this.form = res.data;
      //   // console.log(this.form);
      // });
      axios.post("api/knowledge/getallknowledgefile", { name }).then((res) => {
        console.log(res);
        this.filesData = res.data;
        // this.srcList = filesData;
        console.log(this.filesData);
      });
    },
    handleChange(val) {
      // console.log(val);
    },

    allText(id, text) {
      console.log(id + "PPPPP");
      this.allVisible = true;
      this.form = {
        id: id,
        text: text,
      };
    },
    finish(id){
        console.log(id+'eeeee')
        let text_flag = 1;
        let params ={text_flag,id};
        axios.post("api/knowledge/updatethingflag",params).then((res) => {
          console.log(res.data); 
          this.getData();
        })
        .catch(err => {
          console.log(err)
        })
    },
  },
};
</script>

<style >
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
.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 150px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}
.part1 .part1-title i {
  padding: 1%;
  font-size: 2.3em;
  letter-spacing: 0.2em;
}
.part1-main {
  padding: 0 2% 2% 2%;
}
.part1-main-item a {
  color: black;
}
.part1-main-item a p {
  width: 100%;
  height: auto;
  font-size: 16px;
  display: -webkit-box !important;
  overflow: hidden;
  text-overflow: ellipsis;
  word-break: break-all;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 5;
  line-height: 1.5em;
}
.el-collapse-item__header {
  font-size: 1.5em !important;
}
.routerL {
  color: white;
}
.routerL:hover {
  color: rgb(255, 208, 75);
}

.need-enclosure {
  display: inline-block;
  margin-right: 5px;
  position: relative;
  padding-left: 24px;
}

.need-enclosure p {
  /* 文件名过长后显示省略号 */
  width: 128px;
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
}
.preview {
  position: absolute;
  left: 46px;
  bottom: 47px;
  cursor: pointer;
  border: 1px solid #ddd;
  padding: 0 10px;
  color: green;
}
.preview-img {
  width: 70px;
  height: 47px;
}
.natural-img {
  width: 90px;
  height: 67px;
}
.need-enclosure:hover .img-hover {
  display: block;
}

.el-dropdown-link {
  cursor: pointer;
  color: #409eff;
}
.el-icon-arrow-down {
  font-size: 12px;
}
</style>