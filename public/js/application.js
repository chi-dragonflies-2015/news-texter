$(document).ready(function() {
  $('.big-text').on('click', '.login', function(event){
    event.preventDefault();
     var url = $(this).attr('href');
     var request = $.ajax({ url: url,
                              method: "GET"
      });
        request.done(function(response){
          $('li').removeClass('active');
          $('this').parent().addClass('active');
          $('.section').css('margin-left', '30px')
          $('.section').html(response);
        });
    });

     $('.big-text').on('click', '.signup', function(event){
    event.preventDefault();
     var url = $(this).attr('href');
     var request = $.ajax({ url: url,
                              method: "GET"
      });
        request.done(function(response){
          $('.section').css('margin-left', '120px');
          $('.section').html(response);
        });
    });

    $('.container').on('click', '#update', function(event){
    event.preventDefault();
      $element = $(this)
     var url = $(this).attr('href');
     var request = $.ajax({ url: url,
                              method: "GET"
      });
        request.done(function(response){
          $element.hide();
          $('.update').append(response)
        });
    });

    $('.container').on('submit', '#edit-form', function(event){
    event.preventDefault();
     $element = $(this)
     var url = $(this).attr('href');
     var data = $(this).serialize();
     var request = $.ajax({ url: url,
                              method: "POST",
                              data: data
      });
        request.done(function(response){
          $('.email').text(response.email);
          $('.phone').text(response.phone);
          $element.remove();
          $('#update').show();

        });
    });
});

