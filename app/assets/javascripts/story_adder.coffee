$ ->
  story_adder =
    $el: $('#adds-story')
    add_button: $('#adds-story__button')
    cancel_button: $('#adds-story .cancel')
    container_height: undefined

    isVisible: ->
      @$el.is(':visible')

    toggle: ->
      if ( @isVisible()  )
        @hide()
      else
        @show()

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

    updateHeight: ->
      @container_height = @$el.height()

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

  window.story_adder = story_adder
