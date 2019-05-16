$( "#commit" ).on( "click", function(event) {

    event.preventDefault();
    var str = $('#query').val();
    location.href = "https://www.chicago.gov/city/en/general/search_results.html#stq=" + str;

});

