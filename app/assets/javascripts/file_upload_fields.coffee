$("input[type=file]").each ->
  @proxy = $('<input type="text" value="'+$(this).val()+'" />')

  update_proxy = =>
    sanitized_value = $(this).val().replace 'C:\\fakepath\\', ''
    @proxy.val(sanitized_value)

  $(this).parent().append(@proxy)

  @proxy.on 'click',  =>
      $(this).trigger 'click'
      setInterval(update_proxy, 100)
