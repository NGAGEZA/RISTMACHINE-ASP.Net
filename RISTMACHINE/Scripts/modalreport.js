$(document).ready(function () {
    var modalreport = new RModal(document.getElementById('modalreport'), {

    });

    document.getElementById('showModalreport').addEventListener("click", function (ev) {
        ev.preventDefault();
        modalreport.open();
    }, false);

    document.getElementById('btnrptclose').addEventListener("click", function (ev) {
        ev.preventDefault();
        modalreport.close();
    }, false);

    //window.modal = modalreport;
});