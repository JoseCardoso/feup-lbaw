{include file = 'common/header.tpl'}
</head>
<body>
{include file = 'common/navbar.tpl'}

<div class="row">
    <!-- sign up panel -->
    <div class="small-12 medium-8 large-6 small-centered columns">
        <div class="panel">
            <h2 class="error">Error in Login</h2>

            <div class="row">
                <h3>Type of error</h3>

                <div class="small-12 columns">
                    <label>{$error}</label>
                </div>
            </div>


            <div class="row">
                <h3>Reason</h3>

                <div class="small-12 columns">
                    <label>{$error_reason}</label>
                </div>
            </div>

        </div>

        <div class="panel">
            <a href="{$BASE_URL}/../../pages/authentication/sign-in.php">Return to sign-in page</a>
        </div>
    </div>
</div>

    {include file = 'common/footer.tpl'}
