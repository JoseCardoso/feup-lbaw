$('#search').on('click', function() {



    var searchVal =  $('.search').val('');
    if(searchVal !== '') {


        $.getJSON('{$BASE_URL}/../../database/search.php?word=' + searchVal, function(returnData) {
            if (returnData.length == 0) {
                console.log(returnData);
            } else {
            }
        });
    } else {
        $('#results').html('<p>Enter a search term to start filtering.</p>');
    }

});