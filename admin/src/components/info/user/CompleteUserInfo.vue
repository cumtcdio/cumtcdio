<template>
    <div>
        <div class="complete-info" v-if="!completed">
            <h3 style="text-align: center">完善个人信息</h3>
            <el-form ref="userParams" :model="userParams" :rules="rules" label-width="80px">
                <el-form-item label="手机号" prop="phone">
                    <el-input v-model="userParams.phone"></el-input>
                </el-form-item>
                <el-form-item label="QQ号" prop="qqNumber">
                    <el-input v-model="userParams.qqNumber" ref="qqNumber"></el-input>
                </el-form-item>
                <el-form-item label="微信号" prop="wxNumber">
                    <el-input v-model="userParams.wxNumber" ref="wxNumber"></el-input>
                </el-form-item>
                <el-form-item label="地址" prop="familyAddress">
                    <el-input v-model="userParams.familyAddress"></el-input>
                </el-form-item>
                <el-form-item label="邮箱" prop="email">
                    <el-input v-model="userParams.email"></el-input>
                </el-form-item>
                <el-form-item >
                    <el-button type="primary" @click="submitForm('userParams')">提 交</el-button>
                    <el-button type="info" @click="completed=true" v-if="!completed">取 消</el-button>
                </el-form-item>
            </el-form>
        </div>
        <el-dialog
                title="提示"
                :visible.sync="loading"
                :show-close="false"
                :close-on-press-escape="false"
                :close-on-click-modal="false"
                width="30%">
            <span>清稍候......</span>
        </el-dialog>
        <el-dialog
                title="确认提交？"
                :visible.sync="loading"
                :show-close="false"
                :close-on-press-escape="false"
                :close-on-click-modal="false"
                width="30%">
            <span>清稍候......</span>
        </el-dialog>
        <div class="user-info" v-if="completed">
            <h3 style="text-align: center">个人信息</h3>
            <div>
                <label for="phone" class="label-userparams">手机号：</label>
                <label id="phone">{{userParams.phone}}</label>
            </div>
            <div>
                <label for="qqNumber" class="label-userparams">QQ号：</label>
                <label id="qqNumber">{{userParams.qqNumber}}</label>
            </div>
            <div>
                <label for="wxNumber" class="label-userparams">微信号：</label>
                <label id="wxNumber">{{userParams.wxNumber}}</label>
            </div>
            <div>
                <label for="familyAddress" class="label-userparams">地址：</label>
                <label id="familyAddress">{{userParams.familyAddress}}</label>
            </div>
            <div>
                <label for="email" class="label-userparams">邮箱：</label>
                <label id="email">{{userParams.email}}</label>
            </div>
            <div>
                <el-button type="primary" @click="completed=false">修改</el-button>
                <el-button type="success" @click="passDialogVisible=true">修改密码</el-button>
            </div>
        </div>
        <div>
            <el-dialog title="修改密码"
                       :visible.sync="passDialogVisible"
                       :show-close="false"
                       width="50%">
                <el-form :model="passFrom" :rules="passRules" ref="passForm">
                    <el-form-item label="密码" prop="pass">
                        <el-input type="password" v-model="passFrom.pass"></el-input>
                    </el-form-item>
                    <el-form-item label="确认密码" prop="passConfirm">
                        <el-input type="password" v-model="passFrom.passConfirm"></el-input>
                    </el-form-item>
                </el-form>
                <span slot="footer" class="dialog-footer">
                    <el-button @click="passDialogVisible = false">取 消</el-button>
                    <el-button type="primary" @click="rePassword('passForm')">提 交</el-button>
                </span>
            </el-dialog>
        </div>
    </div>
