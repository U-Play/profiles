$("input[type=file]").each ->
  @proxy_txt = $('<input type="text"   value="'+$(this).val()+'" />')
  @proxy_btn = $('<input type="button" class="button" value="Choose" />')

  update_proxy = =>
    sanitized_value = $(this).val().replace 'C:\\fakepath\\', ''
    @proxy_txt.val(sanitized_value)

  $(this).parent().append(@proxy_txt).append(@proxy_btn)

  @proxy_btn.on 'click',  =>
      $(this).trigger 'click'
      setInterval(update_proxy, 100)
