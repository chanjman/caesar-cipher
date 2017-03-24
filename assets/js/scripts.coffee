$ ->
  submitForm = (method) ->
    key = $('#shift :selected').text()
    cipher = $('#encrypt').val()

    $.ajax "/#{method}",
      type: 'POST'
      data: { 'cipher': cipher, 'key': key }
      success: (data) ->
        $('#output').fadeIn()

        $('#output p').text(data)

        if method == 'encrypt'
          $('#output i').replaceWith("<i class='fa fa-lock output__icon'></i>")
        else
          $('#output i').replaceWith("<i class='fa fa-unlock output__icon'></i>")

        $('html,body').animate({scrollTop: $('#output').offset().top}, 1000)

  $('#encrypt-submit').click (event) ->
    event.preventDefault()
    method = $(this).attr('data')
    submitForm(method)

  $('#decrypt-submit').click (event) ->
    event.preventDefault()
    method = $(this).attr('data')
    submitForm(method)
