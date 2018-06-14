$(function() {
  var overlay = $('.overlay');
  var modals = $('.modal');

  // Activate modal

  const relevant_modal = function (event) {
    return $(event.target.closest('a')).siblings('.modal');
  };

  $('a').on('click', function(event) {
    event.preventDefault();

    overlay.css('display', 'block');
    relevant_modal(event).css('display', 'block');
    relevant_modal(event).css({
      top: $(window).scrollTop() + 40
    });
  });

  // Close modal

  const close = function (event) {
    event.preventDefault;

    modals.css('display', 'none');
    overlay.css('display', 'none');
  };

  overlay.on('click', close);
  $('.close').on('click', close);
});
