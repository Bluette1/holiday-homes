# holiday-homes

![Linters](https://github.com/Bluette1/holiday-homes/workflows/Linters/badge.svg)

![demopage](./public/screenshot.png)

## Built With
- Ruby
- Rails 

## Description
- This project is for building a simple RESTful backend API for the holiday-homes website [application](https://holiday-homes-website.herokuapp.com/).

- The Rails framework was used to build this project.

## Live Demo
[Live Demo](https://holiday-homes-api.herokuapp.com/)

### Run instructions 
-  You can clone the GitHub repo and type the following commands in the terminal to run the app locally 
    ```
    bundle install
    rake db:migrate
    rails server
    ```

### How to use the site
Make sure the server is running
- Go to http://localhost:3000/ in your web browser
- You will be able to access the following routes (among others)
  - http://localhost:3000/holiday-homes: where you can view the holiday-homes list.

- Follow the links on the [holiday-homes website](https://github.com/Bluette1/holiday-homes-website) to access the available features.

## Generate documentation
Run `bundle exec rdoc` in the terminal.

### [Paperclip Cloudinary](https://github.com/GoGoCarl/paperclip-cloudinary) Setup
- Create a [Cloudinary](https://cloudinary.com/) account.
- Afterwards

``Download your configuration YAML file and place it in your config directory. You can grab it here:

   https://cloudinary.com/console/cloudinary.yml

This will enable the Cloudinary gem to pick up your configuration automatically.```


## Deployment
- You can deploy on [Heroku](https://devcenter.heroku.com/categories/ruby-support).

## Authors

👤 **Marylene Sawyer**
- Github: [@Bluette1](https://github.com/Bluette1)
- Twitter: [@MaryleneSawyer](https://twitter.com/MaryleneSawyer)
- Linkedin: [Marylene Sawyer](https://www.linkedin.com/in/marylene-sawyer)

# Acknowledgements
- [Tutorial to build a RESTful JSON API with Rails](https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Bluette1/holiday-homes/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.

