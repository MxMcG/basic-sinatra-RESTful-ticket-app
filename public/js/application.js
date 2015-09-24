$(document).ready(function() {

  $('h3 #new-post-link').on('click', function(event) {
    event.preventDefault();

    var path = $(this).attr('href');

    $.ajax({
            url: path,
            method: "get",
            dataType: "html"
    })
    .done(function(response){
        if (typeof $('#new-ticket-form') !== undefined){
          $('#new-ticket-form').remove();
          $('#new-ticket').append(response);
        }else{
          $('#new-ticket').append(response);
        }




        $('#new-ticket-form form').submit("click", function(event) {
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
            //response is a partial
            $('#ticket-post').append(response);
            $('#new-ticket-form').remove();




        // $('div#ticket-post').on('click', 'a.delete-link', function(e){
        //     e.preventDefault();

        //     var ticket = $(this).parent();

        //     $.ajax({
        //       url: $(this).attr('href'),
        //       method: 'delete'
        //     })

        //     .done(function(response){
        //       ticket.remove();

        //     })
        //   })




        })
      });



    }) // end done
  }); // end original ajax



$('div#ticket-post').on('click', 'a.delete-link', function(e){
    e.preventDefault();

    var ticket = $(this).parent();


    $.ajax({
      url: $(this).attr('href'),
      method: 'delete'
    })

    .done(function(response){
      ticket.remove();

      // console.log('somtehng was deleted!');
      // console.log(arguments);
    })
  })



}); //end doc ready
