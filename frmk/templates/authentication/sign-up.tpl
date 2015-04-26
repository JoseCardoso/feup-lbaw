{include file = 'common/header.tpl'}
</head>
<body>
{include file = 'common/navbar.tpl'}

<div class="row">
    <!-- sign up panel -->
    <div class="small-12 medium-8 large-6 small-centered columns">
        <div class="panel">
            <form action="{$BASE_URL}actions/authentication/sign-up-php" method="post" enctype="multipart/form-data">
                <h2 class="sign-up">Sign Up</h2>

                <p>Already have an account? <a href="?page=signIn">Log In</a></p>

                <div class="row">
                    <div class="small-12 columns">
                        <label>Username
                            <input type="text" placeholder="Insert Username"/>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <label>Password
                            <input type="password" placeholder="Insert Password"/>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <label>Confirm Password
                            <input type="password" placeholder="Confirm Password"/>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <label>E-mail
                            <input type="email" placeholder="user@gmail.com"/>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <label>City
                            <select>
                                <option class="selectPlaceholder" value="" disabled selected>Choose a city</option>
                                {foreach from=$cities item=zipCodes key=name}
                                <optgroup label="{$name}">
                                    {foreach from=$zipCodes item=zipCode}
                                        <option value="{$zipCode}">{$zipCode['codigopostal']}</option>
                                    {/foreach}
                                </optgroup>
                                {/foreach}

                            </select>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <p>By clicking Sign Up, you agree to our <a href="#" data-reveal-id="termsModal">Terms</a> and
                            that you have read our <a href="#">Data Policy</a>, including our <a href="#">Cookie Use</a>.
                        </p>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <a href="#" class="button large expand">Sign up</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div id="termsModal" class="reveal-modal small" data-reveal>
    <h2>Terms and Conditions</h2>

    <p>I am at least 13 years old.</p>
    <a class="close-reveal-modal">&#215;</a>
</div>

{include file = 'common/footer.tpl'}
