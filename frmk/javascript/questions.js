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
        $('.question-modal-content').empty();
        addFullQuestionBlock($('.question-modal-content'), data['question']);
        $('.question-modal-content').append("</div> <hr>");

        JSON.stringify(data['answers']);
        $.each(data['answers'], function (index, value) {

            addFullAnswerBlock($('.question-modal-content'), value);
            $('.question-modal-content').append("</div>");
            $('.question-modal-content').append("<hr class ='dashed'>");
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
    $HtmlElement.append("<div class='small-8 large-10 columns'> " +
                            "<p>" + answer_text + "</p> " +
                            "<p class='text-right question-author'><a href='#''> @" + authour + "</a></p>" +
                            "<p class='text-right question-date'>" + date + "</p> " +
                        "</div>");

}

function addCommentBlockFill(authour, comment_text, $HtmlElement) {
    $HtmlElement.append("<hr><p>" + comment_text + "<a href='#'> @" + authour + "</a></p> ");

}


function addCommentBlockDashed(authour, comment_text, $HtmlElement) {
    $HtmlElement.append("<hr class = 'dashed'> <p>" + comment_text + "<a href='#'> @" + authour + "</a></p> ");

}

function addFullQuestionBlock($HtmlElement, data) {

    JSON.stringify(data);

    $HtmlElement.append("<div class='row'>" );
    addVoteSection(true, data['diffVotes'], $HtmlElement);

    addQuestionBlock(data['username'], data['data'], data['text'], $HtmlElement);

    $HtmlElement.append("<div class='small-10 columns comment'>");

    $.each(data['comments'], function (index, value) {

        if (index == 0)
            addCommentBlockFill(value['username'], value['description'], $HtmlElement);
        else
            addCommentBlockDashed(value['username'], value['description'], $HtmlElement);
    });

    $HtmlElement.append("</div>");
}

function addFullAnswerBlock($HtmlElement, answer_array) {

    JSON.stringify(answer_array);

    addVoteSection(true, answer_array['diffVotes'], $HtmlElement);

    addAnswerBlock(answer_array['username'], answer_array['data'], answer_array['description'], $HtmlElement);

    $HtmlElement.append("<div class='small-10 columns comment'>");

    $.each(answer_array['comments'], function (index, value) {

        addCommentBlockFill(value['username'], value['description'], $HtmlElement);
    });

    $HtmlElement.append("</div>")

}





