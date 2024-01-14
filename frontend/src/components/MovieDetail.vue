<template>
  <div>
    <h2>{{ movie.title }}</h2>
    <p>{{ movie.description }}</p>
    <p>Actors: {{ movie.actors.join(', ') }}</p>
    <p>Average Rating: {{ movie.average_grade }}</p>
    <button @click="editDetails">Edit Details</button>

    <h3>Add Review</h3>
    <form @submit.prevent="addReview">
      <textarea v-model="newReview" placeholder="Enter your review"></textarea>
      <button type="submit">Submit Review</button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      movie: {},
      newReview: "",
    };
  },
  mounted() {
    this.fetchDetailMovie();
  },
  methods: {
    async fetchDetailMovie() {
      try {
        const response = await this.$axios.get(`http://localhost:8000/api/movies/${this.$route.params.id}`);
        this.movie = response.data;
      } catch (error) {
        console.error('Error fetching movie details:', error);
      }
    },
    editDetails() {
      // Logic to edit movie details (description and actors)
    },
    addReview() {
      // Logic to add a review
    },
  },
};
</script>
