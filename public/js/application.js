$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('h3 a').on('click', function(event) {
    event.preventDefault();

    var path = $(this).attr('href');

    $.ajax({
            url: path,
            method: "get",
            dataType: "html"
    })
    .done(function(response){
      $('#new-ticket').append(response);

      $('#new-ticket-form form').submit("click",function(event) {
        event.preventDefault();

        var path = $(this).attr('action')
        var ticketData = $(this).serialize();


        $.ajax({
              url: path,
              method: "post",
              dataType: "html",
              data: ticketData
        })
        .done(function(response){
          console.log(response);
          $('#ticket-post').append(response);
          $('#new-ticket-form').hide();

          // next append new ticket to the home page and add to ticket feed (create ticket post)
        })



      }); // end line 20

    }) // end done line 17

  }); // end line 7

}); //end doc ready
