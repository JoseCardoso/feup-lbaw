{include file = 'common/header.tpl'}

<link rel="stylesheet" href="{$CSS_PATH}askfeup/explore.css"/>
<link rel="stylesheet" href="{$CSS_PATH}askfeup/profile.css"/>
</head>

<body>
{include file = 'common/navbar.tpl'}

<div class="row">
    <div class="small-12 columns">
        <h1>Profile</h1>
    </div>
</div>

<div class="row">
    <div class="small-12 medium-3 medium-offset-2 columns">
        <div class="large-image-div">
            {if $fb_logged}
                <img class="fb-large-image" src="{$fb_picture_large}">
            {else}
                <img src="http://placehold.it/400x400&amp;text=[img]">
            {/if}
        </div>
    </div>

    <div class="small-12 medium-6 end columns">
        <div class="row">
            <div class="small-12 medium-6 end columns">
                <h2 class="show-for-medium-up text-right">Info</h2>

                <hr class="show-for-small-only">
                <h2 class="show-for-small-only text-center">Info</h2>
            </div>
        </div>

        <div class="row show-for-medium-up">
            <div class="medium-6 columns">
                <p class="text-right"><strong>Username</strong></p>

                <p class="text-right"><strong>Email</strong></p>

                <p class="text-right"><strong>Bio</strong></p>
            </div>
            <div class="medium-6 columns">
                {if $fb_logged}
                    <p>{$username}</p>
                {else}
                    <p>{$profile->username}</p>
                {/if}
                <p>{$profile->email}</p>

                <p>MIEIC student</p>
            </div>
        </div>

        <div class="row show-for-small-only">
            <div class="small-12 columns text-center">
                <p class="info-label"><strong>Username</strong></p>

                <p>ferrolho</p>

                <p class="info-label"><strong>Email</strong></p>

                <p>henriqueferrolho@gmail.com</p>

                <p class="info-label"><strong>Bio</strong></p>

                <p>MIEIC student</p>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="small-12 columns">
        <hr>
    </div>
</div>

<div class="row">
    <div class="small-12 columns">
        <ul class="tabs show-for-medium-up" data-tab>
            <li class="tab-title active"><a href="#panel1">Questions</a></li>
            <li class="tab-title"><a href="#panel2">Answers</a></li>
            <li class="tab-title"><a href="#panel3">Favorites</a></li>
        </ul>
        <ul class="tabs show-for-small-only vertical" data-tab>
            <li class="tab-title text-center active"><a href="#panel1">Questions</a></li>
            <li class="tab-title text-center"><a href="#panel2">Answers</a></li>
            <li class="tab-title text-center"><a href="#panel3">Favorites</a></li>
        </ul>

        <div class="tabs-content">
            <div class="content active" id="panel1">
                <ul class="small-block-grid-1 medium-block-grid-2">
                    {foreach $user_questions as $question}
                        <li>
                            <div class="panel question" data-reveal-id="questionModal"
                                 data-target="{$BASE_URL}/../questions/question-modal.php" data-value="{$question->id}"
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
                                        <p class="question-author"><a href="{$BASE_URL}/../../pages/users/profile.php?username={$question->username}">{$question->displayUsername()}</a></p>

                                        <p class="question-date">{$question->displayDate()}</p>
                                    </div>
                                </div>
                            </div>
                        </li>
                    {/foreach}
                </ul>
            </div>

            <div class="content" id="panel2">
                <ul class="small-block-grid-1 medium-block-grid-2">
                    {foreach $user_answered_questions as $question}
                        <li>
                            <div class="panel question" data-reveal-id="questionModal"
                                 data-target="{$BASE_URL}/../questions/question-modal.php" data-value="{$question->id}"
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
                                        <p class="question-author"><a href="{$BASE_URL}/../../pages/users/profile.php?username={$question->username}">{$question->displayUsername()}</a></p>

                                        <p class="question-date">{$question->displayDate()}</p>
                                    </div>
                                </div>
                            </div>
                        </li>
                    {/foreach}
                </ul>
            </div>

            <div class="content" id="panel3">
                <p>No favorites yet.</p>
            </div>
        </div>
    </div>
</div>

<div id="questionModal" class="reveal-modal large">
</div>

<script src="{$JS_PATH}questions.js"></script>

{include file = 'common/footer.tpl'}
