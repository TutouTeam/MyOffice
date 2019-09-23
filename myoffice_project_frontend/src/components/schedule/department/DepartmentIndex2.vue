<!--内容-->
<template>
    <!--外层容器-->
    <el-container>
        <!--顶栏容器-->
        <el-header>
            <!--标题-->
            <div>
                <el-header class="header">
                    部门日程主界面
                    <hr width="300px" color="#20a0ff">
                </el-header>
            </div>    
        </el-header>

        <!--主要区域容器-->
        <el-main>
            <!--模糊搜索部分-->
            <div>
                <!--在表单内设置模糊查询的操作选择框-->
                <el-form >
                    <!--利用<el-row>和<el-col>进行布局-->
                    <!--第一行-->
                    <el-row >

                        <el-col :span="8">
                            <div>
                                <el-form-item>
                                    <span>选择机构:</span>
                                    <el-select style="width: 70%">

                                    </el-select>
                                </el-form-item>
                            </div>
                        </el-col>

                        <el-col :span="8">
                            <div>
                                <el-form-item>
                                    <span>选择部门:</span>
                                    <el-select style="width: 70%">

                                    </el-select>
                                </el-form-item>
                            </div>
                        </el-col>

                        <el-col :span="8">
                            <div>
                                <el-form-item>
                                    <sapn>姓名:</sapn>
                                    <el-input prefix-icon="el-icon-edit" placeholder="请输入员工姓名" style="width: 50%"></el-input>
                                </el-form-item>
                            </div>
                        </el-col>

                    </el-row>

                    <!--第二行-->
                    <el-row style="margin-top: 20px;padding: 0px;">

                        <el-col :span="8">
                            <div>
                                <el-form-item>
                                    <sapn>日期:</sapn>
                                    <el-input prefix-icon="el-icon-date" placeholder="请输入日期" style="width: 50%"></el-input>
                                </el-form-item>
                            </div>
                        </el-col>

                        <el-col :span="8">
                            <div>
                                <el-button icon="el-icon-search" type="primary" style="width: 200px">搜索</el-button>
                            </div>
                        </el-col>

                    </el-row>

                </el-form>
            </div>

            <!--搜索结果部分-->
            <div>
                <span>日期：</span>
            </div>
        </el-main>
    </el-container>
</template>

<!--逻辑-->
<script>
export default {
    
}
</script>

<!--样式-->
<style scoped>
    .header{
        font-size:20px;text-align: center;
    }
</style>