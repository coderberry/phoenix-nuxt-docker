<template>
  <section class="container">
    <form @submit.prevent="onSubmit">
      <p>Username: <input type="text" v-model="email" name="username" /></p>
      <p>Password: <input type="password" v-model="password" name="password" /></p>
      <p>Password Confirmation: <input type="password" v-model="password_confirmation" name="password_confirmation" /></p>
      <button type="submit">Sign Up</button>
    </form>
  </section>
</template>

<script>
export default {
  data() {
    return {
      email: "",
      password: "",
      password_confirmation: ""
    };
  },
  methods: {
    async onSubmit() {
      this.$axios
        .$post("/signup", {
          user: {
            email: this.email,
            password: this.password,
            password_confirmation: this.password_confirmation
          }
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