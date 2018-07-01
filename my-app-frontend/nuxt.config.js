const pkg = require("./package");

module.exports = {
  mode: "universal",

  /*
  ** Headers of the page
  */
  head: {
    title: pkg.name,
    meta: [
      { charset: "utf-8" },
      { name: "viewport", content: "width=device-width, initial-scale=1" },
      { hid: "description", name: "description", content: pkg.description }
    ],
    link: [{ rel: "icon", type: "image/x-icon", href: "/favicon.ico" }]
  },

  /*
  ** Customize the progress-bar color
  */
  loading: { color: "#FFFFFF" },

  /*
  ** Global CSS
  */
  css: [],

  /*
  ** Plugins to load before mounting the App
  */
  plugins: ["~/plugins/axios"],

  /*
  ** Nuxt.js modules
  */
  modules: ["@nuxtjs/axios", "@nuxtjs/auth"],
  /*
  ** Axios module configuration
  */
  axios: {
    // See https://github.com/nuxt-community/axios-module#options
    host: "localhost",
    port: 4000,
    prefix: "/api/v1"
  },

  /*
  ** Build configuration
  */
  build: {
    /*
    ** You can extend webpack config here
    */
    extend(config, ctx) {
      // Run ESLint on save
      if (ctx.isDev && ctx.isClient) {
        config.module.rules.push({
          enforce: "pre",
          test: /\.(js|vue)$/,
          loader: "eslint-loader",
          exclude: /(node_modules)/
        });
      }
    }
  },

  env: {
    baseUrl: process.env.BASE_URL || "http://localhost:3000"
  },

  axios: {
    credentials: true,
    proxy: false,
    debug: true,
    host: "localhost",
    port: 4000,
    prefix: "/api/v1"
  },

  auth: {}
};
