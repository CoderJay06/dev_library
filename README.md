# Dev Library

A content management system library application for Software Development books. Aimed mainly towards Software Development students, Computer Science students, professional developers and instructors. A user of this app can find the technical books they need for their school, profession or just to learn. User's can signup for an account and download their books straight from the application.

## Table of contents
* [Clone](#clone)
* [Setup](#setup)
* [Technologies](#technologies)
* [Status](#status)
* [Logo](#logo)
* [License](#license)

## Clone
Clone this repo to your local machine using either one of the following:<br>
SSH `git@github.com:CoderJay06/dev_library.git`<br>
HTTPS `https://github.com/CoderJay06/dev_library.git`<br>

## Setup
To run this project clone it down, navigate to the ./dev_library directory and run the following commands:<br>

Install gems:<br>
`$ bundle install`

Initialize the database and optionally seed data:<br>
```
$ rake db:migrate
$ rake db:seed
```
Run the server:<br>
`$ rails s`

For Bootstrap on the front end:<br>
`$ yarn add bootstrap jquery popper.js`

## Technologies
Project is created with:
* [Ruby 2.6.1](https://www.ruby-lang.org/en/)
* [Rails 6.0.3](https://rubyonrails.org/)
* [ActiveRecord](https://rubygems.org/gems/activerecord/versions/5.0.0.1)
* [Bootstrap 4.5](https://getbootstrap.com/)
* [Sass](https://sass-lang.com/)

## Status
This project is still being developed. Added features and functioinality will include:<br>
subscription plans, book images, book wish lists, stripe billing and more!

## Logo
![Algorithm schema](./app/assets/images/logo.png)

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2020 © <a href="https://github.com/CoderJay06" target="_blank">CoderJay06</a>.
	
