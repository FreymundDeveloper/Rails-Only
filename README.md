# Rails-Only

Repository used to build and test APIs based on Rails API-Only, with a test system in RSpec and using a Linux ambience configured and built through Docker.

Some tecnologies used:

* Ruby(3.2.x);
* Ruby on Rails(7.0.x);
* API Restful;
* MySQL;
* RSpec.
* Docker.

## Running the Linux Ambience

As mentioned previously, this entire application runs in a standalone Linux ambience designed in Docker. To build the project, first install and open Docker on your machine, then run the following command sequence in order:

```bash
# Build the Linux ambience for the project

# The dockerfile is configured to generate a container with the Linux ambience for Ruby on Rails, one...
# with a MySql database and one with a Redis server (This Last is mandatory for Rails to work).
$ docker-compose up --build

# Open your docker container's terminal and install Curl
$ apt-get install curl

# You need to perform the "bundle install" manually in the container terminal(in addition to the editor terminal)
$ docker-compose run web bundle install
# Open your container's Curl to access the local terminal
$ docker-compose exec web /bin/bash
# Run installation Command again on Curl
$ bundle install

# Build the project database
$ docker-compose exec web rails db:drop db:create db:migrate dev:setup
```

**Obs**: To use commands in the application, start them all with the excerpt below:

```bash
# Docker project command
$ docker-compose exec web rails <"command">
```

## Running the RSpec Tests

For the unit tests, it is necessary to create a database in the testing ambience, follow the commands below in order:

```bash
# Perform database migration
$ docker-compose exec web rails db:migrate RAILS_ENV=test

# Build the database structure
$ docker-compose exec web rails dev:setup RAILS_ENV=test

# Run the Tests
$ docker-compose exec web bundle exec rspec
```

## Miscellaneous

* In situations where the containers are no longer recognizing the Gems, it is necessary to rebuild the compose and run the following commands at the end: 

```bash
# End and rebuild the Docker ambience
$ docker-compose down -v docker-compose up --build

# Restart the database 
$ docker-compose exec web rails db:drop db:create db:migrate dev:setup
```

* The Docker ambience configuration is not so good, it is normal to find "REMAINS" of Images and Containers that are no longer used.