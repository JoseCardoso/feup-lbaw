$('div.question').on('click', function () {

    $.ajax({
        dataType: "json",
        url: $(this).attr('data-target'),
        method: "POST",
        data: {
            id: $(this).attr('data-value')
        }
    }).done(function (data) {

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

        $('form#submitAnswer').submit(function (e) {
            var postData = $(this).serializeArray();
            answer_block = '';

            $.ajax({
                url: $(this).attr('action'),
                dataType: "json",
                data: postData,
                type: 'POST',
                success: function (data) {
                    answer_block = addFullAnswerBlock(answer_block, data);
                    answer_block += "</div>";
                    answer_block += "<hr class ='dashed'>";
                    $('.question-modal-content form#submitAnswer').before(answer_block);
                }
            }).error(function (e) {
                console.log(e);
            });

            $('form#submitAnswer textarea').val("");

            e.preventDefault();
        });

        $('div.question-modal-content').on('submit', 'form.submitComment', function(eventComment) {
            var postData = $(this).serializeArray();
            comment_block = '';

            eventComment.preventDefault();

            $.ajax({
                url: $(this).attr('action'),
                dataType: "json",
                data: postData,
                type: 'POST',
                success: function (data) {
                    comment_block = addCommentBlockDashed(data['username'], data['description'], comment_block);
                    comment_block += "</div>";

                    $('.question-modal-content form#submitComment' + data['contribution_id']).before(comment_block);
                     console.log($('.question-modal-content form#submitComment' + data['contribution_id']));
                    console.log(data);
                }
            }).error(function (e) {
                console.log(e);
            });

            $('form.submitComment input.comment-content').val("");
        });

        $('div i.fi-like, div i.fi-dislike').on('click', function (e) {

            var getFormUrl = $('#questionModal').data('votes');

            var superDiv = $(this).parent();

            var contributionType = superDiv.parent().parent().parent().data('type');
            var postData = {id: superDiv.data('id'), value: superDiv.data('value'), type: contributionType};

            $.ajax({
                url: getFormUrl,
                dataType: "json",
                data: postData,
                type: 'POST',
                success: function (data) {
                    console.log(data);
                    $html = $("p#" + superDiv.data('id')).html();
                    $("p#" + superDiv.data('id')).html(parseInt($html) + parseInt(data['value']));
                    //$("p#" + superDiv.data('id')).html(parseInt(data['value']));

                    changeColorOfVotes(superDiv, data);

                }
            });
        });
    });
});

function submitComment(element, data) {

}

function changeColorOfVotes(element, data) {

    console.log(element);
    console.log(element.children().attr('style'));
    console.log(element.parent().next().next().children().children());

    if (data['previous'] == "positive-update") {
        element.children().attr('style', 'color:red');
        element.parent().prev().prev().children().children().attr('style', '');
    }
    else if (data['previous'] == "positive-create") {
        element.children().attr('style', 'color:green');
    }
    else if (data['previous'] == "positive-delete") {
        element.children().attr('style', '');

    } else if (data['previous'] == "negative-update") {
        element.parent().next().next().children().children().attr('style', '');
        element.children().attr('style', 'color:green');

    } else if (data['previous'] == "negative-create") {
        element.children().attr('style', 'color:red');

    } else if (data['previous'] == "negative-delete") {
        element.children().attr('style', '');
    }

}

function addVoteSection(upDown, score, id, html_content) {

    if (score < 0) {
        html_content += "<div class='small-4 large-2 columns'>" +
        " <div class='row'>" +
            " <div class='small-12 columns text-center' data-id='" + id.toString() + "' data-value='1'> " +
                "<i class='fi-like'></i> " +
            "</div> " +
        "</div>" +
        " <div class='row'>" +
            " <div class='small-12 columns text-center'>" +
                " <p id='" + id + "' class='score'>" + score + "</p> " +
            "</div> " +
        "</div> " +
        "<div class='row'> " +
            "<div class='small-12 columns text-center' data-id='" + id + "' data-value='0' >" +
                " <i class='fi-dislike' style ='color:red'></i>" +
            " </div> " +
        "</div>" +
        " <div class='row'>" +
            " <div class='small-12 columns text-center'> " +
                "<i class='fi-check'></i> " +
            "</div> " +
        "</div> " +
        "</div> ";
    }
    else if (score > 0) {
        html_content += "<div class='small-4 large-2 columns'>" +
        " <div class='row'>" +
        " <div class='small-12 columns text-center' data-id='" + id.toString() + "' data-value='1'> " +
        "<i class='fi-like' style='color:green'></i> " +
        "</div> " +
        "</div>" +
        " <div class='row'>" +
        " <div class='small-12 columns text-center'>" +
        " <p id='" + id + "' class='score'>" + score + "</p> " +
        "</div> " +
        "</div> " +
        "<div class='row'> " +
        "<div class='small-12 columns text-center' data-id='" + id + "' data-value='0' >" +
        " <i class='fi-dislike'></i>" +
        " </div> " +
        "</div>" +
        " <div class='row'>" +
        " <div class='small-12 columns text-center'> " +
        "<i class='fi-check'></i> " +
        "</div> " +
        "</div> " +
        "</div> ";
    }
    else {
        html_content += "<div class='small-4 large-2 columns'>" +
        " <div class='row'>" +
        " <div class='small-12 columns text-center' data-id='" + id.toString() + "' data-value='1'> " +
        "<i class='fi-like'></i> " +
        "</div> " +
        "</div>" +
        " <div class='row'>" +
        " <div class='small-12 columns text-center'>" +
        " <p id='" + id + "' class='score'>" + score + "</p> " +
        "</div> " +
        "</div> " +
        "<div class='row'> " +
        "<div class='small-12 columns text-center' data-id='" + id + "' data-value='0' >" +
        " <i class='fi-dislike'></i>" +
        " </div> " +
        "</div>" +
        " <div class='row'>" +
        " <div class='small-12 columns text-center'> " +
        "<i class='fi-check'></i> " +
        "</div> " +
        "</div> " +
        "</div> ";

    }

    return html_content;
}

