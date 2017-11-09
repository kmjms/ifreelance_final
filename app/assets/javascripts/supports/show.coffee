scrollAnimation = ->
  $('.messages').animate { scrollTop: $(document).height() }, 'fast'
  return

window.recieveMessage = (data) ->
  if data.sender_type == 1
    $('<li class="sent"><img src="http://emilcarlsson.se/assets/mikeross.png" alt="" /><p>' + data.body + '</p></li>').appendTo $('.messages ul')
    $('.contact.active .preview').html '<span>You: </span>' + message
  else
    $('<li class="replies"><img src="http://emilcarlsson.se/assets/mikeross.png" alt="" /><p>' + data.body + '</p></li>').appendTo $('.messages ul')
  
  $('.message-input input').val null
  $('.messages').animate { scrollTop: $(document).height() }, 'fast'
  return

window.sendMessage = ->
  message = $('.message-input input').val()
  if $.trim(message) == ''
    return false
  App.support.speak message , 1
  $('.message-input input').val null
  scrollAnimation()


$('.messages').animate { scrollTop: $(document).height() }, 'fast'

$('#profile-img').click ->
  $('#status-options').toggleClass 'active'
  return

$('.expand-button').click ->
  $('#profile').toggleClass 'expanded'
  $('#contacts').toggleClass 'expanded'
  return

$('#status-options ul li').click ->
  $('#profile-img').removeClass()
  $('#status-online').removeClass 'active'
  $('#status-away').removeClass 'active'
  $('#status-busy').removeClass 'active'
  $('#status-offline').removeClass 'active'
  $(this).addClass 'active'
  if $('#status-online').hasClass('active')
    $('#profile-img').addClass 'online'
  else if $('#status-away').hasClass('active')
    $('#profile-img').addClass 'away'
  else if $('#status-busy').hasClass('active')
    $('#profile-img').addClass 'busy'
  else if $('#status-offline').hasClass('active')
    $('#profile-img').addClass 'offline'
  else
    $('#profile-img').removeClass()
  $('#status-options').removeClass 'active'
  return
$('.submit').click ->
  sendMessage()
  return
$(window).on 'keydown', (e) ->
  if e.which == 13
    sendMessage()
    return false
  return

# Funcionalidad adicional de la pagina de chat