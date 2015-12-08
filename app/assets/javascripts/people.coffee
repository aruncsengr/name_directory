# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
  Person::init()


class Person
  searchInputFieldId: "#typeahead"

  init: ->
    @initAutocomplete()

  initAutocomplete: ->
    _self = @
    $.get('people.json', (response) ->
      $(_self.searchInputFieldId).typeahead({ source: response.data })
    ,'json');
