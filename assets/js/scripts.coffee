$ ->
  submitForm = (method) ->
    key = $('#shift :selected').text()
    cipher = $('#encrypt').val()

    $.ajax "/#{method}",
      type: 'POST'
      data: { 'cipher': cipher, 'key': key }
      success: (data) ->
        $('#output').css('display', 'inline-block').text(data)
        $('html,body').animate({scrollTop: $('#output').offset().top}, 2000)

  $('#encrypt-submit').click (event) ->
    event.preventDefault()
    method = $(this).attr('data')
    submitForm(method)

  $('#decrypt-submit').click (event) ->
    event.preventDefault()
    method = $(this).attr('data')
    submitForm(method)
