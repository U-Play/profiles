$ ->
  validations =
    rules:
      "team[name]":
        required: true
      "team[position]":
        minlength: 2

    options: ->
      rules: validations.rules
      showErrors: (errorMap, errorList) ->
        for elem in errorList
          $(elem.element).closest('.field').addClass("field--error")

    validation: (form, submitHandler) ->
      settings = validations.options()
      settings.submitHandler = submitHandler if submitHandler
      $(form).find('input').on 'keyup', (event) ->
        $(this).closest(".field").removeClass("field--error")
      $(form).validate settings

    init: (form, submitHandler) ->
      validations.validation(form, submitHandler)

  window.validations = validations.init


