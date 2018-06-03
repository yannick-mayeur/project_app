# WOA Project: MenexaTech

This is the final project of my Web Oriented Applications course. It is a
platform where students will be able to share old exams, and discuss there
answers.

## Requirements

 * Same Rails and Ruby version as specified in the Gemfile
 * Poppler to preview images

## Getting started

To get get started with the MenexaTech app on your machine, clone the
Repository and install the needed gems:

```
$ bundle install --without production
```

Then migrate the database, and fill it with generated content:

```
$ rails db:migrate
$ rails db:seed
```

In order to be sure that the application works properly you will have to add
the triggers from file `db/triggers.sql` to your database. The database of the
development environement currently being sqlite3 this is not trivial, the
installation of postgres on a local machine being relatively hard. My advice
would be to deploy the application to for example Heroku and then add the
triggers.

Finally you can run the application on a local server:

```
$ rails server
```
