console.log("main js file loaded")

//file handling the js click events in the app
$(function() {

  //sign in partial
  $("body").on("click", "#sign-in", function(){
    $.ajax({
      url: '/sign_in_partial',
      dataType: 'script'
    }); // end ajax
  }); // end click

  //sign up partial
  $("body").on("click", "#sign-up", function(){
    $.ajax({
      url: '/sign_up_partial',
      dataType: 'script'
    }); // end ajax
  }); // end click

  //search and display results partial
  $("body").on("click", "#search", function(e){
    e.preventDefault();
    var twitterHandle = $("#handle").val()
    $.ajax({
      url: '/posts/search',
      dataType: 'script',
      data: {twitterHandle}
    });
  });

  //mark post as read and remove from DOM
  $("body").on("click", "#read_button", function(e){
    e.preventDefault();
    var tweetId = $(this).data().tweetId
    var child = $(this)
    $.ajax({
      url: '/mark_as_read',
      dataType: 'script',
      method: "get",
      data: {tweetId},
      success: function(result) {
        // when successful remove row from table on DOM
        child.parent().parent().remove()
        console.log("hit success callback")
      },
      error: function() {
        console.log("hit error callback")
      }
    });
  });


});
