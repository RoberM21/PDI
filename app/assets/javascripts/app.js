$(document).on('turbolinks:load', function() {
  $('select').material_select();
})

$(function() {
  return $(document).on('change', '#countries_select', function(evt) {
    return $.ajax('update_cities', {
      type: 'GET',
      dataType: 'script',
      data: {
        country_id: $("#countries_select option:selected").val()
      },
      error: function(jqXHR, textStatus, errorThrown) {
        return console.log("AJAX Error: " + textStatus);
      },
      success: function(data, textStatus, jqXHR) {
        return console.log("Dynamic country select OK!");
      }
    });
  });
});
