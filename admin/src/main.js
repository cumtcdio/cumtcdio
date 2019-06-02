import Vue from 'vue'
import App from './App.vue'
import router from './router'
import ElementUI from 'element-ui'
import store from './store'
import 'element-ui/lib/theme-chalk/index.css';
import './assets/css/bootstrap.css'
import axios from 'axios'
import {getRequest} from './utils/request'
import {deleteRequest} from './utils/request'
import {postRequest} from './utils/request'
import {uploadFileRequest} from './utils/request'
import {putRequest} from './utils/request'
import {initMenu} from "./utils/route";
import { getToken } from '../src/utils/auth'

Vue.config.productionTip = false
Vue.use(ElementUI)
Vue.prototype.axios = axios

Vue.prototype.getRequest = getRequest;
Vue.prototype.deleteRequest = deleteRequest;
Vue.prototype.postRequest = postRequest;
Vue.prototype.uploadFileRequest = uploadFileRequest;
Vue.prototype.putRequest = putRequest;

axios.interceptors.request.use(
    config => {
        if (getToken() !== '') {
            config.headers['jwtHeader'] = getToken() // 让每个请求携带自定义token 请根据实际情况自行修改
        }
        return config
    },
    err => {
      return Promise.reject(err);
    });

router.beforeEach((to, from, next)=> {
        if (to.name == 'Login') {
            next();
            return;
        }
        var name = store.state.user.username
        if (name == '未登录') {
            if (to.meta.requireAuth || to.name == null) {
                next({path: '/', query: {redirect: to.path}})
            } else {
                next();
            }
        } else {
            var user = store.state.user
            if (user == null) {
                next()
            } else {
                initMenu(router, store);
            }
            next();
        }
    }
)

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app')
