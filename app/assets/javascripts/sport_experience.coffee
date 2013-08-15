adds_story = (event) ->
  event.preventDefault()
  $('#adds-story').slideToggle()

$('#adds-story__button').on 'click', adds_story
$('#adds-story .cancel').on 'click', adds_story
