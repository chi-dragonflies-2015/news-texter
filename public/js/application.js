$(document).ready(function() {
  $('.container').on('click', '.login', function(event){
    event.preventDefault();
     var url = $(this).attr('href');
     var $element = $(this);
     var request = $.ajax({ url: url,
                              method: "GET"
      });
        request.done(function(response){
          $element.hide();
          $('.signup').show();
          $('.container').append(response);
        });
    });

     $('.container').on('click', '.signup', function(event){
    event.preventDefault();
     var url = $(this).attr('href');
     var $element = $(this);
     var request = $.ajax({ url: url,
                              method: "GET"
      });
        request.done(function(response){
          $element.hide();
          $('.login').show();
          $('.container').append(response);
        });
    });
});

