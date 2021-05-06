# Jungle


A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. Users can view products for sale, add them to their cart and view items in their cart and complete their purchase. Users can choose to register and login and have the items in their cart saved for them. Admin users require authentication and can edit the products page and create new product categories as needed. 

The purpose of this project was to simulate an on the job Web Developer environment. I inherited this incomplete WebApp and fixed formatting issues, implemented new features and implemented user and admin authentication. To further improve this WebApp, I implemented testing with Rspec, Capybara and Poltergeist.


!["Screenshot of Homepage"](https://github.com/a-tuyen/jungle-rails/blob/master/docs/Jungle%20-%20Products.png?raw=true)
!["Screenshot of Product Detail Page"](https://github.com/a-tuyen/jungle-rails/blob/master/docs/Jungle%20-%20ProdDesc.png?raw=true)
!["Screenshot of Admin Authentication"](https://github.com/a-tuyen/jungle-rails/blob/master/docs/Jungle%20-%20AdminAuth.png?raw=true)

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe


## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>


