<template>
  <section class="container">
    <h1>Please login to see the secret content</h1>
    
    <form @submit.prevent="onSubmit">
      <p>Username: <input type="text" v-model="email" name="username" /></p>
      <p>Password: <input type="password" v-model="password" name="password" /></p>
      <button type="submit">Login</button>
    </form>

    <nuxt-link to="/register">Register</nuxt-link>
  </section>
</template>

<script>
export default {
  data() {
    return {
      email: "",
      password: ""
    };
  },
  methods: {
    async onSubmit() {
      this.$axios
        .$post("/login", {
          email: this.email,
          password: this.password
        })
        .then(result => {
          console.log(result);
        })
        .catch(e => console.log(e));
    }
  }
};
</script>

<style>
.container {
  padding: 100px;
}
.error {
  color: red;
}
</style>