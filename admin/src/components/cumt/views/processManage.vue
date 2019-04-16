<template>
    <div>
        <el-tabs type="border-card">
            <el-tab-pane label="C" class="p-3">
                <el-collapse>
                    <el-collapse-item v-for="(item, index) in group.c" :key="index" :title="item.courseName">
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
                                action="https://jsonplaceholder.typicode.com/posts/"
                                :multiple = "multiple"
                                :show-file-list = "showFile"
                                :on-success="uploadSuccess(scope.row.achievementId)">
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
                                <div>{{item.time}}</div>
                                <div><pre>{{item.require}}</pre></div>
                                <div>{{item.content}}</div>
                                <el-upload
                                class="my-2"
                                :action="uploadUrl"
                                :multiple = "multiple"
                                :on-success="processUploadSuccess()">
                                    <el-button type="primary" size="small">上传文件</el-button>
                                </el-upload>
                            </el-collapse-item>
                        </el-collapse>
                    </el-collapse-item>
                </el-collapse>
            </el-tab-pane>
            <el-tab-pane label="D" class="p-3">
                <el-collapse>
                    <el-collapse-item v-for="(item, index) in group.d" :key="index" :title="item.courseName">
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
                                action="https://jsonplaceholder.typicode.com/posts/"
                                :multiple = "multiple"
                                :show-file-list = "showFile"
                                :on-success="uploadSuccess(scope.row.achievementId)">
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
                                <div>{{item.time}}</div>
                                <div><pre>{{item.require}}</pre></div>
                                <div>{{item.content}}</div>
                                <el-upload
                                class="my-2"
                                :action="uploadUrl"
                                :multiple = "multiple"
                                :on-success="processUploadSuccess()">
                                    <el-button type="primary" size="small">上传文件</el-button>
                                </el-upload>
                            </el-collapse-item>
                        </el-collapse>
                    </el-collapse-item>
                </el-collapse>
            </el-tab-pane>
            <el-tab-pane label="I" class="p-3">
                <el-collapse>
                    <el-collapse-item v-for="(item, index) in group.i" :key="index" :title="item.courseName">
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
                                :on-success="uploadSuccess(scope.row.achievementId)">
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
                                <div>{{item.time}}</div>
                                <div><pre>{{item.require}}</pre></div>
                                <div>{{item.content}}</div>
                                <el-upload
                                class="my-2"
                                :action="uploadUrl"
                                :multiple = "multiple"
                                :on-success="processUploadSuccess()">
                                    <el-button type="primary" size="small">上传文件</el-button>
                                </el-upload>
                            </el-collapse-item>
                        </el-collapse>
                    </el-collapse-item>
                </el-collapse>
            </el-tab-pane>
            <el-tab-pane label="O" class="p-3">
                <el-collapse>
                    <el-collapse-item v-for="(item, index) in group.o" :key="index" :title="item.courseName">
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
                                action="https://jsonplaceholder.typicode.com/posts/"
                                :multiple = "multiple"
                                :show-file-list = "showFile"
                                :on-success="uploadSuccess(scope.row.achievementId)">
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
                                <div>{{item.time}}</div>
                                <div><pre>{{item.require}}</pre></div>
                                <div>{{item.content}}</div>
                                <el-upload
                                class="my-2"
                                :action="uploadUrl"
                                :multiple = "multiple"
                                :on-success="processUploadSuccess()">
                                    <el-button type="primary" size="small">上传文件</el-button>
                                </el-upload>
                            </el-collapse-item>
                        </el-collapse>

                    </el-collapse-item>
                </el-collapse>
            </el-tab-pane>
        </el-tabs>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                uploadUrl: "",
                showFile: false,
                multiple: false,
                group: {
                    title:'第一组',
                    name: '校园移动微创客联盟',
                    teacher: '冯文龙',
                    member: 'XXX、XXX、XXX、XXX、XXX',
                    teamImg: 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1967724590,2451003767&fm=11&gp=0.jpg',
                    desc: '这里是项目概要这里是项目概要这里是项目概要这里是项目概要这里是项目概要项目概要项目概要项目概要',
                    c:[
                    {
                        courseId: 1,
                        courseName: '互联网商业模式设计',
                        achievement:[
                        {
                            achievementId: 1,
                            name: '商业计划书',
                            address: '',
                            score: 51
                        },
                        {
                            name: '商业计划书2',
                            address: '#'
                        }
                        ],
                        processManage: [
                        {
                            title: '完成商业计划书',
                            require: `这里是任务的要求
                            1.要求一
                            2.要求二`,
                            content: '这里是任务的内容',
                            time:'2019/4/10'
                        }
                        ]
                    },
                    {
                        courseId: 1,
                        courseName: '互联网商业模式设计2',
                        achievement:[
                        {
                            name: '商业计划书3',
                            address: '#'
                        },
                        {
                            name: '商业计划书4',
                            address: '#'
                        }
                        ],
                        processManage: [
                        {
                            title: '完成商业计划书完成商业计划书完成完成商业计划书完成商业计划书完成商业计划书',
                            require: `这里是任务的要求
                            1.要求一
                            2.要求二`,
                            content: '这里是任务的内容',
                            time:'2019/4/10'
                        }
                        ]
                    }
                    ],
                    d:[
                    {
                        courseId: 1,
                        courseName: 'web前端',
                        achievement:[
                        {
                            name: '商业计划书',
                            address: '#'
                        }
                        ],
                        processManage: [
                        {
                            title: '完成商业计划书',
                            require: `这里是任务的要求
                            1.要求一
                            2.要求二`,
                            content: '这里是任务的内容',
                            time:'2019/4/10'
                        }
                        ]
                    }
                    ],
                    i:[
                    {
                        courseId: 1,
                        courseName: '互联网商业模式设计',
                        achievement:[
                        {
                            name: '商业计划书',
                            address: '#'
                        }
                        ],
                        processManage: [
                        {
                            title: '完成商业计划书',
                            require: `这里是任务的要求
                            1.要求一
                            2.要求二`,
                            content: '这里是任务的内容',
                            time:'2019/4/10'
                        }
                        ]
                    }
                    ],
                    o:[
                    {
                        courseId: 1,
                        courseName: '互联网商业模式设计',
                        achievement:[
                        {
                            name: '商业计划书',
                            address: '#'
                        }
                        ],
                        processManage: [
                        {
                            title: '完成商业计划书',
                            require: `这里是任务的要求
                            1.要求一
                            2.要求二`,
                            content: '这里是任务的内容',
                            time:'2019/4/9'
                        }
                        ]
                    }
                    ]
                }
            }
        },
        methods: {
            uploadSuccess() {
                
            },
            processUploadSuccess(){
                
            },
            handlePreview(address){
                // console.log(address)
            },
        },
    }
</script>

<style scoped>

</style>