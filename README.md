# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

**For documentation**

docker-compose up --build

docker-compose exec web rails <"command">

In the container, install apt-get install curl

You need to perform the "bundle install" manually in the container terminal(in addition to the editor terminal), use: "docker-compose exec web /bin/bash"

In situations where the containers are no longer recognizing the Gems, it is necessary to rebuild the compose and run the following command at the end: 
docker-compose exec web rails db:drop db:create db:migrate dev:setup
