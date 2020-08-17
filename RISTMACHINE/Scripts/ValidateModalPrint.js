//$(document).ready(function () {
//    $('#PrintForm').bootstrapValidator({
//        feedbackIcons: {
//            valid: 'glyphicon glyphicon-ok',
//            invalid: 'glyphicon glyphicon-remove',
//            validating: 'glyphicon glyphicon-refresh'
//        },
//        fields: {
//            pmcno: {
//                validators: {
//                    notEmpty: {
//                        message: 'The MC No. is required'
//                    }
//                }
//            }
//        }
//    });
//});



    $(document).ready(function () {
        $('[id*=btnprint]').on("click", function () {
            var validator = $('#PrintForm').data('bootstrapValidator');
            validator.validate();
            return validator.isValid();
        });
        ValidateForm();
    });

function ValidateForm() {
    debugger;
    $('#PrintForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            pmcno: {
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

//$(document).ready(function () {
//    $('[id*=btnedit]').on("click", function () {
//        var validator = $('#EditForm').data('bootstrapValidator');
//        validator.validate();
//        return validator.isValid();
//    });
//    ValidateForm2();
//});

//function ValidateForm2() {
//    $('#EditForm').bootstrapValidator({
//        message: 'This value is not valid',
//        feedbackIcons: {

//            valid: 'glyphicon glyphicon-ok',
//            invalid: 'glyphicon glyphicon-remove',
//            validating: 'glyphicon glyphicon-refresh'
//        },
//        fields: {
//            smcno: {
//                validators: {
//                    notEmpty: {
//                        message: 'The MC No. is required'
//                    },
//                    numeric: {
//                        message: 'The MC No. must be a number'
//                    },
//                    stringLength: {
//                        min: 3,
//                        max: 3,
//                        message: 'The Operator No. must be more than 3 and less than 3 characters long'
//                    }
//                }
//            }
//        }
//    });
//}

