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
    <!-- 收藏开始 -->
    <div class="container-xl" style="background:#F2F6FC">
      <div>
        <h2 class="pt-5 px-5 pb-2" style="letter-spacing:0.1em; font-size:3.2em">我的收藏</h2>
      </div>
      <div class="row m-0">
        <div class="m-0 p-3 col-lg-6" v-for="(item, index) in loveData1" :key="index">
          <el-row :gutter="12" >
            <el-col>
              <el-card shadow="hover" style="font-size:1.6em">
                 {{item.text}}
                 <div class="d-flex flex-row justify-content-end">
                  <el-button type="primary" size="mini"  class="m-3" @click="editText(item.id,item.text)">编辑</el-button>
                  <el-button type="danger" size="mini"  class="m-3" @click="deleteText(item.id)">删除</el-button>
                  <el-button type="danger" size="mini"  class="m-3" @click="moveTextFromLove(item.id)">移除</el-button>
                 </div>
              </el-card>
            </el-col>
          </el-row>
          
        </div>
      </div>
      <el-divider></el-divider>
      <div>
        <div class="row m-0 py-4">
          <el-row :gutter="12" class="m-0 p-3 col-lg-4 col-md-6" v-for="(item, index) in loveData2" :key="index">
            <el-col>
              <el-card shadow="hover" style="font-size:1.6em">
                 {{attachFile(item.file)}}
                 <div class="d-flex flex-row justify-content-end">
                  <el-button type="primary" size="mini"  class="m-3" @click="editFile(item.id,item.file)">上传</el-button>
                    <el-button type="danger" size="mini"  class="m-3" @click="deleteFile(item.id)">删除</el-button>
                  <el-button type="danger" size="mini" class="m-3" @click="moveFileFromLove(item.id)">移除</el-button>
                 </div>
              </el-card>
            </el-col>
          </el-row>
        </div>
      </div>
    </div>
    <!-- 收藏结束 -->

    <!-- 编辑弹出框 -->
    <el-dialog title="编辑" :visible.sync="editVisible" width="500px">
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="知识内容">
          <el-input type="textarea" v-model="form.text"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini"  @click="editVisible = false">取 消</el-button>
        <el-button type="primary" size="mini" @click="saveEdit">确 定</el-button>
      </span>
    </el-dialog>

    <!-- 删除text提示框 -->
    <el-dialog title="提示" :visible.sync="delTextVisible" width="300px" center>
      <div class="del-dialog-cnt" align="center">删除不可恢复，是否确定删除？</div>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="delTextVisible = false">取 消</el-button>
        <el-button type="primary" size="mini" @click="deleteTextRow">确 定</el-button>
      </span>
    </el-dialog>

    <!-- 移除text提示框 -->
    <el-dialog title="提示" :visible.sync="removeTextVisible" width="300px" center>
      <div class="del-dialog-cnt" align="center">确定从我的收藏里移除这一项吗？</div>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="removeTextVisible = false">取 消</el-button>
        <el-button type="primary" size="mini" @click="removeTextRow">确 定</el-button>
      </span>
    </el-dialog>

    <!-- 删除file提示框 -->
    <el-dialog title="提示" :visible.sync="delFileVisible" width="300px" center>
      <div class="del-dialog-cnt" align="center">删除不可恢复，是否确定删除？</div>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="delFileVisible = false">取 消</el-button>
        <el-button type="primary" size="mini" @click="deleteFileRow">确 定</el-button>
      </span>
    </el-dialog>

    <!-- 移除file提示框 -->
    <el-dialog title="提示" :visible.sync="removeFileVisible" width="300px" center>
      <div class="del-dialog-cnt" align="center">确定从我的收藏里移除这一项吗？</div>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="removeFileVisible = false">取 消</el-button>
        <el-button type="primary" size="mini" @click="removeFileRow">确 定</el-button>
      </span>
    </el-dialog>

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
      form:{
        // 编辑框信息
        id:'',
        text:'',
      },
      centerDialogVisible: false,
      editVisible: false,
      delTextVisible: false,
      removeTextVisible: false,
      delFileVisible: false,
      removeFileVisible: false,
      idx: -1,
      idy: -1,
      idxf: -1,
      idyf: -1,
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
        this.idy = id;
        this.removeTextVisible = true;
    },
    removeTextRow(){
        let id = this.idy;
        let text_flag = 0;
        let params ={text_flag,id};
        axios.post("api/knowledge/updatetextflag",params).then((res) => {
          console.log(res.data); 
          if (res) {
            this.getData()
            this.notify('移除成功', 'success')
          } else {
            this.notify('移除失败', 'error')
          }
        })
        .catch(err => {
          console.log(err)
        })
      this.removeTextVisible = false
    },

    moveFileFromLove(id){
        console.log(id+'......')
        this.idyf = id;
        this.removeFileVisible = true;
    },
    removeFileRow(){
        let id = this.idyf;
        let file_flag = 0;
        let params ={file_flag,id};
        axios.post("api/knowledge/updatefileflag",params).then((res) => {
          console.log(res.data); 
          if (res) {
            this.getData()
            this.notify('移除成功', 'success')
          } else {
            this.notify('移除失败', 'error')
          }
        })
        .catch(err => {
          console.log(err)
        })
      this.removeFileVisible = false
    },
    // 编辑
    editText(id,text){
      console.log(id+'PPPPP');
      this.editVisible = true;
      this.form = {
        id: id,
        text:text,
      }
    },
    // 保存编辑
    saveEdit () {
      let id=this.form.id
      let text=this.form.text
      let params={text,id}            
      console.log(params)
      axios.post('api/knowledge/updateknowledgetext',params).then(res => {
        console.log(res); 
        if (res.data.affectedRows!= 0) {
            this.getData()
            this.notify('编辑成功', 'success')
          } else {
            this.notify('编辑失败', 'error')
          }
        })
        .catch(err => {
          console.log(err)
        })
      this.editVisible = false
    },
    // 获取要删除列表的id
    deleteText(id){
      this.idx = id
      this.delTextVisible = true
    },
    // 确定删除
    deleteTextRow () {
      let id=this.idx;
      let params={id}      
      console.log(params)
      axios.post('api/knowledge/deleteknowledgetext',params).then(res => {
      console.log(res.data); 
          if (res) {
            this.getData()
            this.notify('删除成功', 'success')
          } else {
            this.notify('删除失败', 'error')
          }
        })
        .catch(err => {
          console.log(err)
        })
      this.delTextVisible = false
    },

    deleteFile(id){
      this.idxf = id;
      this.delFileVisible = true;
    },
    deleteFileRow(){
      let id=this.idxf;
      let params={id}      
      console.log(params)
      axios.post('api/knowledge/deleteknowledgefile',params).then(res => {
      console.log(res.data); 
          if (res) {
            this.getData()
            this.notify('删除成功', 'success')
          } else {
            this.notify('删除失败', 'error')
          }
        })
        .catch(err => {
          console.log(err)
        })
      this.delFileVisible = false
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