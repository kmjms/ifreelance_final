(function() {
  var value;

  value = $('#exchange_param').data('action-url');

  App.support = App.cable.subscriptions.create({
    channel: "SupportChannel",
    id: value
  }, {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      recieveMessage(data);
    },
    speak: function(message) {
      return this.perform('speak', {
        body: message,
        sender: $('#USER_TYPE').attr('value')
      });
    }
  });

}).call(this);
