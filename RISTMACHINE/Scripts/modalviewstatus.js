$(document).ready(function () {

    var modalviewstatus = new RModal(document.getElementById('modalviewstatus'), {

    });

    document.getElementById('showModalViewstatus').addEventListener("click", function (ev) {
        ev.preventDefault();
        modalviewstatus.open();
    }, false);

    document.getElementById('btnstatusclose').addEventListener("click", function (ev) {
        ev.preventDefault();
        modalviewstatus.close();
    }, false);
});