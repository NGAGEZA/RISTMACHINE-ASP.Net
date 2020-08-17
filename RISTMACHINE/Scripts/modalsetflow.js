$(document).ready(function () {

    var modalsetflow = new RModal(document.getElementById('modalsetflow'), {

    });

    document.getElementById('showModalsetflow').addEventListener("click", function (ev) {
        ev.preventDefault();
        modalsetflow.open();
    }, false);
    
    document.getElementById('btnsetflowclose').addEventListener("click", function (ev) {
        ev.preventDefault();
        modalsetflow.close();
    }, false);

   
});
