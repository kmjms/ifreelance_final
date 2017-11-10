(function() {
  var scrollAnimation;

  scrollAnimation = function() {
    $('.messages').animate({
      scrollTop: $(document).height()
    }, 'fast');
  };

  window.recieveMessage = function(data) {
    console.log(data);
    if (data.sender_type === true) {
      $('<li class="sent"><img src="http://emilcarlsson.se/assets/mikeross.png" alt="" /><p>' + data.body + '</p></li>').appendTo($('.messages ul'));
      $('.contact.active .preview').html('<span>You: </span>' + message);
    } else {
      $('<li class="replies"><img src="http://emilcarlsson.se/assets/mikeross.png" alt="" /><p>' + data.body + '</p></li>').appendTo($('.messages ul'));
    }
    $('.message-input input').val(null);
    $('.messages').animate({
      scrollTop: $(document).height()
    }, 'fast');
  };

  window.sendMessage = function() {
    var message;
    message = $('.message-input input').val();
    if ($.trim(message) === '') {
      return false;
    }
    App.support.speak(message, 1);
    $('.message-input input').val(null);
    return scrollAnimation();
  };

  $('.messages').animate({
    scrollTop: $(document).height()
  }, 'fast');

  $('#profile-img').click(function() {
    $('#status-options').toggleClass('active');
  });

  $('.expand-button').click(function() {
    $('#profile').toggleClass('expanded');
    $('#contacts').toggleClass('expanded');
  });

  $('#status-options ul li').click(function() {
    $('#profile-img').removeClass();
    $('#status-online').removeClass('active');
    $('#status-away').removeClass('active');
    $('#status-busy').removeClass('active');
    $('#status-offline').removeClass('active');
    $(this).addClass('active');
    if ($('#status-online').hasClass('active')) {
      $('#profile-img').addClass('online');
    } else if ($('#status-away').hasClass('active')) {
      $('#profile-img').addClass('away');
    } else if ($('#status-busy').hasClass('active')) {
      $('#profile-img').addClass('busy');
    } else if ($('#status-offline').hasClass('active')) {
      $('#profile-img').addClass('offline');
    } else {
      $('#profile-img').removeClass();
    }
    $('#status-options').removeClass('active');
  });

  $('.submit').click(function() {
    sendMessage();
  });

  $(window).on('keydown', function(e) {
    if (e.which === 13) {
      sendMessage();
      return false;
    }
  });

}).call(this);
