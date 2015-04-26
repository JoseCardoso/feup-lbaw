{include file = 'common/header.tpl'}
</head>
<body>
{include file = 'common/navbar.tpl'}

<div class="row">
    <!-- sign up panel -->
    <div class="small-12 medium-8 large-6 small-centered columns">
        <div class="panel">
            <form action="{$BASE_URL}actions/authentication/sign-up-php" method="post" enctype="multipart/form-data">
                <h2 class="sign-up">Password Recovery</h2>
                <p>Enter the validation code that you've received in your email adress.</p>
                <div class="row">
                    <div class="small-12 columns">
                        <label>
                            <input type="text" placeholder="Insert Validation Code" />
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="small-12 columns">
                        <a href="#" class="button large expand">Confirm code</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

{include file = 'common/footer.tpl'}
