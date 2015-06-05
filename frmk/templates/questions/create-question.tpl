{include file = 'common/header.tpl'}
<link rel="stylesheet" href="{$CSS_PATH}askfeup/create-question.css"/>

<link rel="stylesheet" href="{$CSS_PATH}jQueryTagsInput/styles.css"/>
<script type="text/javascript" src="{$JS_PATH}tagsInput.js"></script>

<script type="text/javascript" src="{$JS_PATH}tags.js"></script>

</head>

<body>
{include file = 'common/navbar.tpl'}

<div class="row">
    <!-- create question  panel -->
    <div class="small-12 medium-12 large-24 small-centered columns">
        <div class="panel">
            <form id="create-question" action="{$BASE_URL}/../../actions/questions/create-question.php" method="post"
                  enctype="multipart/form-data" autocomplete="off">
                <h2 class="sign-up">New Question</h2>

                <div class="row ">
                    <div class="large-12 columns ">
                        <h5>Text
                            {if $field_missing['question_text']}
                                <label>{$field_missing['question_text']}</label>
                            {/if}
                            <textarea name="question" class="questionText"
                                      placeholder="Your Question">{$form_values['question']}</textarea>
                        </h5>
                    </div>
                </div>

                <div class="row ">
                    <div class="large-12 columns ">
                        <h5>Descripton
                            <textarea name="description" class="questionText"
                                      placeholder="The Description">{$form_values['description']}</textarea>
                        </h5>
                    </div>
                </div>

                <div class="row ">
                    <div class="large-12 columns ">
                        <h5>Tags
                            <input id="tags" type="text" class="tags" name="tags" value="{$form_values['tags']}">
                        </h5>
                    </div>
                </div>
                <div class="row">
                    <div class="small-12 columns">
                        <h5>Category
                            {if $field_missing['question_category']}
                                <label>{$field_missing['question_category']}</label>
                            {/if}
                            <select name="category" form="create-question">
                                <option class="hiddenDropdownItem" value="" selected>Choose a category</option>
                                {foreach $categories as $category}
                                    {if $category->id eq $form_values['category']}
                                        <option value="{$category->id}" selected>{$category->type}</option>
                                    {else}
                                        <option value="{$category->id}">{$category->type}</option>
                                    {/if}
                                {/foreach}
                            </select>
                        </h5>
                    </div>
                </div>


                <div class="row">
                    <div class="small-12 columns">
                        <button type="submit" class="button large">Post Question</button>
                    </div>
                </div>
            </form>


        </div>
    </div>
</div>

{include file = 'common/footer.tpl'}
