<template>
<div id="headtitle">
    <div class="top-head">
        <el-page-header @back="goBack" content="知识库"></el-page-header>
    </div>
</div>
</template>
<script>
export default {
      created() {
    this.getData();
  }
}
</script>
<style type="text/css">
#headtitle{
    float: right;
    width: 80px;
    height: 100%;
    background-color: #30414D;
    color: #767676;
    padding: 35px 25px 25px 25px;
}
</style>

