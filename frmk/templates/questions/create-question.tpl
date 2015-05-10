{include file = 'common/header.tpl'}
<link rel="stylesheet" href="{$CSS_PATH}askfeup/create-question.css"/>
</head>

<body>
{include file = 'common/navbar.tpl'}

<div class="row">
    <!-- create question  panel -->
    <div class="small-12 medium-8 large-6 small-centered columns">
        <div class="panel">
            <form id="create-question" action="{$BASE_DIR}/actions/questions/create-question.php" method="post"
                  enctype="multipart/form-data" autocomplete="off">
                <h2 class="sign-up">New Question</h2>

                <div class="row ">
                    <div class="large-12 columns ">
                        <textarea name="question" class="questionText" placeholder="Your Question"></textarea>
                    </div>
                </div>

                <div class="row ">
                    <div class="large-12 columns ">
                        <textarea name="description" class="questionText" placeholder="The Description"></textarea>
                    </div>
                </div>

                <div class="row ">
                    <div class="large-12 columns ">
                        <textarea name="tags" placeholder="Tags"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="small-12 columns">
                        <label>Category
                            <select name="category" form="create-question">
                                <option class="hiddenDropdownItem" value="" selected>Choose a category</option>
                                {foreach from=$categories item=category key=name}
                                    <option value="{$category['nome']}">{$category['nome']}</option>
                                {/foreach}
                            </select>
                        </label>
                    </div>
                </div>


                <div class="row">
                    <div class="small-12 columns">
                        <a href="#" class="button large">Post Question</a>
                    </div>
                </div>
            </form>


        </div>
    </div>
</div>

{include file = 'common/footer.tpl'}
