console.log("main js file loaded")
$(function() {

  $("body").on("click", "#twitter-sign-in", function(){
    $.ajax({
      url: '/users/go_to_twitter',
      dataType: 'script'
    }); // end ajax
  }); // end click

  $("body").on("click", "#sign-in", function(){
    $.ajax({
      url: '/sign_in_partial',
      dataType: 'script'
    }); // end ajax
  }); // end click

  $("body").on("click", "#sign-up", function(){
    $.ajax({
      url: '/sign_up_partial',
      dataType: 'script'
    }); // end ajax
  }); // end click

  $("body").on("click", "#search", function(e){
    e.preventDefault();
    var twitterHandle = $("#handle").val()
    $.ajax({
      url: '/posts/search',
      dataType: 'script',
      data: {twitterHandle}
    }); // end ajax
  }); // end click
});
