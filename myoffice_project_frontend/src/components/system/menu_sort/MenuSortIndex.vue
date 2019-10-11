<!--内容-->
<template>
    <div>
        <h1>菜单排序主界面</h1>
        <div>
            <el-button type="primary" style="float:left;" size="mini"
                @click="upMenu()">
                上移<i class="el-icon-top"></i>
            </el-button>
            <el-button type="primary" style="margin-right:1120px;" size="mini"
                @click="doneMenu()">
                下移<i class="el-icon-bottom"></i>
            </el-button>
        </div>
        <div>
            <el-tree
              style="margin-top:20px;"
              :data="menus"
              node-key="nodeId"
              ref="tree"
              highlight-current
              :props="defaultProps"
              @node-click="handleNodeClick">
</el-tree>
        </div>
    </div>
</template>

<!--逻辑-->
<script>
export default {
    data(){
        return{
          menu:{
              nodeId:'',
          },
            menus:[],
            defaultProps: {
              children: 'children',
              label: 'displayName'
            }
        }
    },
    mounted: function(){
        this.getMenus();
    },
    methods:{
        getMenus(){
            this.postRequest("/config/sysmenu").then(resp=>{
                if(resp.data&&resp.status==200){
                    this.menus = resp.data;
                    // console.log(resp)
                }
            })
        },
        handleNodeClick(data){
            this.menu.nodeId = data.nodeId;
            //  console.log("resp",this.menu.nodeId);
        },
        upMenu(){
            var datas = {
                nodeId:this.menu.nodeId
            }
            this.postRequest("/menu/upMenu",datas).then(resp=>{
                if(resp.data && resp.status==200){
                     this.$message({type: 'success', message: "上移成功！"});
                     this.$router.go(0);
                }
            })
        },
        doneMenu(){
            var datas = {
                nodeId:this.menu.nodeId
            }
            this.postRequest("/menu/doneMenu",datas).then(resp=>{
                if(resp.data && resp.status==200){
                     this.$message({type: 'success', message: "下移成功！"});
                     this.$router.go(0);
                }
            })
        }
    }
}
</script>

<!--样式-->
<style scoped>

</style>