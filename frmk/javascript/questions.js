$('div.question').on('click', function () {
    alert($(this).attr("data-target"));

    $.ajax({
        dataType: "json",
        url: $(this).attr('data-target'),
        method: "POST",
        data: {
            id: $(this).attr('data-value')
        }
    }).done(function(data) {
        console.log(JSON.stringify(data));
        $('p.score').html(data.question.id);

    });
});
