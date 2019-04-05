import Vue from 'vue'
import Router from  'vue-router'

import Home from '../components/Home'
import CumtCDIO from '../components/cumt/CumtCDIO'
import Show from '../components/show/Show'
import Slide from  '../components/slide/Slide'
import ShowEdit from  '../components/show/components/ShowEdit'
import GroupInfo from '../components/cumt/views/groupInfo.vue';
import GroupInsert from '../components/cumt/views/groupInsert.vue';
import GroupUpdate from '../components/cumt/views/groupUpdate.vue';

Vue.use(Router)

export default new Router ({
    routes :[
        {path: '/', component: Home},
        {path: '/home', component: Home},
        {path: '/cdio', component: CumtCDIO},
        {path: '/cdio/group/:grade/:sn', component: GroupInfo},
        {path: '/cdio/group/insert', component: GroupInsert},
        {path: '/cdio/group/update', component: GroupUpdate},
        {path: '/show/:id', component: Show},
        {path: '/show/:id/:index', component: ShowEdit},
        {path: '/slide', component: Slide},
    ],
})