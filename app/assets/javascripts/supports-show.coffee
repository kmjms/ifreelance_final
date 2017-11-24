# cambiar toda esta funcionalidad por clases Angular,  Coffee
                               
window.recieveMessage = (data) ->
  console.log data
  if $('#chat'+data.id).val()
    console.log('test')
  else
    if data.sender_type == true
      console.log('test2')
      $('<div class="mblm-item mblm-item-left"><div>' + data.body  + '</div><small>' + data.created_at + '</small></div><input hidden value="true" id="chat'+data.id+'" />').appendTo $('#panel-mensajes')
      bajarChat()
    else
      console.log('test3')
      $('<div class="mblm-item mblm-item-right"><div>' + data.body  + '</div><small>' + data.created_at + '</small></div><input hidden value="true" id="chat'+data.id+'" />').appendTo $('#panel-mensajes')
      $('.message-input textarea').val null
      bajarChat()
  return

window.sendMessage = ->
  message = $('.message-input textarea').val()
  if $.trim(message) == ''
    return false
  App.support.speak message , $('#SENDER').attr 'value'
  $('.message-input textarea').val null


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
