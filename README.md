# Jungle

200 mins

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. It simulated the real world where I inherit an existing code base in a language / framework that was new to me.

## Final Product

!["Screenshot of the home page"](https://github.com/timothy-chan2/jungle-rails/blob/master/docs/home-page.png?raw=true)

!["Screenshot of the home page with sold out"](https://github.com/timothy-chan2/jungle-rails/blob/master/docs/sold-out.png?raw=true)

!["Screenshot of the product details page"](https://github.com/timothy-chan2/jungle-rails/blob/master/docs/products-bed.png?raw=true)

!["Screenshot of the category page"](https://github.com/timothy-chan2/jungle-rails/blob/master/docs/categories-apparel.png?raw=true)

!["Screenshot of the register page"](https://github.com/timothy-chan2/jungle-rails/blob/master/docs/register.png?raw=true)

!["Screenshot of the cart page"](https://github.com/timothy-chan2/jungle-rails/blob/master/docs/cart.png?raw=true)

!["Screenshot of the Stripe popup"](https://github.com/timothy-chan2/jungle-rails/blob/master/docs/orders-stripe.png?raw=true)

!["Screenshot of the order details page"](https://github.com/timothy-chan2/jungle-rails/blob/master/docs/orders-summary.png?raw=true)

!["Screenshot of the admin categories page"](https://github.com/timothy-chan2/jungle-rails/blob/master/docs/categories-admin.png?raw=true)

## Bugs / Features

I fixed the following bugs:

- **Inconsistent money formatting** (My Cart,& Product details page)
  
- **Page shows the Stripe checkout button even when the cart is empty** (My Cart page)

I added the following new features:

- **Sold out badge on the Home page when quantity of product is 0**

- **Order details page after payment is successfully completed**

- **Admin dashboard page detailing the number of products and categories from scratch**

- **About page from scratch**

- **Admin categories page from scratch**

- **Created user authentication pages from scratch** (Login & Register page)

## Getting Started

### Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

### Setup

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

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Font Awesome
* Bootstrap
* bcrypt

## Development Testing

- RSpec
- Capybara