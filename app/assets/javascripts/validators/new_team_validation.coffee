$ ->
  validations =
    rules:
      "team[name]":
        required: true
      "team[sport]":
        required: true
      "team[tournaments_attributes][0][award_year]":
        required: ->
          return false

    dynamic_fields_rules: ->
      #$("#team_tournaments_attributes_0_award_year").rules "add",
          #required: true
          #required: (element) ->
            #return $(element).find('option:selected').val() == ''
            #console.log element
            #if $(element).val() != ''
              #return false
            #else
              #return true
      $("input[id^='team_tournaments'][id$='name']").each ->
          $(this).rules "add",
            required: true

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
      validations.dynamic_fields_rules()

    init: (form, submitHandler) ->
      validations.validation(form, submitHandler)

  window.new_team_validation = validations.init


