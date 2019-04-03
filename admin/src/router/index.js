import Vue from 'vue'
import Router from  'vue-router'

import Home from '../components/Home'
import CumtCDIO from '../components/cumt/CumtCDIO'
import Show from '../components/show/Show'
import Slide from  '../components/slide/Slide'
import ShowEdit from  '../components/show/components/ShowEdit'

Vue.use(Router)

export default new Router ({
    routes :[
        {path: '/', component: Home},
        {path: '/home', component: Home},
        {path: '/cdio', component: CumtCDIO},
        {path: '/show/:id', component: Show},
        {path: '/show/:id/:index', component: ShowEdit},
        {path: '/slide', component: Slide},
    ],
})