</template>
<script>
    import {removeToken} from '../../../utils/auth'
    export default {
        data() {
            var validateNumber = (rule, value, callback) => {
                var number1 = this.$refs.qqNumber.value
                var number2 = this.$refs.wxNumber.value
                if (number1.trim() == '' && number2.trim() == ''){
                    return callback(new Error('QQ号与微信号至少填一个'));
                }else {
                    callback();
                }
            };
            var checkPhone = (rule, value, callback) => {
                if (!value) {
                    return callback(new Error('手机号不能为空'));
                } else {
                    const reg = /^1[3|4|5|7|8][0-9]\d{8}$/
                    if (reg.test(value)) {
                        callback();
                    } else {
                        return callback(new Error('请输入正确的手机号'));
                    }
                }
            };
            var checkEmail = (rule, value, callback) => {
                const mailReg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/
                if (!value) {
                    return callback(new Error('邮箱不能为空'))
                }
                setTimeout(() => {
                    if (mailReg.test(value)) {
                        callback()
                    } else {
                        callback(new Error('请输入正确的邮箱格式'))
                    }
                }, 100)
            };
            var validatePassConfirm = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请再次输入密码'))
                } else if (value !== this.passFrom.pass) {
                    callback(new Error('两次输入密码不一致!'))
                } else {
                    callback()
                }
            };
            return{
                loading: false,
                passDialogVisible: false,
                completed: false,
                rules: {
                    phone: [
                        { validator: checkPhone, trigger: 'blur' }
                    ],
                    qqNumber: [
                        { validator: validateNumber, trigger: 'blur' },
                    ],
                    wxNumber: [
                        { validator: validateNumber, trigger: 'blur' },
                    ],
                    familyAddress: [
                        { required: true, message: '请输入地址', trigger: 'blur' },
                    ],
                    email: [
                        { validator: checkEmail, trigger: 'blur' },
                    ],
                },
                passRules: {
                    pass: [
                        {required: true, message: '请输入密码', trigger: 'blur'},
                        {min: 6,max: 16,message:'密码在6-16位'}
                    ],
                    passConfirm: [
                        {required: true,validator: validatePassConfirm,trigger: 'blur'}
                    ]
                },
                userParams: {
                    phone: '',
                    qqNumber: '',
                    wxNumber: '',
                    familyAddress: '',
                    email: '',
                    username: ''
                },
                passFrom: {
                    pass: '',
                    passConfirm: ''
                }
            }
        },
        methods: {
            submitForm: function(formName) {
                this.userParams.username = this.$store.state.user.username
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        this.loading = true
                        this.postRequest('/api/user/completeUserInfo',this.userParams).then(resp => {
                            var data = resp.data
                            if (data > 0){
                                this.loading = false
                                this.isNotFirstCompleted()
                            }
                        })
                    } else {
                        return false;
                    }
                });
            },
            rePassword: function(formName) {
              var username = this.$store.state.user.username
              this.$refs[formName].validate((valid) => {
                  if (valid){
                      this.postRequest('/api/user/updatePassword/'+username+'/'+this.passFrom.pass).then(resp => {
                          var data = resp.data
                          if (data > 0){
                              this.passDialogVisible = false
                              this.$store.commit('logout')
                              removeToken()
                              this.$router.push('/')
                          }
                      })
                  }
              })
            },
            isNotFirstCompleted: function () {
                var username = this.$store.state.user.username
                this.getRequest('api/user/isNotFirstCompleted/' + username).then(resp => {
                    var number = resp.data
                    if (number > 0) {
                        this.completed = true
                        this.getUserParamsByUsername(username)
                    } else {
                        this.completed = false
                    }
                })
            },
            getUserParamsByUsername: function (username) {
                this.getRequest('/api/user/getUserParams/' + username).then(resp => {
                    var data = resp.data
                    if (data != null) {
                        this.userParams = data
                    }
                })
            }
        },
        mounted() {
            this.isNotFirstCompleted()
        }
    }
</script>
<style scoped>
.complete-info{
    margin: 0px 100px;
}
.user-info{
    margin: 0px 100px;
}
.label-userparams{
    font-weight: bold;
    margin: 5px;
}
</style>