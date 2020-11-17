import Vue from 'vue'
import Router from 'vue-router'
import index from '@/pages/index.vue'
import Book from '@/pages/Book.vue'
import Text from '@/pages/Text.vue'
import love from '@/pages/love.vue'
import Personal from '@/components/Personal'
import Login from '@/components/Login'
import Register from '@/components/Register'



Vue.use(Router)

export default new Router({
    routes: [{
            path: '/',
            name: 'Login',
            component: Login
        },
        {
            path: '/index',
            name: 'index',
            component: index
        },
        {
            path: '/Text',
            name: 'Text',
            component: Text
        },
        {
            path: '/Book',
            name: 'Book',
            component: Book
        },
        {
            path: '/love',
            name: 'love',
            component: love
        },
        {
            path: '/register',
            name: 'Register',
            component: Register
        },

    ]
})