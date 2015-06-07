$('div.question').on('click', function () {
    alert($(this).attr("data-value"));

    $.ajax({
        dataType: "json",
        url: $(this).attr('data-target'),
        method: "POST",
        data: {
            id: $(this).attr('data-value')
        }
    }).done(function(data) {
        console.log(data);
    });
});
