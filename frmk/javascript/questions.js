$('div.question').on('click', function () {
    alert($(this).attr("data-target"));

    $.ajax({
        url: $(this).attr('data-target'),
        method: "POST",
        data: {
            id: $(this).attr('data-value')
        }
    }).done(function(data) {
        console.log(data);
    });

    // url with custom callbacks
    /*$('#questionModal').foundation('reveal', 'open', {
        url: 'http://some-url',
        success: function (data) {
            alert('modal data loaded');
        },
        error: function () {
            alert('failed loading modal');
        }
    });*/
    //<a class="close-reveal-modal">&#215;</a>

});
