<template>

  <div class="table">
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
                ><router-link to="/">首页</router-link></el-menu-item
              >
              <el-menu-item index="2"
                ><router-link to="Book">知识库</router-link></el-menu-item
              >
              <el-menu-item index="3"
                ><router-link to="Text">待办事项</router-link></el-menu-item
              >
              <el-menu-item index="4"
                ><router-link to="love">我的收藏</router-link></el-menu-item
              >
              <el-menu-item index="5"
                ><router-link to="login">登录/注册</router-link></el-menu-item
              >
            </el-menu>
          </div>
        </div>
      </div>
    </div>
    <!-- 导航栏结束 -->
    <div class="container">
      <h1>我的笔记本</h1>
      <div class="handle-box">
        <el-button
          type="primary"
          size="mini"
          class="handle-del mr10"
          @click="delAll"
          >批量删除</el-button
        >
        <el-input
          v-model="select_word"
          size="mini"
          placeholder="筛选关键词"
          class="handle-input mr10"
        ></el-input>
        <el-button
          type="primary"
          size="mini"
          @click="centerDialogVisible = true"
          >新建</el-button
        >
      </div>
      <el-table
        ref="multipleTable"
        size="mini"
        border
        style="width: 100%"
        height="550px"
        :data="data"
        @selection-change="handleSelectionChange"
      >
        <el-table-column type="selection" width="40"></el-table-column>
        <el-table-column
          prop="name"
          label="标题"
          width="120"
          align="center"
        ></el-table-column>
        <el-table-column label="科目" width="50" align="center">
          <template slot-scope="scope">
            <div>{{ scope.row.brand }}</div>
          </template>
        </el-table-column>
        <el-table-column label="内容">
          <template slot-scope="scope">
            <p style="height: 100px; overflow: scroll">
              {{ scope.row.introduction }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="150" align="center">
          <template slot-scope="scope">
            <el-button size="mini" @click="handleEdit(scope.row)"
              >编辑</el-button
            >
            <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.row.id)"
              >删除</el-button
            >
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          @current-change="handleCurrentChange"
          background
          layout="total, prev, pager, next"
          :current-page="currentPage"
          :page-size="pageSize"
          :total="tableData.length"
        >
        </el-pagination>
      </div>
    </div>
    <el-dialog
      title="记录内容"
      :visible.sync="centerDialogVisible"
      width="400px"
      center
    >
      <el-form
        :model="registerForm"
        status-icon
        ref="registerForm"
        label-width="80px"
        class="demo-ruleForm"
      >
        <el-form-item prop="name" label="标题名" size="mini">
          <el-input v-model="registerForm.name" placeholder="标题名"></el-input>
        </el-form-item>
        <el-form-item prop="brand" label="科目名" size="mini">
          <el-input v-model="registerForm.brand" placeholder="科目名"></el-input>
        </el-form-item>
        <el-form-item prop="introduction" label="内容" size="mini">
          <el-input
            v-model="registerForm.introduction"
            type="textarea"
            placeholder="内容"
          ></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="centerDialogVisible = false"
          >取 消</el-button
        >
        <el-button type="primary" size="mini" @click="adddrug"
          >确 定</el-button
        >
      </span>
    </el-dialog>
    <!-- 编辑弹出框 -->
    <el-dialog title="编辑" :visible.sync="editVisible" width="800px">
      <el-form ref="form" :model="form"  label-position="left" label-width="200px">
        <el-form-item label="标题" size="mini">
          <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item label="科目" size="mini">
          <el-input v-model="form.brand"></el-input>
        </el-form-item>
        <el-form-item label="内容" size="medium">
          <el-input type="textarea" v-model="form.introduction"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="editVisible = false">取 消</el-button>
        <el-button type="primary" size="mini" @click="saveEdit"
          >确 定</el-button
        >
      </span>
    </el-dialog>
    <!-- 删除提示框 -->
    <el-dialog title="提示" :visible.sync="delVisible" width="300px" center>
      <div class="del-dialog-cnt" align="center">
        删除不可恢复，是否确定删除？
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="delVisible = false">取 消</el-button>
        <el-button type="primary" size="mini" @click="deleteRow"
          >确 定</el-button
        >
      </span>
    </el-dialog>
  </div>
