# Register right and left button handlers
if $('#next_link').length and $('#previous_link').length
  $('body').keydown (e) ->
    if e.keyCode == 37
      $('#previous_link')[0].click()
    else if e.keyCode == 39
      $('#next_link')[0].click()

# Disable upload button on click
if $('#upload_image_form').length
  $('#upload_image_form').submit () ->
    $('#upload_button').attr('disabled', 'disabled')
