$('div.question').on('click', function () {
    // alert($(this).attr("data-target"));

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


        html_content += "<hr>";

        $.each(data['answers'], function (index, value) {

            html_content = addFullAnswerBlock(html_content, value);
            html_content += "</div>";
            html_content += "<hr class ='dashed'>";
        });

        html_content = addButtonToSubmitAnswer(html_content, data['question']);

        $('.question-modal-content').append(html_content);

        $( 'form#submitAnswer' ).submit(function ( e ) {
            var postData = $(this).serializeArray();
            html_content2 = '';

            $.ajax({
                url: $(this).attr('action'),
                dataType: "json",
                data: postData,
                type: 'POST',
                success: function ( data ) {
                    html_content2 = addFullAnswerBlock(html_content2, data);
                    html_content2 += "</div>";
                    html_content2 += "<hr class ='dashed'>";
                    $('.question-modal-content form#submitAnswer').prepend(html_content2);
                }
            });


            e.preventDefault();
        });

        $('div i.fi-like, div i.fi-dislike').on('click', function ( e ) {

            var getFormUrl = $('#questionModal').data('votes');

            var superDiv = $(this).parent();
            var postData = { id:superDiv.data('id'), value:superDiv.data('value') };

            $.ajax({
                url: getFormUrl,
                dataType: "json",
                data: postData,
                type: 'POST',
                success: function ( data ) {
                    $html = $("p#"+superDiv.data('id')).html();
                    $("p#"+superDiv.data('id')).html(parseInt($html) + parseInt(data['value']));
                    console.log($html);
                    console.log(parseInt($html) + parseInt(data['value']));
                    console.log(data);

                }
            });
        });
    });
});

function addVoteSection(upDown, score, id,  html_content) {
    console.log(id);

    html_content += "<div class='small-4 large-2 columns'>" +
    " <div class='row'>" +
    " <div class='small-12 columns text-center' data-id='"+id.toString()+"' data-value='1'> " +
    "<i class='fi-like'></i> " +
    "</div> " +
    "</div>" +
    " <div class='row'>" +
    " <div class='small-12 columns text-center'>" +
    " <p id='"+id+"' class='score'>" + score + "</p> " +
    "</div> " +
    "</div> " +
    "<div class='row'> " +
    "<div class='small-12 columns text-center' data-id='"+id+"' data-value='0' >" +
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
    html_content = addVoteSection(true, data['diffVotes'], data['id'], html_content);

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

    html_content = addVoteSection(true, answer_array['diffVotes'], answer_array['id'], html_content);

    html_content = addAnswerBlock(answer_array['username'], answer_array['data'], answer_array['description'], html_content);

    html_content += "<div class='small-10 columns comment'>";

    $.each(answer_array['comments'], function (index, value) {

        html_content = addCommentBlockFill(value['username'], value['description'], html_content);
    });

    html_content += "</div>";

    return html_content;
}

function addButtonToSubmitAnswer(html_content, question) {
    var getFormUrl = $('#questionModal').data('answer');

    html_content += '<form id="submitAnswer" action="'+ getFormUrl +'" method="post">' +
                        "<input type='hidden' name='question_id' value='"+question['id']+"'>" +
                        "<div class='row'>" +
                            "<div class='small-12 columns'>" +
                                "<label>Add answer" +
                                    "<textarea placeholder='Your answer' name='answer'></textarea>" +
                                "</label>" +
                            "</div>" +
                        "</div>" +
                        "<div class='row'>" +
                            "<div class='small-12 columns'>" +
                                "<input type='submit' class='button small success' value='Post answer'>" +
                            "</div>" +
                        "</div>" +
                    "</form>";

    return html_content;
}