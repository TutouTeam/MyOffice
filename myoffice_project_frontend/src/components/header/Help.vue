<!--内容-->
<template>
<div>

            <div>
                <el-header class="header">
                    帮助页面
                    <hr width="300px" color="#20a0ff">
                </el-header>
            </div>
    
    <div class="left">

    <ul>
        <li style="text-decoration:none;">
        
        <span slot="title" @click='About()'>关于我们</span>
        </li>

        <li>
        <span slot="title" @click='Questions()'>常见问题</span>
        </li>

        <li>
        <span slot="title" @click='Contact()'>联系我们</span>
        </li>

    </ul>
</div>

    <div class="right-about" v-if="show">
               
                <div class="textarea">
                   <h4> Welcome to Myoffice </h4>
                </div>
            </div>




            <div class="right-question" v-if="show1">
               
                <div class="textarea">
                     <h4> Common Questions </h4>
            
                </div>

            </div>
        



        <div class="right-contact" v-if="show2">
             
                <div class="textarea">
                     <h4> Contact Us </h4>
                </div>
        </div>



</div>
</template>

<!--逻辑-->
<script>
export default {

    data(){
        return{
            show:false,
            show1:false,
            show2:false,
        }

    },




     methods: {
      handleOpen(key, keyPath) {
        console.log(key, keyPath);
      },
      handleClose(key, keyPath) {
        console.log(key, keyPath);
      },
      About: function() {
          this.show = true;
          this.show1 = false;
          this.show2 = false;
          console.log("关于我们")
      },
      
      Questions: function(){
          this.show1 = true;
          this.show = false;
          this.show2 = false;
          console.log("常见问题")
      },


      Contact: function(){
          this.show2 = true;
          this.show = false;
          this.show1 = false;
        console.log("联系我们")
      }
    }
    
}
</script>

<!--样式-->
<style scoped>

 .header{
        font-size:20px;text-align: center;
    }

.left{
    width:20%;
    float:left;
    margin-left:100px;
    line-height:40px;
}

.ul,li{
    list-style: none;
}



.right-contact{
    float:right;
    margin-right:500px;

}

.right-question{
    float:right;
    margin-right:500px;

}

.right-about{
    float:right;
    margin-right:500px;

}

.textarea{
    float:right;


}


</style>