# Event management

[View site](https://event-management-webapp.herokuapp.com/)



## Install

### Clone the repository
``` 
git clone https://github.com/AdetunjiTejumade/Event-management-app.git 
cd boulder-bike-tour
```
## Check your Ruby version
`ruby -v`
The output should start with something like `2.7.2`

If not, install the right ruby version using rbenv (it could take a while):

`rbenv install 2.7.2`

## Install dependecies:
``` 
bundle install
yarn install
```

## Initialize the database
`rails db:create db:migrate db:seed`

## Initialize the test db
  `bundle exec rails db:create RAILS_ENV=test`
  `bundle exec rails db:schema:load RAILS_ENV=test`
  
## Run tests
`bundle exec rspec`

## Serve
`rails s`
And now you can visit the site with the URL http://localhost:3000
