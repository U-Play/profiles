$('#adds-story-show').on 'click', (event) ->
  event.preventDefault()
  $(this).hide()
  $('#adds-story .sport-experience-form').slideDown()

$('#adds-story .cancel').on 'click', (event) ->
  event.preventDefault()
  $('#adds-story .sport-experience-form').slideUp()
  $('#adds-story-show').slideDown()
