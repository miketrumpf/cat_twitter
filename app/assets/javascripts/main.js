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
    debugger
    $.ajax({
      url: '/posts/search',
      dataType: 'script',
      method: "get"
    }); // end ajax
  }); // end click
});
