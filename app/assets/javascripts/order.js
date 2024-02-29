//= require jquery3
//= require jquery_ujs
$(function () {
  $('#order_new').on('submit', function (e) {
    e.preventDefault();
    let items = [];
    $('#order_new :input').each(function () {
      if (this.value != '')
        items.push({
          id: this.id,
          quantity: parseInt(this.value),
        });
    });
    const order = {
      items,
    };
    if (items.length != 0) {
      $.ajax({
        type: 'POST',
        url: '/orders',
        dataType: 'json',
        headers: {
          'Content-Type': 'application/json',
        },
        data: JSON.stringify({ order }),
        success: function (data, textStatus, jqXHR) {
          if (textStatus == 'success') {
            window.location.replace('/');
          } else {
            $('body').prepend(`<p>${jqXHR.responseText}</p>`);
          }
        },
        error: function (jqXHR, textStatus, errorThrown) {
          $('body').prepend(`<p>${(jqXHR.responseText, errorThrown)}</p>`);
        },
      });
    } else {
      alert('Please add quantity in products');
    }
  });
});
