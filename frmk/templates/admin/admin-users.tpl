{include file = 'common/header.tpl'}

<style>
    li {
        list-style-type: none;
    }
</style>

</head>

<body>
{include file = 'admin/admin-navbar.tpl'}

<h1>Users</h1>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Name</th>
    </tr>

    <tbody>
    <ul class="custom-list-class">
        {foreach $users as $user}
            <li>
                <tr>
                    <td>{$user->id}</td>
                    <td>{$user->username}</td>
                    <td>{$user->firstName} {$user->lastName}</td>
                    <td><a href="{$BASE_URL}/../../pages/admin/admin-questions.php?user={$user->username}" class="button small">Questions</a></td>
                    <td><a href="{$BASE_URL}/../../pages/admin/admin-answers.php?user={$user->username}" class="button small">Answers</a></td>
                    <td><a href="{$BASE_URL}/../../pages/admin/admin-comments.php?user={$user->username}" class="button small">Comments</a></td>
                    <td><a href="{$BASE_URL}/../../pages/admin/admin-user.php?user={$user->username}" class="button small">Details</a></td>
                    <td><a href="#" class="button small">Delete</a></td>
                </tr>
            </li>
        {/foreach}
    </ul>
</table>

{include file = 'common/footer.tpl'}
