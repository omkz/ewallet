# Ewall

Ewall is Simple e-wallet application built with Ruby on Rails.

![Ewall Screenshot](https://raw.githubusercontent.com/omkz/e-wallet/master/public/screenshot.png)


### Setting up the development environment

1. Get the code. Clone this git repository:

  ```bash
  git clone git://github.com/omkz/e-wallet.git
  cd e-wallet
  ```

1. Install the required gems by running the following command in the project root directory:

  ```bash
  bundle install
  ```

1. Create and initialize the database:

  ```bash
  bundle exec rake db:migrate
  ```

1. Start the development server:

  ```bash
  rails s
  ```