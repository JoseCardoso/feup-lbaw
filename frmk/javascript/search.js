$('.search').on('click', function() {



    var searchVal =  $('.search').val('');
    if(searchVal !== '') {
        $.getJSON('/../../db/search.php?word='+searchVal, function(returnData) {
            if (returnData.length == 0) {
                $('#results').html('<p>Search term entered does not return any data.</p>');
            } else {
                var htmlR = '<h1> Results: </h1> </br><ul>';
                for (var i = returnData.length - 1; i >= 0; i--) {
                    htmlR += '<li style="padding-left: 5px;">' +
                    "<a href=''/../../database/question.php?question='" + returnData[i] +'">' + returnData[i] + '</a>'
                    +'</li>';
                };
                $('#results').html(htmlR + '</ul>');
            }
        });
    } else {
        $('#results').html('<p>Enter a search term to start filtering.</p>');
    }

});