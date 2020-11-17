<template>
  <div class="login clearfix">
    <div class="login-wrap">
      <el-row type="flex" justify="center">
        <el-form ref="loginForm" :model="user" status-icon label-width="80px">
          <h3>注册</h3>
          <hr>
          <el-form-item prop="username" label="用户名">
            <el-input v-model="user.username" placeholder="请输入用户名"></el-input>
          </el-form-item>
          <el-form-item prop="email" label="邮箱">
            <el-input v-model="user.email" placeholder="请输入邮箱"></el-input>
          </el-form-item>
          <el-form-item prop="password" label="设置密码">
            <el-input v-model="user.password" show-password placeholder="请输入密码"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" icon @click="doRegister">注册账号</el-button>
          </el-form-item>
          <router-link to="/" style="text-decoration:none; margin-left:200px">已有账号，去登录</router-link>
        </el-form>
      </el-row>
    </div>
  </div>
</template>
 
<script>
import axios from "axios";
export default {
  name: "login",
  data() {
    return {
      user: {
        username: "",
        email: "123456@126.com",
        password: "123456"
      },
    };
  },
  created() {
    // console.log($);
    // console.log("1111");
  },
  methods: {
    doRegister() {
      if (!this.user.username) {
        this.$message.error("请输入用户名！");
        return;
      } else if (!this.user.email) {
        this.$message.error("请输入邮箱！");
        return;
      } else if (this.user.email != null) {
        var reg = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
        if (!reg.test(this.user.email)) {
          this.$message.error("请输入有效的邮箱！");
        } else if (!this.user.password) {
          this.$message.error("请输入密码！");
          return;
        } else {
          // this.$router.push({ path: "/" }); //无需向后台提交数据，方便前台调试
          let name = this.user.username;
          let email = this.user.email;
          let password = this.user.password;
          let params = {name,email,password};
          axios.post("/api/knowledge/adduser", params)
            .then(res => {
              console.log(res)
              console.log(res.data)
              console.log(res.data.length)
              this.$router.push({path:'/'});
              this.$notify({
                title:'注册成功',
                type: 'success'
              })
              // if (res.config.data.length == 1) {
              //   this.$router.push('/login');
              //   console.log("res")
              // } 
              // else {
              //   alert("您输入的用户名已存在！");
              // }
            });
        }
      }
    }
  }
};
</script>
 
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.login {
  width: 100%;
  height: 740px;
  background: url("../assets/images/login_bg.png") no-repeat;
  background-size: cover;
  overflow: hidden;
}
.login-wrap {
  background-color:rgba(255,255,255,0.8);
  background-size: cover;
  width: 400px;
  height: 420px;
  margin: 215px auto;
  overflow: hidden;
  padding-top: 10px;
  line-height: 40px;
}
 
h3 {
  color: #0babeab8;
  font-size: 24px;
}
hr {
  background-color: #444;
  margin: 20px auto;
}
 
.el-button {
  width: 80%;
  margin-left: -20px;
}
</style>