</template>
<script>
//导入外部js文件
import { mixin } from "../mixins/index.js";
import axios from "axios";

export default {
  name: "drug-page",
  //注意：以下代码导入mixin中的方法供本组件使用。
  mixins: [mixin],
  data() {
    return {
      labelPosition: 'right',
      registerForm: {
        // 添加框信息
        name: "",
        brand:"",
        introduction: "",
        
      },
      tableData: [],
      tempData: [],
      multipleSelection: [],
      centerDialogVisible: false,
      editVisible: false,
      delVisible: false,
      select_word: "",
      form: {
        // 编辑框信息
        id: "",
        name: "",
        brand:"",
        introduction: "",
        
      },
      pageSize: 5, // 页数
      currentPage: 1, // 当前页
      idx: -1,
    };
  },

  computed: {
    // 计算当前表格中的数据，用于分页。
    data() {
      return this.tableData.slice(
        (this.currentPage - 1) * this.pageSize,
        this.currentPage * this.pageSize
      );
    },
  },
  watch: {
    //实现实时查询功能
    select_word: function () {
      if (this.select_word === "") {
        this.tableData = this.tempData;
      } else {
        this.tableData = [];
        for (let item of this.tempData) {
          if (item.name.includes(this.select_word)) {
            this.tableData.push(item);
          }
        }
      }
    },
  },
  created() {
    this.getData();
  },
  methods: {
    // 获取当前页
    handleCurrentChange(val) {
      this.currentPage = val;
    },
    // 添加
    adddrug() {
      let name = this.registerForm.name;
      let brand = this.registerForm.brand;
      let introduction = this.registerForm.introduction;
      
      let params = { name, brand, introduction};
      console.log(params);
      //通过axios向服务器发出post请求，添加一条记录。
      axios
        .post("api/drug/adddrug", params)
        .then((res) => {
          console.log(res);
          if (res.data.affectedRows != 0) {
            this.getData();
            this.registerForm = {};
            this.notify("添加成功", "success");
          } else {
            this.notify("添加失败", "error");
          }
        })
        .catch((err) => {
          console.log(err);
        });
      this.centerDialogVisible = false;
    },
    // 获取
    getData() {
      this.tableData = [];
      this.tempData = [];
      //通过axios向服务器发出post请求，获取所有记录。
      axios.post("api/drug/getalldrugs").then((res) => {
        console.log(res);
        this.tableData = res.data;
        this.tempData = res.data;
        this.currentPage = 1;
      });
    },
    // 编辑
    handleEdit(row) {
      this.editVisible = true;
      this.idx = row.id;
      this.form = {
        id: row.id,
        name: row.name,
        brand: row.brand,
        introduction: row.introduction,
        
      };
    },
    // 保存编辑
    saveEdit() {
      let id = this.form.id;
      let name = this.form.name;
      let brand = this.form.brand;
      let introduction = this.form.introduction;
      
      let params = { name, brand, introduction,id };
      console.log(params);
      //通过axios向服务器发出post请求，更新一条记录。
      axios
        .post("api/drug/updatedrug", params)
        .then((res) => {
          console.log(res);
          if (res.data.affectedRows != 0) { 
            this.getData();
            this.notify("编辑成功", "success");
          } else {
            this.notify("编辑失败", "error");
          }
        })
        .catch((err) => {
          console.log(err);
        });
      this.editVisible = false;
    },
    // 确定删除
    deleteRow() {
      let id = this.idx;
      let params = { id };
      console.log(params);
      //通过axios向服务器发出post请求，删除一条记录。
      axios
        .post("api/drug/deletedrug", params)
        .then((res) => {
          console.log(res.data);
          if (res) {
            this.getData();
            this.notify("删除成功", "success");
          } else {
            this.notify("删除失败", "error");
          }
        })
        .catch((err) => {
          console.log(err);
        });
      this.delVisible = false;
    },
  },
};
</script>

<style scoped>
.handle-box {
  margin-bottom: 20px;
}

.handle-input {
  width: 300px;
  display: inline-block;
}

.pagination {
  display: flex;
  justify-content: center;
}
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

</style>
