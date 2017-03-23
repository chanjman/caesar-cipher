$ ->
  submitForm = (method, opMethod) ->
    $("##{opMethod}").val('')

    key = $('#shift :selected').text()
    cipher = $("##{method}").val()

    $.ajax "/#{method}",
      type: 'POST'
      data: { 'cipher': cipher, 'key': key }
      success: (data) ->
        $("##{opMethod}").val(data).effect('highlight', color: '#2ecc71')

  $('#encrypt-submit').click (event) ->
    event.preventDefault()
    method = $(this).attr('data-m')
    opMethod = $(this).attr('data-opm')
    submitForm(method, opMethod)

  $('#decrypt-submit').click (event) ->
    event.preventDefault()
    method = $(this).attr('data-m')
    opMethod = $(this).attr('data-opm')
    submitForm(method, opMethod)
