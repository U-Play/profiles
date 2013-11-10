$ ->
  team_adder =
    $el: $('#adds-team')
    form: $('#new_team')
    tournaments_form: $('#nested-form-tournaments')
    add_button: $('#adds-team__button')
    cancel_button: $('#adds-team .cancel')
    container_height: undefined

    isVisible: ->
      @$el.is(':visible')

    updateHeight: ->
      @container_height = @$el.height()

    show: ->
      @$el.stop().show().animate
        height : @container_height
      ,
        duration: 250
        complete: =>
          @$el.css('height', '')

    hide: ->
      @updateHeight()
      @$el.stop().animate
        height: "0"
      ,
        duration: 250,
        complete: =>
          @$el.hide()

    toggle: ->
      if ( @isVisible()  )
        @hide()
      else
        @show()

    bindElements: ->
      @add_button.click (event) =>
        event.preventDefault()
        @toggle()
      @cancel_button.click (event) =>
        event.preventDefault()
        @toggle()

    setInitialHeight: ->
      clone = @$el.clone().css('display', 'block').css('position', 'absolute').css('left', '-999999px')
      @$el.after(clone)
      @container_height = clone.height()
      clone.remove()

    setInitialState: ->
      if @$el.attr('data-hide') == "true"
        @$el.hide().css('height', "0")

    init: ->
      @setInitialHeight()
      @setInitialState()
      @bindElements()
      window.new_team_validation @form

  window.team_adder = team_adder
