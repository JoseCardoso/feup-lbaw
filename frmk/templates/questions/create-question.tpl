{include file = 'common/header.tpl'}
</head>
<body>
{include file = 'common/navbar.tpl'}

<div class="row">
    <!-- create question  panel -->
    <div class="small-12 medium-8 large-6 small-centered columns">
        <div class="panel">
            <form id="sign-up" action="{$BASE_DIR}/actions/questions/create-question.php" method="post" enctype="multipart/form-data" autocomplete="off">
                <h2 class="sign-up">New Question</h2>
                <p>Already have an account? <a href="{$BASE_DIR}/pages/authentication/sign-in.php">Log In</a></p>

                <div class="row">
                    <div class="small-6 columns">
                        <label>First name
                            <input type="text" name="firstName" placeholder="First name"/>
                        </label>
                    </div>

                    <div class="small-6 columns">
                        <label>Last name
                            <input type="text" name="lastName" placeholder="Last name"/>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <label>E-mail
                            <input type="email" name="email" placeholder="user@fe.up.pt.com"/>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <label>City
                            <select name="cityName" form="sign-up">
                                <option class="hiddenDropdownItem" value="" selected>Choose a city</option>
                                {foreach from=$cities item=city key=name}
                                    <option value="{$city['nome']}">{$city['nome']}</option>
                                {/foreach}
                            </select>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <label>Username
                            <input type="text" name="username" placeholder="Insert Username"/>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <label>Password
                            <input type="password" name="password" placeholder="Insert Password"/>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="small-12 columns">
                        <label>Confirm Password
                            <input type="password" name="passwordConfirm" placeholder="Confirm Password"/>
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
                        <button type="submit" class="button large expand">Sign up</button>
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
