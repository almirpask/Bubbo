
$(document).ready(function(){
    var teste = ["Apple","Microsoft","Google"]
    $('input.autocomplete').autocomplete({
    source: teste });
})