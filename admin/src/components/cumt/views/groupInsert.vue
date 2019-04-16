<template>
    <div class="m-3">
        <i class="el-icon-arrow-left" style="font-size:22px;cursor:pointer" @click="$router.back(-1)"></i>
        <div class="container mt-3">
            <el-form ref="form" :model="formItem" label-width="80px" :rules="rules">
                <el-form-item label="年级" prop="gradeSn">
                    <el-select v-model="formItem.gradeSn" placeholder="请选择年级">
                        <el-option label="2016" value="2016"></el-option>
                        <el-option label="2017" value="2017"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="组别" prop="groupSn">
                    <el-input v-model="formItem.groupSn" placeholder="请输入组别，如：1，2，3" style="width:200px"></el-input>
                </el-form-item>
                <el-form-item label="项目名称" prop="name">
                    <el-input v-model="formItem.name" placeholder="请输入项目名称" style="width:300px"></el-input>
                </el-form-item>
                <el-form-item label="指导老师" prop="teacher">
                    <el-input v-model="formItem.teacher" placeholder="请输入指导老师" style="width:300px"></el-input>
                </el-form-item>
                <el-form-item label="成员">
                    <div style="margin:0 10px 10px 10px;padding:0" v-for="(item, index) in formItem.member" :key="index">
                        <el-input v-model="item.sn" placeholder="学号..." class="mx-3" style="width:200px"></el-input>
                        <el-input v-model="item.name" placeholder="姓名..." class="mx-3" style="width:200px"></el-input>
                        <el-input v-model="item.telephone" placeholder="手机号..." class="mx-3" style="width:200px"></el-input>
                        <i class="el-icon-delete" style="font-size:22px;cursor:pointer" @click="deleteMember(index)"></i>
                    </div>
                    <i class="el-icon-plus" style="font-size:22px;cursor:pointer" @click="addMember"></i>
                </el-form-item>
                <el-form-item label="小组图片" prop="imgUrl">
                    <el-upload
                    action="https://jsonplaceholder.typicode.com/posts/"
                    :multiple = "multiple"
                    :on-success="uploadSuccess"
                    list-type="picture">
                    <el-button size="small" type="primary">点击上传</el-button>
                    <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
                    </el-upload>
                </el-form-item>
                <el-form-item label="项目概要" prop="desc">
                    <el-input type="textarea" v-model="formItem.desc" placeholder="最多不超过50个字"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="submitForm('form')">完成</el-button>
                    <el-button @click="$router.back(-1)">取消</el-button>
                </el-form-item>
            </el-form>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                multiple: false,
                formItem: {
                    gradeSn: "",
                    groupSn: "",
                    name: "",
                    teacher: "",
                    imgUrl: "",
                    desc: "",
                    member:[
                        {
                            sn: "",
                            name: "",
                            telephone: ""
                        }
                    ]
                },
                rules:{
                    gradeSn:[{ required: true, message: '请选择年级', trigger: 'blur' },],
                    groupSn:[{ required: true, message: '请输入组别', trigger: 'blur' },
                        {type: 'number', message: '组别必须为数字值'}],
                    name:[{ required: true, message: '请输入项目名称', trigger: 'blur' },],
                    teacher:[{ required: true, message: '请输入指导老师', trigger: 'blur' },],
                    imgUrl:[{ required: true, message: '请上传图片', trigger: 'blur' },],
                    desc:[{ required: true, message: '请输入项目概要', trigger: 'blur' },
                        { min: 1, max: 50, message: '长度在 1 到 50 个字符', trigger: 'blur' }
                    ],
                }
            }
        },
        methods: {
            addMember(){
                this.formItem.member.push({
                            sn: "",
                            name: "",
                            telephone: ""
                        })
            },
            deleteMember(index) {
                this.formItem.member.splice(index,1)
            },
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                if (valid) {
                    alert('submit!');
                } else {
                    return false;
                }
                });
            },
            // uploadSuccess(response){
                
            // }
        },
    }
</script>

<style scoped>

</style>