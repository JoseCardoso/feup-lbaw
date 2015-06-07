$('div.question').on('click', function () {
    alert($(this).attr("data-target"));

    $.ajax({
        dataType: "json",
        url: $(this).attr('data-target'),
        method: "POST",
        data: {
            id: $(this).attr('data-value')
        }
    }).done(function (data) {
        // console.log( data['question']);

        JSON.stringify(data);
        $('#questionModal').empty();
        addFullQuestionBlock($('#questionModal'), data['question']);
        $('#questionModal').append("</div> <hr>");

        JSON.stringify(data['answers']);
        $.each(data['answers'], function (index, value) {

            addFullAnswerBlock($('#questionModal'), value);
            $('#questionModal').append("</div>");
            $('#questionModal').append("<hr class ='dashed'>");
        });
    });
});


function addVoteSection(upDown, score, $HtmlElement) {
    $HtmlElement.append("  <div class='small-4 large-2 columns'>" +
                                " <div class='row'>" +
                                    " <div class='small-12 columns text-center'> " +
                                        "<i class='fi-like'></i> " +
                                     "</div> " +
                                 "</div>" +
                                " <div class='row'>" +
                                    " <div class='small-12 columns text-center'>" +
                                        " <p class='score'>" + score + "</p> " +
                                    "</div> " +
                                "</div> " +
                                "<div class='row'> " +
                                    "<div class='small-12 columns text-center'>" +
                                        " <i class='fi-dislike'></i>" +
                                    " </div> " +
                                "</div>" +
                                " <div class='row'>" +
                                    " <div class='small-12 columns text-center'> " +
                                        "<i class='fi-check'></i> " +
                                    "</div> " +
                                "</div> " +
                            "</div> ");
}

function addQuestionBlock(authour, date, question_text, $HtmlElement) {
    $HtmlElement.append("<div class='small-8 large-10 columns'> " +
    "<p class='answer-text'>" + question_text + "</p> " +
    "<p class='text-right question-author'><a href='#''> @" + authour + "</a></p> " +
    "<p class='text-right question-date'>" + date + "</p> " +
    "</div>");

}

function addAnswerBlock(authour, date, answer_text, $HtmlElement) {
    $HtmlElement.append("<div class='small-8 large-10 columns'> <p>" + answer_text + "</p> <p class='text-right question-author'><a href='#''> @" + authour + "</a></p> <p class='text-right question-date'>" + date + "</p> </div>");

}

function addComentBlockFill(authour, comment_text, $HtmlElement) {
    $HtmlElement.append("<div class='small-10 columns comment'> <hr> <p>" + comment_text + "<a href='#'> @" + authour + "</a></p> </div>");

}


function addComentBlockDashed(authour, comment_text, $HtmlElement) {
    $HtmlElement.append("<div class='small-10 columns comment'> <hr class = 'dashed'> <p>" + comment_text + "<a href='#'> @" + authour + "</a></p>");

}

function addFullQuestionBlock($HtmlElement, data) {

    JSON.stringify(data);

    $HtmlElement.append("<div class='row'>" );
    addVoteSection(true, data['diffVotes'], $HtmlElement);

    addQuestionBlock(data['username'], data['data'], data['text'], $HtmlElement);

    $.each(data['comments'], function (index, value) {

        if (index == 0)
            addComentBlockFill(value['username'], value['description'], $HtmlElement);
        else
            addComentBlockDashed(value['username'], value['description'], $HtmlElement);
    });

    $HtmlElement.append("</div>");
}

function addFullAnswerBlock($HtmlElement, answer_array) {

    JSON.stringify(answer_array);

    addVoteSection(true, answer_array['diffVotes'], $HtmlElement);

    addAnswerBlock(answer_array['username'], answer_array['data'], answer_array['description'], $HtmlElement);

    $.each(answer_array['comments'], function (index, value) {

        addComentBlockFill(value['username'], value['description'], $HtmlElement);
    });


    $HtmlElement.append("</div>");
}





