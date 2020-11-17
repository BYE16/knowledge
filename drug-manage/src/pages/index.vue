 -<template>
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
        <router-link to="Book">更多>></router-link>
      </div>
      <div class="part1-main">
        <div class="part1-main-item row m-0">
          <a
            href=""
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
    <!-- 知识精选结束 -->

    <el-divider></el-divider>

    <!-- 待办事项开始 -->
    <div class="part1 container-xl">
      <div
        class="part1-title d-flex flex-row justify-content-between px-4 pt-5 pb-3"
      >
        <i class="el-icon-date">待办事项</i>
        <router-link to="Text">更多>></router-link>
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
              class="col-md-6 col-lg-4"
            >
              <div style="font-size: 1.2em">
                <p>{{ item.matter }}</p>
              </div>
              <div style="float: right" class="pr-4">
                <p>{{ attachDate(item.date) }}</p>
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
        <router-link to="love">更多>></router-link>
      </div>
      <div class="part1-main">
        <div class="part1-main-item row m-0">
          <div class="row m-0">
            <div
              class="demo-image__preview d-flex flex-column col-sm-6 col-md-3 col-lg-2"
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
                href=""
                class="text-center p-2"
                style="width: 150px; font-size: 1.5em"
                >{{ attachFile(item.file) }}</a
              >
            </div>
          </div>

          <!-- action 接口
                list-type设置文件列表的样式。
                handlePreview 预览
                uploadSuccess 上传成功的回调
                beforeRemove 删除的回调
                fileList 上传的文件数组
                uploadHeader 传给后台的请求头 -->

          <!-- <el-upload
            v-model="form"
            class="upload-demo inline-block"
            :action="uploadUrl(id)"
            list-type="picture-card"
            :on-preview="
              (file) => {
                return handlePreview(file);
              }
            "
            :on-success="
              (res, file, fileList) => {
                return uploadSuccess(res, file, fileList);
              }
            "
            :before-remove="beforeRemove"
            :file-list="fileList"
            ><i class="el-icon-plus"></i
          ></el-upload> -->
          <!-- 把图片标题显示出来 -->
          <!-- <ul class="download-imgs">
            <li
              class="need-enclosure clearfix"
              v-for="(item, index) in attachment"
              :key="index"
            > -->
          <!-- 正则判断文件类型，是doc,xls文件则显示下载二字 -->
          <!-- <a
                class="preview"
                @click="handleDownload(index)"
                v-if="/.docx|.pdf|.xls|.xlsx|.ppt|.pptx|.doc|.txt|.zip|.rar/"
                >下载</a
              >
              {{ item }}
            </li>
          </ul> -->
          <!-- element一个预览图片的组件 -->
          <!-- <el-image-viewer
            v-if="showImgView"
            :on-close="closeViewer"
            :url-list="showImgList"
            :z-index="3000"
          ></el-image-viewer> -->

          <!-- <el-upload action="#" list-type="picture-card" :auto-upload="false">
            <i slot="default" class="el-icon-plus"></i>
            <div slot="file" slot-scope="{ file }">
              <img
                class="el-upload-list__item-thumbnail"
                :src="file.url"
                alt=""
              />
              <span class="el-upload-list__item-actions">
                <span
                  class="el-upload-list__item-preview"
                  @click="handlePictureCardPreview(file)"
                >
                  <i class="el-icon-zoom-in"></i>
                </span>
                <span
                  v-if="!disabled"
                  class="el-upload-list__item-delete"
                  @click="handleDownload(file)"
                >
                  <i class="el-icon-download"></i>
                </span>
                <span
                  v-if="!disabled"
                  class="el-upload-list__item-delete"
                  @click="handleRemove(file)"
                >
                  <i class="el-icon-delete"></i>
                </span>
              </span>
            </div>
          </el-upload>
          <el-dialog :visible.sync="dialogVisible">
            <img width="100%" :src="dialogImageUrl" alt="" />
          </el-dialog> -->
        </div>
      </div>
    </div>
    <!-- 在线文档结束 -->

    <!-- footer开始 -->
    <div class="container-xl" style="background-color: #545c64">
      <footer class="text-white text-center p-3" style="letter-spacing: 0.2em">
        <span>©个人知识库</span>
        <div class="text-white" style="letter-spacing: 0.1em; font-size: 0.8em">
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
      currentUser:'',

      // dialogImageUrl: "",
      // dialogVisible: false,
      // disabled: false,

      // attachment: [],
      // showImgView: false,
      // showImgList: [],
      // fileList: [],
      // uploadHeader: uploadHead(),

      // srcList:[],
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
    getParams(){
      this.currentUser = this.$route.query.name;
      console.log(this.currentUser+'???????')
    },
    getData() {
        let name = this.currentUser;
        this.textDate = [],
        this.thingsData = [],
        //通过axios向服务器发出post请求，以获取全部知识的信息。
        axios.post("api/knowledge/getallknowledgetext",{name}).then((res) => {
          // console.log(res);
          this.textData = res.data;
          // console.log(this.textData);
        });
      //通过axios向服务器发出post请求，以获取全部的待办事项。
      axios.post("api/knowledge/getallthings",{name}).then((res) => {
        // console.log(res);
        this.thingsData = res.data;
        // console.log(this.thingsData);
      });
      // axios.post("api/knowledgeUpload/updateknowledgefile").then((res) => {
      //   // console.log(res);
      //   this.form = res.data;
      //   // console.log(this.form);
      // });
      axios.post("api/knowledge/getallknowledgefile",{name}).then((res) => {
        console.log(res);
        this.filesData = res.data;
        // this.srcList = filesData;
        console.log(this.filesData);
      });
    },
    handleChange(val) {
      // console.log(val);
    },

    // handleRemove(file) {
    //   console.log(file);
    // },
    // handlePictureCardPreview(file) {
    //   this.dialogImageUrl = file.url;
    //   this.dialogVisible = true;
    // },
    // handleDownload(file) {
    //   console.log(file);
    // },

    // displayImg(file, q) {
    //   //正则判断文件后缀是不是图片
    //   let w = q.substring(q.lastIndexOf("."));
    //   const reg = RegExp(/(?:png|jpg|jpeg|JPG|PNG|JPEG)$/);
    //   let result = reg.test(w);
    //   if (result) {
    //     if (file) {
    //       this.showImg(file);
    //     }
    //   } else {
    //     //下载文件
    //     var a = document.createElement("a");
    //     var event = new MouseEvent("click");
    //     a.download = file.name;
    //     a.href = file.url;
    //     a.dispatchEvent(event);
    //   }
    // },
    // //点击加号按钮，如果是图片就预览，如果是文件就下载
    // handlePreview(file) {
    //   //新增图片预览
    //   if (file.name) {
    //     let q = file.name;
    //     //这里要判断用户此时是在新增图片，还是编辑的时候，预览以前上传的图片，
    //     // 因为上传时，我能获得文件名字，但是文件名字并没有保存到后台，
    //     // 所以预览的时候只能根据图片地址去判断文件类型。
    //     this.displayImg(file, q);
    //   } else {
    //     // 单纯预览以前的图片
    //     let q = file.url;
    //     this.displayImg(file, q);
    //   }
    // },
    // showImg(img) {
    //   let a = img.url;
    //   this.showImgList.push(a);
    //   this.showImgView = true;
    // },
    // //下载图片
    // handleDownload(img) {
    //   let a = this.fileList[img];
    //   this.handlePreview(a);
    // },
    // closeViewer() {
    //   this.showImgView = false;
    // },
    // uploadSuccess(rep, file, fileList) {
    //   console.log(rep, file, fileList);
    //   let a = staticUrl + file.response.data;
    //   this.fileList = fileList;
    //   //获取文件名字，上传pdf，doc时显示文件名字
    //   this.attachment.push(file.name);
    // },
    // beforeRemove(file, fileList, index) {
    //   for (let i = 0; i < this.attachment.length; i++) {
    //     if (this.attachment[i] == file.name) {
    //       this.attachment.splice(i, 1);
    //     }
    //   }
    // },
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