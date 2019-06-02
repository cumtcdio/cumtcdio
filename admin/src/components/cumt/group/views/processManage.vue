<template>
    <div>
        <el-tabs type="border-card">
            <el-tab-pane label="C" class="p-3">
                <el-collapse>
                    <el-collapse-item v-for="(item, index) in group.ccourseVOS" :key="index" :title="item.courseName">
                        <el-table
                            :data="item.achievement"
                            border>
                            <el-table-column
                            prop="name"
                            label="成果">
                            </el-table-column>
                            <el-table-column
                            label="状态">
                            <template slot-scope="scope">
                                <div v-if="scope.row.address">已上传</div>
                                <div v-if="!scope.row.address">未上传</div>
                            </template>
                            </el-table-column>
                            <el-table-column
                            label="得分">
                            <template slot-scope="scope">
                                <div v-if="scope.row.score">{{scope.row.score}}</div>
                                <div v-if="!scope.row.score">未打分</div>
                            </template>
                            </el-table-column>
                            <el-table-column
                            label="截止时间">
                            <template slot-scope="scope">
                                <div>{{scope.row.deadLine | dateFormat('yyyy-MM-dd hh:mm:ss')}}</div>
                            </template>
                            </el-table-column>
                            <el-table-column
                            label="操作">
                            <template slot-scope="scope">
                                <el-upload
                                :action="uploadUrl"
                                :multiple = "multiple"
                                :show-file-list = "showFile"
                                :on-success="(response)=>uploadSuccess(scope.row.addressId,response)">
                                    <el-button slot="trigger" type="primary" size="small">上传</el-button>
                                    <el-button class="ml-2" @click="handlePreview(scope.row.address)" type="primary" size="small">查看</el-button>
                                </el-upload>
                            </template>
                            </el-table-column>
                        </el-table>
                        <!-- 项目过程管理 -->
                        <el-tag class="mt-4 mb-3" style="margin-left:200px;margin-right:200px">项目过程管理</el-tag>
                        <el-collapse style="margin-left:200px;margin-right:200px">
                            <el-collapse-item v-for="(item, index) in item.processManage" :key="index" :title="item.title" name="1">
                                <div>发布时间：{{item.time | dateFormat('yyyy-MM-dd hh:mm:ss')}}</div>
                                <div>截止时间：{{item.deadLine | dateFormat('yyyy-MM-dd hh:mm:ss')}}</div>
                                <div><pre>{{item.require}}</pre></div>
                                <div>{{item.content}}</div>
                                <el-upload
                                class="my-2"
                                :action="uploadUrl"
                                :multiple = "multiple"
                                :on-success="(response)=>processUploadSuccess(item.addressId,response)">
                                    <el-button type="primary" size="small">上传文件</el-button>
                                </el-upload>
                                <el-button @click="handlePreview(item.address)" type="primary" size="small">文件预览</el-button>
                                <div>得分：{{item.score}}</div>
                            </el-collapse-item>
                        </el-collapse>
                    </el-collapse-item>
                </el-collapse>
            </el-tab-pane>
            <el-tab-pane label="D" class="p-3">
                <el-collapse>
                    <el-collapse-item v-for="(item, index) in group.dcourseVOS" :key="index" :title="item.courseName">
                        <el-table
                            :data="item.achievement"
                            border>
                            <el-table-column
                            prop="name"
                            label="成果">
                            </el-table-column>
                            <el-table-column
                            label="状态">
                            <template slot-scope="scope">
                                <div v-if="scope.row.address">已上传</div>
                                <div v-if="!scope.row.address">未上传</div>
                            </template>
                            </el-table-column>
                            <el-table-column
                            prop="score"
                            label="得分">
                            </el-table-column>
                            <el-table-column
                            label="操作">
                            <template slot-scope="scope">
                                <el-upload
                                :action="uploadUrl"
                                :multiple = "multiple"
                                :show-file-list = "showFile"
                                :on-success="(response)=>uploadSuccess(scope.row.addressId,response)">
                                    <el-button slot="trigger" type="primary" size="small">上传</el-button>
                                    <el-button class="ml-2" @click="handlePreview(scope.row.address)" type="primary" size="small">查看</el-button>
                                </el-upload>
                            </template>
                            </el-table-column>
                        </el-table>
                        <!-- 项目过程管理 -->
                        <el-tag class="mt-4 mb-3" style="margin-left:200px;margin-right:200px">项目过程管理</el-tag>
                        <el-collapse style="margin-left:200px;margin-right:200px">
                            <el-collapse-item v-for="(item, index) in item.processManage" :key="index" :title="item.title" name="1">
                                <div>发布时间：{{item.time | dateFormat('yyyy-MM-dd hh:mm:ss')}}</div>
                                <div>截止时间：{{item.deadLine | dateFormat('yyyy-MM-dd hh:mm:ss')}}</div>
                                <div><pre>{{item.require}}</pre></div>
                                <div>{{item.content}}</div>
                                <el-upload
                                class="my-2"
                                :action="uploadUrl"
                                :multiple = "multiple"
                                :on-success="(response)=>processUploadSuccess(item.addressId,response)">
                                    <el-button type="primary" size="small">上传文件</el-button>
                                </el-upload>
                                <el-button @click="handlePreview(item.address)" type="primary" size="small">文件预览</el-button>
                                <div>得分：{{item.score}}</div>
                            </el-collapse-item>
                        </el-collapse>
                    </el-collapse-item>
                </el-collapse>
            </el-tab-pane>
            <el-tab-pane label="I" class="p-3">
                <el-collapse>
                    <el-collapse-item v-for="(item, index) in group.icourseVOS" :key="index" :title="item.courseName">
                        <el-table
                            :data="item.achievement"
                            border>
                            <el-table-column
                            prop="name"
                            label="成果">
                            </el-table-column>
                            <el-table-column
                            label="状态">
                            <template slot-scope="scope">
                                <div v-if="scope.row.address">已上传</div>
                                <div v-if="!scope.row.address">未上传</div>
                            </template>
                            </el-table-column>
                            <el-table-column
                            prop="score"
                            label="得分">
                            </el-table-column>
                            <el-table-column
                            label="操作">
                            <template slot-scope="scope">
                                <el-upload
                                :action="uploadUrl"
                                :multiple = "multiple"
                                :show-file-list = "showFile"
                                :on-success="(response)=>uploadSuccess(scope.row.addressId,response)">
                                    <el-button slot="trigger" type="primary" size="small">上传</el-button>
                                    <el-button class="ml-2" @click="handlePreview(scope.row.address)" type="primary" size="small">查看</el-button>
                                </el-upload>
                            </template>
                            </el-table-column>
                        </el-table>
                        <!-- 项目过程管理 -->
                        <el-tag class="mt-4 mb-3" style="margin-left:200px;margin-right:200px">项目过程管理</el-tag>
                        <el-collapse style="margin-left:200px;margin-right:200px">
                            <el-collapse-item v-for="(item, index) in item.processManage" :key="index" :title="item.title" name="1">
                                <div>发布时间：{{item.time | dateFormat('yyyy-MM-dd hh:mm:ss')}}</div>
                                <div>截止时间：{{item.deadLine | dateFormat('yyyy-MM-dd hh:mm:ss')}}</div>
                                <div><pre>{{item.require}}</pre></div>
                                <div>{{item.content}}</div>
                                <el-upload
                                class="my-2"
                                :action="uploadUrl"
                                :multiple = "multiple"
                                :on-success="(response)=>processUploadSuccess(item.addressId,response)">
                                    <el-button type="primary" size="small">上传文件</el-button>
                                </el-upload>
                                <el-button @click="handlePreview(item.address)" type="primary" size="small">文件预览</el-button>
                                <div>得分：{{item.score}}</div>
                            </el-collapse-item>
                        </el-collapse>
                    </el-collapse-item>
                </el-collapse>
            </el-tab-pane>
            <el-tab-pane label="O" class="p-3">
                <el-collapse>
                    <el-collapse-item v-for="(item, index) in group.ocourseVOS" :key="index" :title="item.courseName">
                        <el-table
                            :data="item.achievement"
                            border>
                            <el-table-column
                            prop="name"
                            label="成果">
                            </el-table-column>
                            <el-table-column
                            label="状态">
                            <template slot-scope="scope">
                                <div v-if="scope.row.address">已上传</div>
                                <div v-if="!scope.row.address">未上传</div>
                            </template>
                            </el-table-column>
                            <el-table-column
                            prop="score"
                            label="得分">
                            </el-table-column>
                            <el-table-column
                            label="操作">
                            <template slot-scope="scope">
                                <el-upload
                                :action="uploadUrl"
                                :multiple = "multiple"
                                :show-file-list = "showFile"
                                :on-success="(response)=>uploadSuccess(scope.row.addressId,response)">
                                    <el-button slot="trigger" type="primary" size="small">上传</el-button>
                                    <el-button class="ml-2" @click="handlePreview(scope.row.address)" type="primary" size="small">查看</el-button>
                                </el-upload>
                            </template>
                            </el-table-column>
                        </el-table>
                        <!-- 项目过程管理 -->
                        <el-tag class="mt-4 mb-3" style="margin-left:200px;margin-right:200px">项目过程管理</el-tag>
                        <el-collapse style="margin-left:200px;margin-right:200px">
                            <el-collapse-item v-for="(item, index) in item.processManage" :key="index" :title="item.title" name="1">
                                <div>发布时间：{{item.time | dateFormat('yyyy-MM-dd hh:mm:ss')}}</div>
                                <div>截止时间：{{item.deadLine | dateFormat('yyyy-MM-dd hh:mm:ss')}}</div>
                                <div><pre>{{item.require}}</pre></div>
                                <div>{{item.content}}</div>
                                <el-upload
                                class="my-2"
                                :action="uploadUrl"
                                :multiple = "multiple"
                                :on-success="(response)=>processUploadSuccess(item.addressId,response)">
                                    <el-button type="primary" size="small">上传文件</el-button>
                                </el-upload>
                                <el-button @click="handlePreview(item.address)" type="primary" size="small">文件预览</el-button>
                                <div>得分：{{item.score}}</div>
                            </el-collapse-item>
                        </el-collapse>

                    </el-collapse-item>
                </el-collapse>
            </el-tab-pane>
        </el-tabs>
        <el-dialog
            title="项目过程管理"
            :visible.sync="dialogVisible"
            top="2vh"
            width="60%"
            style="height:1000px">
            <iframe :src='officeUrl'
             width='100%' height='600px' frameborder='1'>
            </iframe>
        </el-dialog>
        <a :href="zipUrl" id="zip" style="display:none">zip</a>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                officeUrl:"",
                dialogVisible: false,
                uploadUrl: "/api/upload",
                showFile: false,
                multiple: false,
                group: {

                },
                zipUrl:"#",
            }
        },
        mounted(){
            this.axios.get("/api/group/getDetail?gradeSn="+this.$store.state.user.gradeSn+"&groupSn="+this.$store.state.user.groupSn)
                .then(res =>{
                    this.group = res.data.data
                })
        },
        methods: {
            uploadSuccess(addressId,res) {
                this.axios.put("/api/group/achievement/upload?addressId="+addressId+"&address="+res)
                    .then(res =>{
                        if(res.status == 200){
                            if(res.data.data == 0){
                                this.$message.error('截止时间已过');
                            }else{
                                this.axios.get("/api/group/getDetail?gradeSn="+this.$store.state.user.gradeSn+"&groupSn="+this.$store.state.user.groupSn)
                                    .then(res =>{
                                        this.group = res.data.data
                                    })
                                this.$message({
                                    message: '上传成功',
                                    type: 'success'
                                });
                            }
                        }else{
                            this.$message({
                                message: '发生未知错误',
                                type: 'error'
                            });
                        }
                    }).catch(()=>{
                        this.$message({
                            message: '发生未知错误',
                            type: 'error'
                        });
                    })
            },
            processUploadSuccess(addressId,res){
                this.axios.put("/api/group/task/upload?addressId="+addressId+"&address="+res)
                    .then(res =>{
                        if(res.status == 200){
                            if(res.data.data == 0){
                                this.$message.error('截止时间已过');
                            }else{
                                this.axios.get("/api/group/getDetail?gradeSn="+this.$store.state.user.gradeSn+"&groupSn="+this.$store.state.user.groupSn)
                                    .then(res =>{
                                        this.group = res.data.data
                                    })
                                this.$message({
                                    message: '上传成功',
                                    type: 'success'
                                });
                            }
                        }
                    }).catch(()=>{
                        this.$message({
                            message: '发生未知错误',
                            type: 'error'
                        });
                    })
            },
            handlePreview(address){
                if(address.indexOf(".zip") > -1){
                    this.zipUrl = address
                    setTimeout(() => {
                        document.querySelector('#zip').click()
                    }, 0.5);

                }else{
                    this.officeUrl = "https://view.officeapps.live.com/op/view.aspx?src="+address
                    this.dialogVisible = true   
                }
            },
        },
        filters: {
            dateFormat: function(value,fmt) {
                let getDate = new Date(value);
                let o = {
                    'M+': getDate.getMonth() + 1,
                    'd+': getDate.getDate(),
                    'h+': getDate.getHours(),
                    'm+': getDate.getMinutes(),
                    's+': getDate.getSeconds(),
                    'q+': Math.floor((getDate.getMonth() + 3) / 3),
                    'S': getDate.getMilliseconds()
                };
                if (/(y+)/.test(fmt)) {
                    fmt = fmt.replace(RegExp.$1, (getDate.getFullYear() + '').substr(4 - RegExp.$1.length))
                }
                for (let k in o) {
                    if (new RegExp('(' + k + ')').test(fmt)) {
                    fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (('00' + o[k]).substr(('' + o[k]).length)))
                    }
                }
                return fmt;
            }
        }
    }
</script>

<style scoped>

</style>