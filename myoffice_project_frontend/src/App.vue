<template>
  <div id="app">

    <!--缓存的页面<keep-alive>
      <router-view v-if="$route.meta.keepAlive"></router-view>
    </keep-alive>-->
    
    <!--不缓存的页面<router-view v-if="!$route.meta.keepAlive"></router-view>-->
    

    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'App',

  // provide() { // 注册一个方法
  //   return {
  //     reload: this.reload
  //   }
  // },

  // data() {
  //   return {
  //     isRouterAlive: true
  //   }
  // },

  // methods: {
  //   reload() {
  //     this.isRouterAlive = false
  //     this.$nextTick(function() {
  //       this.isRouterAlive = true
  //     })
  //   }
  // }

}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
