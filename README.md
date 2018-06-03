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

Finally you can run the application on a local server:

```
$ rails server
```
