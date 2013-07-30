# substitute input[file] with custom control


$("input[type=file]").each ->
  @proxy = $('<input type="text" value="'+$(this).val()+'" />')

  update_proxy = =>
    sanitized_value = $(this).val().replace 'C:\\fakepath\\', ''
    @proxy.val(sanitized_value)

  # hide file input and watch for changes
  $(this)
    .css("position", "absolute")
    .css("opacity", "0.000001")
    .attr("size", "100")
    .parent().append(@proxy)
    .click =>
        setInterval(update_proxy, 1000)
