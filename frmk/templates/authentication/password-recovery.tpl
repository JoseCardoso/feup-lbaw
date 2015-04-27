{include file = 'common/header.tpl'}
</head>
<body>
{include file = 'common/navbar.tpl'}

<div class="row">
    <!-- sign up panel -->
    <div class="small-12 medium-8 large-6 small-centered columns">
        <div class="panel">
            <form action="actions.php?action=passwordRecovery" method="post" enctype="multipart/form-data" autocomplete="off">
                <h2 class="sign-up">Password Recovery</h2>
                <p>Enter your email address.</p>
                <div class="row">
                    <div class="small-12 columns">
                        <label>
                            <input name="email" type="email" placeholder="user@fe.up.pt" />
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="small-12 columns">
                        <button type="submit" class="button large expand">Request password recovery</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

{include file = 'common/footer.tpl'}
