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
        <h1>{$answer->description}</h1>
    </div>
</div>

<div class="row">
    <div class="small-5 small-centered columns">
        <table class="small-12">
            <caption>Answer information</caption>
            <tbody>
            <tr>
                <th class="small-4 text-right">ID</th>
                <td class="small-8">{$answer->id}</td>
            </tr>
            <tr>
                <th class="text-right">Description</th>
                <td>{$answer->description}</td>
            </tr>
            <tr>
                <th class="text-right">Username</th>
                <td>{$answer->username}</td>
            </tr>
            <tr>
                <th class="text-right">Difference Votes</th>
                <td>{$answer->diffVotes}</td>
            </tr>
            <tr>
                <th class="text-right">Data</th>
                <td>{$answer->data}</td>
            </tr>
            <tr>
                <th class="text-right">Question ID</th>
                <td>{$answer->question_id}</td>
            </tr>
            <tr>
                <th class="text-right">Correct?</th>
                {if $answer->correct == 0}
                    <td>False</td>
                {else}
                    <td>True</td>
                {/if}
            </tr>

            </tbody>
        </table>
    </div>
</div>


public $username;
public $diffVotes;
public $data;
<div class="row">
    <div class="small-8 small-centered columns">
        <ul class="button-group even-4">
            <li>
                <a href="{$BASE_URL}/../../pages/admin/admin-questions.php?user={$user->username}" class="button">Questions</a>
            </li>
            <li>
                <a href="{$BASE_URL}/../../pages/admin/admin-answers.php?user={$user->username}"
                   class="button">Answers</a>
            </li>
            <li>
                <a href="{$BASE_URL}/../../pages/admin/admin-comments.php?user={$user->username}" class="button">Comments</a>
            </li>
            <li>
                <a href="#" class="button">Delete</a>
            </li>
        </ul>
    </div>
</div>

{include file = 'common/footer.tpl'}

