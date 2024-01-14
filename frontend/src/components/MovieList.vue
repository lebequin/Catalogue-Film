<template>
  <div>
    <h1>Movie List</h1>
    <div class="row">
      <div v-for="movie in movies.results" :key="movie.id" class="col-md-4 mb-4">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">{{ movie.title }}</h5>
            <p class="card-text">{{ movie.description }}</p>
            <button class="btn btn-primary" @click="movieDetails(movie.id)">View detail</button>
          </div>
        </div>
      </div>
    </div>
    <nav aria-label="Page navigation">
      <ul class="pagination">
        <li class="page-item">
          <a v-if="this.previous_page" class="page-link" href="#" aria-label="Previous" @click="changePage(movies.previous_page)">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">{{ this.page }}</a>
        </li>
        <li v-if="this.next_page" class="page-item" :class="{ disabled: page === movies.total_pages }">
          <a class="page-link" href="#" aria-label="Next" @click="changePage(movies.next_page)">
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
      movies: {
        results: [],
        previous_page: null,
        next_page: null,
      },
      page: 1,
    };
  },
  mounted() {
    this.fetchMovies();
  },
  beforeRouteUpdate(to, from, next) {
    // Update movies when the route changes
    this.page = parseInt(to.params.page) || 1;
    this.fetchMovies();
    next();
  },
  methods: {
    async fetchMovies(url) {
      try {
        if(!url){
          url = `http://localhost:8000/api/movies/`
        } else {
          console.log(url)
        }

        const response = await this.$axios.get(url);
        this.movies.results = response.data.results;
        this.previous_page = response.data.previous;
        this.next_page = response.data.next;
        console.log(this.next_page)

      } catch (error) {
        console.error('Error fetching movies:', error);
      }
    },
    changePage(newPage) {
      this.page = newPage;
      this.fetchMovies(newPage);
    },
    movieDetails(movieId) {
      this.$router.push({
        path: "/movies/" + movieId
      });
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
