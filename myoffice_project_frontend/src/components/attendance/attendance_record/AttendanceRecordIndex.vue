<template>
    <div>
        <el-container>
            <el-header>
                <h1>员工考勤历史查询</h1>
                <hr>
            </el-header>
            <el-main>
                <el-form :model="searchByTime">
                    <fieldset>
                        <el-row>
                            <el-form-item label="输入时间段:" :label-width="formLabelWidth">
                                <el-col :span="12">
                                    <el-input v-model="searchByTime.startTime" autocomplete="off"></el-input>
                                    <span>---</span>
                                    <el-input v-model="searchByTime.endTime" autocomplete="off"></el-input>
                                    <el-radio-group v-model="searchByTime.select">
                                        <el-radio :label="1">本日</el-radio>
                                        <el-radio :label="2">本周</el-radio>
                                        <el-radio :label="3">本月</el-radio>
                                    </el-radio-group>
                                </el-col>
                            </el-form-item>
                        </el-row>
                    </fieldset>
                </el-form>
             
                <el-form :model="range">
                    <fieldset>
                        <el-row>
                            <el-col :span="6">
                                <el-form-item label="输入时间段" :label-width="formLabelWidth">
                                    <el-radio-group v-model="range.type">
                                        <el-checkbox label="按机构" name="type"></el-checkbox>
                                        <el-checkbox label="按部门" name="type"></el-checkbox>
                                        <el-checkbox label="按员工号" name="type"></el-checkbox>
                                        <el-checkbox label="按姓名" name="type"></el-checkbox>
                                    </el-radio-group>
                                </el-form-item>
                            </el-col>
                        </el-row>
                    </fieldset>
                </el-form>
                <!--选择机构 部门 员工号 名字-->
                <el-form :model="chooseRange" v-show="showchooseRange">
                    <fieldset>
                        <el-row>
                            <el-col :span="6">
                                <el-form-item label="机构" :label-width="formLabelWidth">
                                    <el-select v-model="chooseRange.Agency" placeholder="===请选择===">
                                        <el-option label="Agency1" value="Agency1"></el-option>
                                        <el-option label="Agency2" value="Agency2"></el-option>
                                    </el-select>
                                </el-form-item>
                                <el-form-item label="部门：" :label-width="formLabelWidth">
                                    <el-select v-model="chooseRange.Depart" placeholder="===请选择===">
                                        <el-option label="Depart1" value="Depart1"></el-option>
                                        <el-option label="Depart2" value="Depart2"></el-option>
                                    </el-select>
                                </el-form-item>
                                <el-form-item label="员工号" :label-width="formLabelWidth">
                                    <el-input v-model="chooseRange.id"></el-input>
                                </el-form-item>
                                <el-form-item label="姓名" :label-width="formLabelWidth">
                                    <el-input v-model="chooseRange.name"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>
                    </fieldset>
                </el-form>
                <el-row>
                    <el-col :span="4">
                        <el-button type="primary" :disabled="searchButton" @click="search()">搜索</el-button>
                    </el-col>
                </el-row>
            </el-main>
        </el-container>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                searchByTime: {
                    startTime: '',
                    endTime: '',
                    select: '',
                },
                range: {
                    type: ''
                },
                chooseRange: {
                    Agency: '',
                    Depart: '',
                    id: '',
                    name: ''
                }
            }
        },
        methods: {
            search: function() {
                this.searchButton = true
                this.showchooseRange = true
            }
        }
    }
</script>

<style>
    h1 {
        margin: 20px auto;
    }
</style>