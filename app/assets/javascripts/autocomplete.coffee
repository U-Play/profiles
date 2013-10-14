$ ->
  autocomplete =
    bindElements: ->
      @$el.autocomplete { source: @$tags }

    load_tags: (data_list)->
      @$tags = new Array()
      $(data_list+' option').each (index, option) =>
        @$tags.push option.value

    init: (input, data_list) ->
      @$el = $(input)
      @load_tags(data_list)
      @bindElements()

  window.autocomplete = autocomplete
