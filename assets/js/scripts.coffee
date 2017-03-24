$ ->
  submitForm = (method) ->
    key = $('#shift :selected').text()
    cipher = $('#encrypt').val()

    $.ajax "/#{method}",
      type: 'POST'
      data: { 'cipher': cipher, 'key': key }
      success: (data) ->
        $('#encrypt').val(data)

  $('#encrypt-submit').click (event) ->
    event.preventDefault()
    method = $(this).attr('data')
    submitForm(method)

  $('#decrypt-submit').click (event) ->
    event.preventDefault()
    method = $(this).attr('data')
    submitForm(method)
