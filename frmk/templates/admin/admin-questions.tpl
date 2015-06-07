{include file = 'common/header.tpl'}

<style>
    li {
        list-style-type: none;
    }
</style>

</head>

<body>
{include file = 'admin/admin-navbar.tpl'}

<h1>Questions</h1>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Text</th>
        <th>Username</th>
    </tr>

    <tbody>
    <ul class="custom-list-class">
        {foreach $questions as $question}
            <li>
                <tr>
                    <td>{$question->id}</td>
                    <td>{$question->text}</td>
                    <td><a href="#">{$question->username}</a></td>
                    <td><a href="#" class="button small">Details</a></td>
                    <td><a href="{$BASE_URL}/../../pages/admin/admin-answers.php?question_id={$question->id}" class="button small">Answers</a></td>
                    <td><a href="{$BASE_URL}/../../pages/admin/admin-comments.php?contribution_id={$question->id}" class="button small">Comments</a></td>
                    <td><a href="#" class="button small">Delete</a></td>
                </tr>
            </li>
        {/foreach}
    </ul>
</table>

{include file = 'common/footer.tpl'}