# README

This is a practice app that searches Magic: The Gathering cards.  It includes the use of fancy autocomplete thanks to typeahead.js (http://twitter.github.io/typeahead.js/)

* Database initialization
  * Download AllSets.json from http://mtgjson.com/
  * Run `rake card_data:import[/somedir/AllSets.json]`

* How to run the test suite
  * The test suite requires the real card data to be inserted into the test database (e.g. `RAILS_ENV=test rake card_data:import[/somedir/AllSets.json]`)
  * `bundle exec rspec`

