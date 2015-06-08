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

        var html_content = "";

        html_content = addFullQuestionBlock(html_content, data['question']);

        html_content += "<hr>\n";

        $.each(data['answers'], function (index, value) {

            html_content = addFullAnswerBlock(html_content, value);
            html_content += "</div>";
            html_content += "<hr class ='dashed'>";
        });

        html_content = addButtonToSubmitAnswer(html_content);

        $('.question-modal-content').append(html_content);
    });
});


function addVoteSection(upDown, score, html_content) {
    html_content += "<div class='small-4 large-2 columns'>" +
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
    "</div> ";

    return html_content;
}

function addQuestionBlock(authour, date, question_text, html_content) {
    html_content += "<div class='small-8 large-10 columns'> " +
    "<p class='answer-text'>" + question_text + "</p> " +
    "<p class='text-right question-author'><a href='#''> @" + authour + "</a></p> " +
    "<p class='text-right question-date'>" + date + "</p> " +
    "</div>";

    return html_content;
}

function addAnswerBlock(authour, date, answer_text, html_content) {
    html_content += "<div class='small-8 large-10 columns'> " +
    "<p>" + answer_text + "</p> " +
    "<p class='text-right question-author'><a href='#''> @" + authour + "</a></p>" +
    "<p class='text-right question-date'>" + date + "</p> " +
    "</div>";

    return html_content;
}

function addCommentBlockFill(authour, comment_text, html_content) {
    html_content += "<hr><p>" + comment_text + "<a href='#'> @" + authour + "</a></p> ";

    return html_content;
}


function addCommentBlockDashed(authour, comment_text, html_content) {
    html_content = "<hr class = 'dashed'> <p>" + comment_text + "<a href='#'> @" + authour + "</a></p> ";

    return html_content;
}

function addFullQuestionBlock(html_content, data) {

    html_content += "<div class='row'>";
    html_content = addVoteSection(true, data['diffVotes'], html_content);

    html_content = addQuestionBlock(data['username'], data['data'], data['text'], html_content);

    html_content += "<div class='small-10 columns comment'>";

    $.each(data['comments'], function (index, value) {

        if (index == 0)
            html_content = addCommentBlockFill(value['username'], value['description'], html_content);
        else
            html_content = addCommentBlockDashed(value['username'], value['description'], html_content);
    });

    html_content += "</div></div>";

    return html_content;
}

function addFullAnswerBlock(html_content, answer_array) {

    //JSON.stringify(answer_array);

    html_content = addVoteSection(true, answer_array['diffVotes'], html_content);

    html_content = addAnswerBlock(answer_array['username'], answer_array['data'], answer_array['description'], html_content);

    html_content += "<div class='small-10 columns comment'>";

    $.each(answer_array['comments'], function (index, value) {

        html_content = addCommentBlockFill(value['username'], value['description'], html_content);
    });

    html_content += "</div>";

    return html_content;
}

function addButtonToSubmitAnswer(html_content) {
    html_content += "<form>" +
                        "<div class='row'>" +
                            "<div class='small-12 columns'>" +
                                "<label>Add answer" +
                                    "<textarea placeholder='Your answer'></textarea>" +
                                "</label>" +
                            "</div>" +
                        "</div>" +
                        "<div class='row'>" +
                            "<div class='small-12 columns'>" +
                                "<a href='#' class='button small success'>Post answer</a>" +
                            "</div>" +
                        "</div>" +
                    "</form>";

    return html_content;
}

