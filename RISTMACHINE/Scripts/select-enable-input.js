$(document).ready(function() {
    var $selectImp11 = $("[id$='select_imp1_1']"),
        $tbImp11 = $("[id$='tb_imp1_1']");
       
    $selectImp11.change(function () {
        
        if ($selectImp11.val() === "2") {
            $tbImp11.removeAttr("disabled");
            $tbImp11.focus();
        } else {
            $tbImp11.attr("disabled", "disabled").val("");
           
        }
    }).trigger("change"); // added trigger to calculate initial state

    var $selectStr11 = $("[id$='select_str1_1']"),
        $tbStr11 = $("[id$='tb_str1_1']");

    $selectStr11.change(function () {

        if ($selectStr11.val() === "2") {
            $tbStr11.removeAttr("disabled");
            $tbStr11.focus();
        } else {
            $tbStr11.attr("disabled", "disabled").val("");

        }
    }).trigger("change"); // added trigger to calculate initial state
});