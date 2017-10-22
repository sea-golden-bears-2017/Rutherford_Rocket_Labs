$(document).ready(() => {

  $('.new-parts-form').on('click', '.new-part', (e) => {
    e.preventDefault();
    url = $(e.target).attr('href')
    $.ajax({
      url
    }).done((response) => {
      $(e.target).parent().find('.new-parts-ul').append(response)
    })
  })


}) //end document ready bracket
