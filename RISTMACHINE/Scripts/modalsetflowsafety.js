$(document).ready(function () {

    var modalsetflowsafety = new RModal(document.getElementById('modalsetflowsafety'), {

    });

    document.getElementById('showModalsetflowsafety').addEventListener("click", function (ev) {
        ev.preventDefault();
        modalsetflowsafety.open();
    }, false);

    document.getElementById('btnsetflowsafetyclose').addEventListener("click", function (ev) {
        ev.preventDefault();
        modalsetflowsafety.close();
    }, false);


});