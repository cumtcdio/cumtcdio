import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home'
    },
    {
      path: '/cdio',
      beforeEnter(){
        window.location = '/cdio'
      }
    },
    {
        path: '/list',
        beforeEnter(){
            window.location = '/list'
        }
    },
    {
        path: '/details',
        beforeEnter(){
            window.location = '/details'
        }
    }
  ]
})
