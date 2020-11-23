<template>
  <div id="toolbar">
    <i @click="addOne" class="glyphicon glyphicon-plus"></i>
    <i @click="toggleFavorite" class="glyphicon glyphicon-star" v-bind:class="{starred:activeNote.favorite}"></i>
    <i @click="deleteNote" class="glyphicon glyphicon-remove"></i>
    <el-i @click="drawer = true" type="primary" style="margin-left: 16px;" class="datebox"><br>日历</el-i>
    <el-drawer
      :visible.sync="drawer"
      :with-header="false">
      <div>
        <el-calendar v-model="value"></el-calendar>
     </div>
     </el-drawer>

  </div>
</template>

<script>
export default {
    data() {
      return {
        drawer: false,
        value: new Date()
      };
    },
  computed:{
    activeNote(){
      return this.$store.getters.activeNote
    }
  },
  methods:{
    addOne(){
      //通过dispatch分发到actions中的addNote
      this.$store.dispatch('addNote')
    },
    toggleFavorite(){
      this.$store.dispatch('toggleFavorite')
    },
    deleteNote(){
      this.$store.dispatch('deleteNote')
    },
    switchTo (path) {
      this.$router.replace(path)
    }
  }
}
</script>
<style type="text/css">
	
#toolbar {
  float: left;
  width: 80px;
  height: 100%;
  background-color: #30414D;
  color: #767676;
  padding: 35px 25px 25px 25px;
}
#toolbar i {
  font-size: 30px;
  margin-bottom: 35px;
  cursor: pointer;
  opacity: 0.8;
  transition: opacity 0.5s ease;
}

#toolbar i:hover {
  opacity: 1;
}
.starred {
  color: #F7AE4F;
}
.datebox{
  font-size: 20pt;
  font-weight: bolder;
}
</style>
