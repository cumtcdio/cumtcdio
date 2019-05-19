import Vue from 'vue'
import Vuex from 'vuex'
import router from '../router'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        showType: 0,
        user: {
            username: window.localStorage.getItem('jwtToken' || '[]') == null ? '未登录' : JSON.parse(window.localStorage.getItem('user' || '[]')).username,
            realName: window.localStorage.getItem('jwtToken' || '[]') == null ? '' : JSON.parse(window.localStorage.getItem('user' || '[]')).realName,
            groupSn: window.localStorage.getItem('jwtToken' || '[]') == null ? '' : JSON.parse(window.localStorage.getItem('user' || '[]')).groupSn,
            gradeSn: window.localStorage.getItem('jwtToken' || '[]') == null ? '' : JSON.parse(window.localStorage.getItem('user' || '[]')).gradeSn,
            roles: window.localStorage.getItem('jwtToken' || '[]') == null ? '' : JSON.parse(window.localStorage.getItem('user' || '[]')).roles,
            routes: window.localStorage.getItem('jwtToken' || '[]') == null ? '' : JSON.parse(window.localStorage.getItem('user' || '[]')).routes
        },
        routes: [],

    },
    mutations: {
        initMenu(state, menus){
            state.routes = menus;
        },
        initUserInfo(state, user) {
            state.user = user
            window.localStorage.setItem('user', JSON.stringify(user))
            router.push("/home")
        },
        logout(state) {
          state.routes = []
          state.user = {}
        },
        changeShowType(state,newShowType){
            state.showType = newShowType
        }
    }
})