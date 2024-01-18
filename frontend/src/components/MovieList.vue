<template>
  <div>
    <h1>Movie List</h1>
    <div class="row">
      <div v-for="movie in movies" :key="movie.id" class="col-md-4 mb-4">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">{{ movie.title }}</h5>
            <p class="card-text">{{ movie.description }}</p>
            <router-link :to="{ name: 'MovieDetail', params: { id: movie.id }}">View Details</router-link>
          </div>
        </div>
      </div>
    </div>
    <nav aria-label="Page navigation">
      <ul class="pagination">
        <li class="page-item">
          <a class="page-link" :disabled="currentPage <= 1" href="#" aria-label="Previous" @click="fetchMovies(currentPage - 1)">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">{{ this.currentPage }}</a>
        </li>
        <li>
          <a class="page-link" href="#" aria-label="Next" :disabled="!nextPage" @click="fetchMovies(currentPage + 1)">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
    </nav>
  </div>
</template>

<script>
export default {
  data() {
    return {
      movies: [],
      currentPage: 1,
      nextPage: null,
    };
  },
  mounted() {
    this.fetchMovies(this.currentPage);
  },
  methods: {
    async fetchMovies(page) {
      try {
        const response = await this.$axios.get(`http://localhost:8000/api/movies/?page=${page}`);
        this.movies = response.data.results;
        this.currentPage = page;
        this.nextPage = response.data.next;
      } catch (error) {
        console.error('Error fetching movies:', error);
      }
    },
  },
};
</script>

<style scoped>
.row {
  width: 1400px;
  margin: auto;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

.card {
  box-shadow: 0px 0px 8px #ddd;
  padding: 10px;
  margin: 10px;
  width: 200px;
}

.pagination {
  list-style-type: none;
  display: flex;
  justify-content: center;
}

.pagination a {
  margin: 5px 10px;
  color: #333;
  text-decoration: none;
}

</style>
