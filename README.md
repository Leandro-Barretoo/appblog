## Blog App

Simple blog website that let's users create posts, like post and comment on them.

## Built With

- Ruby
- PostgreSQL

## Frameworks

- Ruby on Rails

## Getting Started

# Prerequisites

- Ruby
- Rails

# Setup

- Make sure you have all the prerequisites installed properly in your computer
- Clone the directory using `git clone git@github.com:Leandro-Barretoo/blogapp.git`
- Navigate to project directory with `cd blogapp`
- Run `bundle install`

# Database setup

- Create a user:
```sh
sudo -u postgres createuser <user> -s
```

- Create the database:
```sh
rake db:create
```


# To run the program

```sh
rails s
```

# Tests

- To run the tests run:
```sh
rspec spec
```

## Author


👤 **Leandro**

- GitHub: [Leandro-Barretoo](https://github.com/Leandro-Barretoo)
- LinkedIn: [Leandro Barreto](https://linkedin.com/in/leandroobarreto/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse

## License

[MIT](./LICENSE)
