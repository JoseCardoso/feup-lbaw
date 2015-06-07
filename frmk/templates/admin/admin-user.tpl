{include file = 'common/header.tpl'}

<style>
    li {
        list-style-type: none;
    }
</style>

</head>

<body>
{include file = 'admin/admin-navbar.tpl'}

<h1>{$user->firstName} {$user->lastName}</h1>

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
            <div class="user-info">
                <table>

                    <tbody>
                    <tr>
                        <th>ID</th>
                        <td>{$user->id}</td>
                    </tr>

                    <tr>
                        <th>Username</th>
                        <td>{$user->username}</td>
                    </tr>

                    <tr>
                        <th>Email</th>
                        <td>{$user->email}</td>
                    </tr>

                    <tr>
                        <th>Name</th>
                        <td>{$user->firstName} {$user->lastName}</td>
                    </tr>

                    <tr>
                        <th>Register date</th>
                        <td>{$user->register_at}</td>
                    </tr>

                    <tr>
                        <th>Last Login</th>
                        <td>{$user->lastLogin_at}</td>
                    </tr>
                    </tbody>

                </table>
            </div>
        </div>

        <div class="small-6 columns">
            <ul>
                <li><a href="{$BASE_URL}/../../pages/admin/admin-questions.php?user={$user->username}" class="button medium">Questions</a></li>
                <li><a href="{$BASE_URL}/../../pages/admin/admin-answers.php?user={$user->username}" class="button medium">Answers</a></li>
                <li><a href="{$BASE_URL}/../../pages/admin/admin-comments.php?user={$user->username}" class="button medium">Comments</a></li>
            </ul>
        </div>
    </div>

</div>

{include file = 'common/footer.tpl'}
