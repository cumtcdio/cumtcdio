<template>
    <el-form :model="loginForm" :rules="rules" ref="loginForm" class="login-container" label-position="left"
             label-width="0px" v-loading="loading">
        <h3 class="login_title">电子商务与数据科学系</h3>
        <el-form-item prop="username">
            <el-input type="text" v-model="loginForm.username"
                      auto-complete="off" placeholder="用户名"></el-input>
        </el-form-item>
        <el-form-item prop="password">
            <el-input type="password" v-model="loginForm.password"
                      auto-complete="off" placeholder="密码"></el-input>
        </el-form-item>
        <!--<el-checkbox class="login_remember" v-model="checked"-->
                     <!--label-position="left">记住密码</el-checkbox>-->
        <el-form-item style="width: 100%">
            <el-button type="primary" style="width: 100%" @click="submitClick('loginForm')">登录</el-button>
        </el-form-item>
    </el-form>
</template>
<script>
    import axios from  'axios'
    import {setToken} from '../utils/auth'
    export default{
        data(){
            return {
                rules: {
                    username: [{required: true, message: '请输入用户名', trigger: 'blur'}],
                    password: [{required: true, message: '请输入密码', trigger: 'blur'}]
                },
                checked: true,
                loginForm: {
                    username: '',
                    password: ''
                },
                loading: false
            }
        },
        methods: {
            submitClick: function (formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        var _this = this;
                        this.loading = true;
                        axios.post('/auth/login', {username: this.loginForm.username,
                            password: this.loginForm.password}).then(res => {
                            _this.loading = false;
                            if (res && res.status == 200) {
                                var data = res.data
                                if(data.data == '用户名或密码错误'){
                                    this.$message.error(data.data);
                                }else {
                                    setToken(data.data)
                                    this.getUserInfo()
                                }
                            }
                        });
                    } else {
                        return false;
                    }
                });
             },
            getUserInfo: function () {
                this.getRequest('/api/user/getUserInfoByUsername/' + this.loginForm.username).then(res => {
                    var data = res.data
                    if (data) {
                        this.$store.commit('initUserInfo', data)
                    }
                })
            }
        }
    }
</script>
<style>
    .login-container {
        border-radius: 15px;
        background-clip: padding-box;
        margin: 180px auto;
        width: 400px;
        padding: 35px 35px 15px 35px;
        background: #fff;
        border: 1px solid #eaeaea;
        box-shadow: 0 0 25px #cac6c6;
    }
    .login_title {
        margin: 0px auto 40px auto;
        text-align: center;
        color: #505458;
    }
    .login_remember {
        margin: 0px 0px 35px 0px;
        text-align: left;
    }
</style>