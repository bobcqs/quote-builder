# Ready Coding Exercise - Quote Builder

## I. Description

This application allows Sales People to build quotes of office supplies.

## II. Start up guide

### Prerequisites

- RVM
- Ruby 2.7.1p83
- Rails 6.1.0+ 

### Installation

1. Clone the project: 

   `git clone https://github.com/bobcqs/quote-builde.git`

2. Enter the project folder: 

   `cd quote_builder`

3. Install project dependencies: 

   - Install RVM with ruby and rails: https://rvm.io/rvm/install
   - Install specific ruby version: https://rvm.io/rubies/installing

4. Check current dependencies version

   `rvm -v`
   `ruby -v`
   `rails -v`


### Running instruction

1. Install all dependencies in the Gemfile are available to the Ruby project:
    `bundle install`

2. Creates the database for the current RAILS_ENV environment, runs migrations for the current environment that have not run yet:

    `rake db:create db:migrate`

3. Start Rails server:

    `rails s`

    If need start server in specifc port
    `rails s -p [port-number] -b [ip-address]`
    
4. Stop the server:
    `ctrl + c`

### Run tests

1. Run all tests of the project(RSpec):
    `rspec spec`

2. Run specific tests of the project(RSpec):
    `rspec [spec-file-path]`

## III. Notes

### Update
1. Add the product for Blue-Ray disk
2. Add testing for quote_decorator, quote_product_decorator, quote
3. Refractor the method for quote calculaton
4. Setup the Cypress Test

### Good about the previous code
1. Clear file structure and formatting which is easy to access
2. Testing file structure and name matches with the app files
3. Each function only solves one business problem, whicch make the application be easy to expand the function and maintain in the future
4. The naming of functions is simple and easy to understand
5. Consistent coding style

### Bad about the previous code
1. Algorthim can be update can be further optimised if it contains more product type
2. Using the hardcode to return the price value instead of getting variable data
3. When the product amount is 1, it still shows the pluralize format
4. Logic error for calculating the import duty
5. Does not keep only two decimal to display the price
