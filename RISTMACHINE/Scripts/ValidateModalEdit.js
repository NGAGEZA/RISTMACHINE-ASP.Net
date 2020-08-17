$(document).ready(function () {
    $('[id*=btnedit]').on("click", function () {
        var validator2 = $('#SearchForm').data('bootstrapValidator');
        validator2.validate();
        return validator2.isValid();
    });
    ValidateForm2();
});

function ValidateForm2() {
    debugger;
    $('#SearchForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            smcno: {
                validators: {
                    notEmpty: {
                        message: 'The MC No. is required'
                    },
                    numeric: {
                        message: 'The MC No. must be a number'
                    },
                    stringLength: {
                        min: 3,
                        max: 3,
                        message: 'The Operator No. must be more than 3 and less than 3 characters long'
                    }
                }
            }
        }
    });
}
