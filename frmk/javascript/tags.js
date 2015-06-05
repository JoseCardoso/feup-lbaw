
function onAddTag(tag) {
    alert("Added a tag: " + tag);
}
function onRemoveTag(tag) {
    alert("Removed a tag: " + tag);
}
function onChangeTag(input, tag) {
    alert("Changed a tag: " + tag);
}
$(function () {
    $('#tags').tagsInput({
        width: 'auto',
        onAddTag: function (elem, elem_tags) {
            var programmingLanguages = ['php','ruby','javascript', 'c', 'java', 'c#', 'objective-c', 'cpp', 'css'];
            var operatingSystems = ['android', 'ubuntu', 'linux', 'windows', 'ios', 'windows-phone'];

            $('.tag', elem_tags).each(function()
            {
                if($(this).text().search(new RegExp('\\b(' + programmingLanguages.join('|') + ')\\b')) >= 0)
                    $(this).css('background-color', 'blue');
                if($(this).text().search(new RegExp('\\b(' + operatingSystems.join('|') + ')\\b')) >= 0)
                    $(this).css('background-color', 'yellow');
            });
        },
        onChange: function (elem, elem_tags) {
            var programmingLanguages = ['php','ruby','javascript', 'c', 'java', 'c#', 'objective-c', 'cpp', 'css'];
            var operatingSystems = ['android', 'ubuntu', 'linux', 'windows', 'ios', 'windows-phone'];

            $('.tag', elem_tags).each(function()
            {
                if($(this).text().search(new RegExp('\\b(' + programmingLanguages.join('|') + ')\\b')) >= 0)
                    $(this).css('background-color', 'blue');
                if($(this).text().search(new RegExp('\\b(' + operatingSystems.join('|') + ')\\b')) >= 0)
                    $(this).css('background-color', 'yellow');
            });
        }
    });

// Uncomment this line to see the callback functions in action
//$('input.tags').tagsInput({onAddTag:onAddTag,onRemoveTag:onRemoveTag,onChange: onChangeTag});

// Uncomment this line to see an input with no interface for adding new tags.
//$('input.tags').tagsInput({interactive:false});

});
