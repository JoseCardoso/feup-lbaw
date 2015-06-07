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

/*
        addFullQuestionBlock($('panel-question'), data);

        for ( var k in data['answes'])
            addFullAnswerBlock($('panel-question'),k);
 */});
});



/*function addVoteSection(upDown, score, $HtmlElement) {

     

    if(upDown == true)
        $HtmlElement.append("<div class='small-4 large-2 columns'> 
                                    <div class='row'> 
                                        <div class='small-12 columns text-center'> 
                                            <i class='fi-like'></i> 
                                        </div> 
                                    </div> 
                                    <div class='row'> 
                                        <div class='small-12 columns text-center'> 
                                            <p class='score'>" score "</p>
                                        </div> 
                                    </div>

                                    <div class='row'>
                                        <div class='small-12 columns text-center'>
                                            <i class='fi-dislike'></i>
                                        </div>
                                    </div>

                                    <div class='row'>
                                        <div class='small-12 columns text-center'>
                                            <i class='fi-check'></i>
                                        </div>
                                    </div>
                                </div>");
    else
        $HtmlElement.append("<div class='small-4 large-2 columns'>
                                    <div class='row'>
                                        <div class='small-12 columns text-center'>
                                            <i class='fi-like'></i>
                                        </div>
                                    </div>

                                    <div class='row'>
                                        <div class='small-12 columns text-center'>
                                            <p class='score negative-score'>"score"</p>
                                        </div>
                                    </div>

                                    <div class='row'>
                                        <div class='small-12 columns text-center'>
                                            <i class='fi-dislike'></i>
                                        </div>
                                    </div>
                                </div>");

}

function addQuestionBlock(authour, date, question_text, $HtmlElement) {
     $HtmlElement.append("<div class='small-8 large-10 columns'>
                <p class='answer-text'>"question-text"</p>

                <p class='text-right question-author'><a href='#''>"authour"</a></p>

                <p class='text-right question-date'>"date"</p>
            </div>"); 

 }

 function addAnswerBlock(authour, date, answer_text, $HtmlElement) {
     $HtmlElement.append( "<div class='small-8 large-10 columns'> 
                                <p>"answer_text"</p>  
                                <p class='text-right question-author'><a href='#''>"authour"</a></p> 
                                <p class='text-right question-date'>"date"</p> 
                            </div>");

 }

 function addComentBlock(authour, comment-text, $HtmlElement) {
     $HtmlElement.append("<div class='small-10 columns comment'>
                                <hr>
                                <p>"comment-text"<a href='#'>"authour"</a></p>
                            </div>"); 

 }

 function addFullQuestionBlock($HtmlElement,data){

    addVoteSection(true, data['diffVotes'], $HtmlElement);
    addQuestionBlock(data['username'], data['data'] , data['text'], $HtmlElement);

    for (var k in data.comments){
        $HtmlElement.append('<hr>');
        addComentBlock(k['username'], k.['description'], $HtmlElement);
    }
}
 
 function addFullAnswerBlock($HtmlElement, answer-array){

    for ( var k in answer-array){

        addVoteSection((true, k['diffVotes'], $HtmlElement));

        addAnswerBlock(k['username'], k['data'], k['description'], $HtmlElement);

        for (var l in k['comments']){
            $HtmlElement.append('<hr class= dashed>');
            addComentBlock(l['username'], l['description'], $HtmlElement);
        }

    }

 }

*/