function addQuestionBlock(author, date, question_text, html_content) {
    var profileURL = $('#questionModal').data('profile');

    html_content += "<div class='small-8 large-10 columns'> " +
    "<p class='answer-text'>" + question_text + "</p> " +
    "<p class='text-right question-author'><a href='" + profileURL + "?username=" + author + "'> @" + author + "</a></p> " +
    "<p class='text-right question-date'>" + date + "</p> " +
    "</div>";

    return html_content;
}

function addAnswerBlock(author, date, answer_text, html_content) {
    var profileURL = $('#questionModal').data('profile');

    html_content += "<div class='small-8 large-10 columns'> " +
    "<p>" + answer_text + "</p> " +
    "<p class='text-right question-author'><a href='" + profileURL + "?username=" + author + "'> @" + author + "</a></p>" +
    "<p class='text-right question-date'>" + date + "</p> " +
    "</div>";

    return html_content;
}

function addCommentBlockFill(author, comment_text, html_content) {
    var profileURL = $('#questionModal').data('profile');

    html_content += "<p>" + comment_text + "<a href='" + profileURL + "?username=" + author + "'> @" + author + "</a></p><hr class = 'dashed'>";

    return html_content;
}


function addCommentBlockDashed(author, comment_text, html_content) {
    var profileURL = $('#questionModal').data('profile');

    html_content += "<p>" + comment_text + "<a href='" + profileURL + "?username=" + author + "'> @" + author + "</a></p><hr class = 'dashed'>";

    return html_content;
}

function addFullQuestionBlock(html_content, data) {


    html_content += "<div class='row' data-type='question'>";

    html_content = addVoteSection(true, data['diffVotes'], data['id'], html_content);

    html_content = addQuestionBlock(data['username'], data['data'], data['text'], html_content);

    html_content += "<div class='small-10 columns comment'><hr>";

    $.each(data['comments'], function (index, value) {

        if (index == 0)

            html_content = addCommentBlockFill(value['username'], value['description'], html_content);
        else
            html_content = addCommentBlockDashed(value['username'], value['description'], html_content);
    });

    html_content = addButtonToSubmitComment(html_content, data['id']);

    html_content += "</div></div>";

    return html_content;
}

function addFullAnswerBlock(html_content, answer) {

    html_content += "<div class='row' data-type='answer'>";
    html_content = addVoteSection(true, answer['diffVotes'], answer['id'], html_content);

    html_content = addAnswerBlock(answer['username'], answer['data'], answer['description'], html_content);

    html_content += "<div class='small-10 columns comment'><hr>";

    $.each(answer['comments'], function (index, value) {

        if (index == 0)

            html_content = addCommentBlockFill(value['username'], value['description'], html_content);
        else
            html_content = addCommentBlockDashed(value['username'], value['description'], html_content);
    });

    html_content = addButtonToSubmitComment(html_content, answer['id']);

    html_content += "</div></div>";

    return html_content;
}

function addButtonToSubmitAnswer(html_content, question) {
    var getAnswerURL = $('#questionModal').data('answer');

    html_content += '<form id="submitAnswer" action="' + getAnswerURL + '" method="post">' +
    "<input type='hidden' name='question_id' value='" + question['id'] + "'>" +
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

function addButtonToSubmitComment(html_content, object_id) {
    var getCommentURL = $('#questionModal').data('comment');

    html_content += '<form id="submitComment" action="' + getCommentURL + '" method="post">' +
    "<input type='hidden' name='contribution_id' value='" + object_id + "'>" +
    "<div class='row'>" +
    "<div class='small-12 columns'>" +
    "<label>" +
    "<input class='comment-content' type='text' placeholder='Your comment' name='comment'>" +
    "</label>" +
    "</div>" +
    "</div>" +
    "<div class='row'>" +
    "<div class='small-12 columns'>" +
    "<input type='submit' class='button tiny success' value='Post comment'>" +
    "</div>" +
    "</div>" +
    "</form>";
}

function addButtonToSubmitComment(html_content, object_id) {
    var getCommentURL = $('#questionModal').data('comment');

    html_content += '<form id="submitComment' + object_id + '" action="' + getCommentURL + '" method="post" class="submitComment">' +
    "<input type='hidden' name='contribution_id' value='" + object_id + "'>" +
    "<div class='row'>" +
    "<div class='small-12 columns'>" +
    "<label>" +
    "<input class='comment-content' type='text' placeholder='Your comment' name='comment'>" +
    "</label>" +
    "</div>" +
    "</div>" +
    "<div class='row'>" +
    "<div class='small-12 columns'>" +
    "<input type='submit' class='button tiny success' value='Post comment'>" +
    "</div>" +
    "</div>" +
    "</form>";

    return html_content;
}