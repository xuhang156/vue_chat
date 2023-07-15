import VueRouter from 'vue-router';
import ChatGPT from "@/pages/ChatGPT";
import Dall from "@/pages/Dall";

const router = new VueRouter({
    mode: 'history',
    routes:[
        {
            name: 'chatgpt',
            path:'/chatgpt',
            component:ChatGPT,
        },
        {
            name: 'dall',
            path: '/dall',
            component: Dall,
        }
    ]
})
export default router