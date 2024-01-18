<template>
  <div v-if="movie">
    <div class="movie__title">
      <h2 v-if="!editMode">{{ movie.title }}</h2>
      <input v-else v-model="editableTitle" type="text"/>
    </div>
    <div class="movie__description">
      <p v-if="!editMode">{{ movie.description }}</p>
      <textarea v-else v-model="editableDescription"></textarea>
    </div>
    <p>Actors: {{ movie.actors.join(', ') }}</p>
    <p>Average Rating: {{ movie.average_grade }}/5</p>
    
    <button v-if="!editMode" @click="enableEditMode()">Edit Details</button>
    <button v-if="editMode" @click="cancelEditMode()" class="cancel">Cancel</button>
    <button v-if="editMode" @click="saveChanges()" class="save">Save Changes</button>

    <h3>Add Review</h3>
    <form @submit.prevent="addReview">
      <label for="review-grade">Grade (1-5):</label>
      <select id="review-grade" v-model="newReviewGrade">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
      </select>
      <button type="submit">Submit Review</button>
    </form>
    <p v-if="successMessage">{{ successMessage }}</p>

  </div>
  <div v-else>
    Loading movie ...
  </div>
</template>

<script>
export default {
  data() {
    return {
      movie: null,
      newReviewGrade: 3,
      editMode: false,
      successMessage: '',
    };
  },
  mounted() {
    this.fetchDetailMovie();
  },
  methods: {
    enableEditMode() {
      this.editMode = true;
      this.editableTitle = this.movie.title;
      this.editableDescription = this.movie.description;
    },
    cancelEditMode() {
      this.editMode = false;
    },
    async fetchDetailMovie() {
      try {
        const response = await this.$axios.get(`http://localhost:8000/api/movies/${this.$route.params.id}/`);
        this.movie = response.data;
      } catch (error) {
        console.error('Error fetching movie details:', error);
      }
    },
    
    async saveChanges() {
      try {
        const response = await this.$axios.put(`http://localhost:8000/api/movies/${this.movie.id}/`, {
          title: this.editableTitle,
          description: this.editableDescription,
          actors:this.movie.actors,
        });
        this.movie = response.data;
        this.editMode = false;
      } catch (error) {
        console.error('Error saving movie details:', error);
      }
    },
    async addReview() {
      try {
        const response = await this.$axios.post(`http://localhost:8000/api/reviews/`, {
          movie: this.movie.id,
          grade: parseInt(this.newReviewGrade),
        });
        this.successMessage = 'Review added successfully!';
        this.fetchDetailMovie(); // Refetch the detail movie to update average_grade
      } catch (error) {
        console.error('Error adding review:', error);
        this.successMessage = 'Failed to add review.';
      }
      setTimeout(() => this.successMessage = '', 3000);
    },
    
  },
};
</script>
