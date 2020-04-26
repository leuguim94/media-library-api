# README

* Ruby version: ruby 2.6.6p146 (2020-03-31 revision 67876)

* Rails version: Rails 6.0.2.2

* Database creation
  - Create the DB with ```rake db:prepare``` (execute ```rake db:drop``` if there's an existing DB).
  - ```db/seeds.rb``` includes example data, so in order to load the DB ```rake db:seed``` needs to be executed.

* How to run the test suite
  - Tests are managed with RSpec, execute them with: ```rspec```
  - SimpleCov gem is added, visit ```coverage/index.html``` after executing ```rspec``` to check test coverage.

## Screenshots
  - Endpoint returning movies (ordered by creation).
  
![GET http://localhost:3000/movies](https://i.ibb.co/89FncTG/JSON-REST-API-1.png)

  - Endpoint returning seasons (ordered by creation), including episodes ordered by its number.
  
![GET http://localhost:3000/seasons](https://i.ibb.co/wBs8sVK/JSON-REST-API-2.png)
  
  - Endpoint returning both movies and seasons (ordered by creation).
  
![GET http://localhost:3000/catalogue](https://i.ibb.co/fvmHx2t/JSON-REST-API-3.png)
  
  - Enpoint performing a content purchase by an user.
  
![POST http://localhost:3000/purchases](https://i.ibb.co/xMMsfwc/JSON-REST-API-4.png)
  
  - Enpoint to get the library of a user ordered by content expire time.
  
![GET http://localhost:3000/users/1/library](https://i.ibb.co/rZJvFcj/JSON-REST-API-5.png)
  
  - Test coverage
  
![Test Coverage](https://i.ibb.co/YQ4D2PM/JSON-REST-API-6.png)

