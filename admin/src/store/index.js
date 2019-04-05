import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        showType: 0
    },
    mutations: {
        changeShowType(state,newShowType){
            state.showType = newShowType
        }
    }
})