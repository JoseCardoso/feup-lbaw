{include file = 'common/header.tpl'}

<style>
    li {
        list-style-type: none;
    }
</style>

</head>

<body>
{include file = 'admin/admin-navbar.tpl'}

<h1>{$answer->description}</h1>

<div class="row">

    <div class="row">
        <div class="medium-10 columns">
        </div>

        <div class="medium-2 columns">
            <a href="#" class="button small">Delete</a></li>
        </div>

    </div>

    <div class="row">
        <div class="small-6 columns">
            <div class="answer-info">
                <table>

                    <tbody>
                    <tr>
                        <th>ID</th>
                        <td>{$answer->id}</td>
                    </tr>

                    <tr>
                        <th>Description</th>
                        <td>{$answer->description}</td>
                    </tr>

                    <tr>
                        <th>Correct</th>
                        <td>{$answer->correct}</td>
                    </tr>

                    <tr>
                        <th>Question ID</th>
                        <td>{$answer->question_id}</td>
                    </tr>


                    </tbody>

                </table>
            </div>
        </div>

        <div class="small-6 columns">
            <ul>
                <li><a href="{$BASE_URL}/../../pages/admin/admin-questions.php?user={$user->username}"
                       class="button medium">Questions</a></li>
                <li><a href="{$BASE_URL}/../../pages/admin/admin-answers.php?user={$user->username}"
                       class="button medium">Answers</a></li>
                <li><a href="{$BASE_URL}/../../pages/admin/admin-comments.php?user={$user->username}"
                       class="button medium">Comments</a></li>
            </ul>
        </div>
    </div>

</div>

{include file = 'common/footer.tpl'}
