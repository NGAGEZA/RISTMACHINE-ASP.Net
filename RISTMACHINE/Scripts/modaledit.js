$(document).ready(function () {

    var modaledit = new RModal(document.getElementById('modaledit'), {

    });

    document.getElementById('showModaledit').addEventListener("click", function (ev) {
        ev.preventDefault();
        modaledit.open();
    }, false);

    document.getElementById('btneditclose').addEventListener("click", function (ev) {
        ev.preventDefault();
        modaledit.close();
    }, false);
    //window.modal = modaledit;
});