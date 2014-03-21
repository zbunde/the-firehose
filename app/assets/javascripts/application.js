// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.turbolinks
//= require_tree .


  $(document).ready(function () {

    $("#new_link input").change(function () {
      var completedInputs = 0;
      $("#new_link input.form-control").each(function () {
        if($(this).val() !== "") {
          console.log($(this).val());
          completedInputs++;
        }
      });
      $(".progress-bar").css("width", (completedInputs*25)+"%");
      if (completedInputs === 4) {
        $(".progress-bar").addClass('progress-bar-success');
        $(".progress-bar").removeClass('progress-bar-info');
      }
    })
  });