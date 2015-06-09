{include file = 'common/header.tpl'}

<style>
    li {
        list-style-type: none;
    }
</style>

</head>

<body>
{include file = 'admin/admin-navbar.tpl'}


<div class="row">
    <div class="small-12 columns">
        <h1>{$question->text}</h1>
    </div>
</div>

<div class="row">
    <div class="small-5 small-centered columns">
        <table class="small-12">
            <caption>Question information</caption>
            <tbody>
            <tr>
                <th class="small-4 text-right">ID</th>
                <td class="small-8">{$question->id}</td>
            </tr>
            <tr>
                <th class="text-right">Description</th>
                <td>{$question->description}</td>
            </tr>
            <tr>
                <th class="text-right">Category ID</th>
                <td>{$question->category_id}</td>
            </tr>
            <tr>
                <th class="text-right">Date</th>
                <td>{$question->data}</td>
            </tr>
            <tr>
                <th class="text-right">Username</th>
                <td>{$question->username}</td>
            </tr>

            <tr>
                <th class="text-right">Number of Answers</th>
                <td>{$question->numAnswers}</td>
            </tr>
            <tr>
                <th class="text-right">Number of Views</th>
                <td>{$question->numViews}</td>
            </tr>

            </tbody>
        </table>
    </div>
</div>


<div class="row">
    <div class="small-8 small-centered columns">
        <ul class="button-group even-4">
            <li>
                <a href="{$BASE_URL}/../../pages/admin/admin-questions.php" class="button">Questions</a>
            </li>
            <li>
                <a href="{$BASE_URL}/../../pages/admin/admin-answers.php?question_id={$question->id}"
                   class="button">Answers</a>
            </li>
            <li>
                <a href="{$BASE_URL}/../../pages/admin/admin-comments.php?contribution_id={$question->id}" class="button">Comments</a>
            </li>
            <li>
                <a href="{$BASE_URL}/../../pages/admin/admin-question-delete.php?question={$question->id}" class="button">Delete</a>
            </li>
        </ul>
    </div>
</div>

{include file = 'common/footer.tpl'}

