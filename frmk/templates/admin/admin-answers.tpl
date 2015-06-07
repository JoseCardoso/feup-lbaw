{include file = 'common/header.tpl'}

<style>
    li {
        list-style-type: none;
    }
</style>

</head>

<body>
{include file = 'admin/admin-navbar.tpl'}

<h1>Answers</h1>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Description</th>
        <th>Username</th>
    </tr>

    <tbody>
    <ul class="custom-list-class">
        {foreach $answers as $answer}
            <li>
                <tr>
                    <td>{$answer->id}</td>
                    <td>{$answer->description}</td>
                    <td><a href="{$BASE_URL}/../../pages/admin/admin-user.php?user={$answer->username}">{$answer->username}</a></td>
                    <td><a href="{$BASE_URL}/../../pages/admin/admin-question.php?id={$answer->question_id}" class="button small">Question</a></td>
                    <td><a href="{$BASE_URL}/../../pages/admin/admin-comments.php?contribution_id={$answer->id}" class="button small">Comments</a></td>
                    <td><a href="#" class="button small">Details</a></td>
                    <td><a href="#" class="button small">Delete</a></td>
                </tr>
            </li>
        {/foreach}
    </ul>
</table>

{include file = 'common/footer.tpl'}
