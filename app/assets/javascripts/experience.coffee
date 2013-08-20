toggle_adds_story = (event) ->
  event.preventDefault()
  $('#adds-story').slideToggle()

$('#adds-story__button').on 'click', toggle_adds_story
$('#adds-story .cancel').on 'click', toggle_adds_story

$('#nested-form-tournaments').on 'nested:fieldAdded', ->
  $(document).foundation()
