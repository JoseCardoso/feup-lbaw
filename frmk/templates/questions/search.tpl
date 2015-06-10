{include file = 'common/header.tpl'}

<link rel="stylesheet" href="{$CSS_PATH}askfeup/explore.css"/>

</head>

<body>
{include file = 'common/navbar.tpl'}

<div class="row">
    <div class="small-12 columns">
        <h3>Results of search {$search_content}</h3>
    </div>
</div>

<div class="row">
    <div class="small-12 columns">
        <ul class="small-block-grid-1 medium-block-grid-2">
            {foreach $questions as $question}
                <li>
                    <div class="panel question" data-reveal-id="questionModal"
                         data-target="{$BASE_URL}/../../pages/questions/question-modal.php" data-value="{$question->id}"
                         data-reveal-ajax="true">
                        <div class="row">
                            <div class="small-12 columns">
                                <p class="text-justify question-text">{$question->text}</p>
                            </div>
                        </div>
                        <div class="row text-center">
                            <div class="small-3 medium-4 columns question-stats">
                                <p>{$question->diffVotes}</p>

                                <p>votes</p>
                            </div>
                            <div class="small-3 medium-4 columns question-stats">
                                <p>{$question->numAnswers}</p>

                                <p>answers</p>
                            </div>
                            <div class="small-6 medium-4 columns text-right">
                                <p class="question-author"><a
                                            href="{$BASE_URL}/../../pages/users/profile.php?username={$question->username}">{$question->displayUsername()}</a>
                                </p>

                                <p class="question-date">{$question->displayDate()}</p>
                            </div>
                        </div>
                    </div>
                </li>
            {/foreach}
        </ul>
    </div>
</div>

{include file = 'questions/question.tpl'}

<script src="{$JS_PATH}questions.js"></script>

{include file = 'common/footer.tpl'}

{*<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function (event) {
        var id = window.location.hash.substring(1); // remove the #
        var element = document.querySelector('[data-reveal-id="' + id + '"]');

        element.click();
    });
</script>*}
