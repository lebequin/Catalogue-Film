import { createRouter, createWebHistory } from 'vue-router'
import MovieList from "@/components/MovieList.vue";
import MovieDetail from "@/components/MovieDetail.vue";


const routes = [
  { path: '/', component: MovieList, name: 'movie-list' },
  { path: '/movie/:movieId', component: MovieDetail, name: 'movie-detail', props: true },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;