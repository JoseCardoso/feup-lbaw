{include file = 'common/header.tpl'}

<style>
    li {
        list-style-type: none;
    }
</style>

</head>

<body>
{include file = 'admin/admin-navbar.tpl'}

<h1>Comments</h1>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Description</th>
        <th>Username</th>
        <th>Contribution</th>
    </tr>

    <tbody>
    <ul class="custom-list-class">
        {foreach $comments as $comment}
            <li>
                <tr>
                    <td>{$comment->id}</td>
                    <td>{$comment->description}</td>
                    <td>{$comment->username}</td>
                    <td>{$comment->contribution_id}</td>
                    <td><a href="#" class="button small">Details</a></td>
                    <td><a href="#" class="button small">Delete</a></td>
                </tr>
            </li>
        {/foreach}
    </ul>
</table>

{include file = 'common/footer.tpl'}
