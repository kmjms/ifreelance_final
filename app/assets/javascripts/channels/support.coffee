value = $('#exchange_param').data('action-url')


App.support = App.cable.subscriptions.create {channel:"SupportChannel",id:value},
  connected: ->
    # Called when the subscription is ready for use on the server
    return
  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel Coffe
  
    recieveMessage(data)
   
    return

  speak: (message) ->
    alert $('#SENDER').attr 'value'
    @perform 'speak',body:message,sender:$('#SENDER').attr 'value'



