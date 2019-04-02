import Vue from 'vue'
import Router from  'vue-router'

import Home from '../components/Home'
import CumtCDIO from '../components/cumt/CumtCDIO'
import Show from '../components/show/Show'
import Slide from  '../components/slide/Slide'

Vue.use(Router)

export default new Router ({
    routes :[
        {path: '/', component: Home},
        {path: '/home', component: Home},
        {path: '/cdio', component: CumtCDIO},
        {path: '/show', component: Show},
        {path: '/slide', component: Slide},
    ],
})