$(document).ready(function() {
   
    var $choice1 = $("[id*='choice1']"),
        $tbpb1 = $("[id*='tbpb1']"),
        $tbresp1 = $("[id*='tbresp1']"),
        $tbdt1 = $("[id*='tbdt1']");
    $choice1.change(function() {
        if ($choice1.val() === "2" || $choice1.val() === "3") {
            $tbpb1.removeAttr('disabled');
            $tbdt1.removeAttr('disabled');
            $tbresp1.removeAttr('disabled');
        } else {
            $tbpb1.attr('disabled', 'disabled').val('');
            $tbresp1.attr('disabled', 'disabled').val('');
            $tbdt1.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choice2 = $("[id*='choice2']"),
        $tbpb2 = $("[id*='tbpb2']"),
        $tbresp2 = $("[id*='tbresp2']"),
        $tbdt2 = $("[id*='tbdt2']");
    $choice2.change(function () {
        if ($choice2.val() === "2" || $choice2.val() === "3") {
            $tbpb2.removeAttr('disabled');
            $tbdt2.removeAttr('disabled');
            $tbresp2.removeAttr('disabled');
        } else {
            $tbpb2.attr('disabled', 'disabled').val('');
            $tbresp2.attr('disabled', 'disabled').val('');
            $tbdt2.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choice3 = $("[id*='choice3']"),
        $tbpb3 = $("[id*='tbpb3']"),
        $tbresp3 = $("[id*='tbresp3']"),
        $tbdt3 = $("[id*='tbdt3']");
    $choice3.change(function () {
        if ($choice3.val() === "2" || $choice3.val() === "3") {
            $tbpb3.removeAttr('disabled');
            $tbdt3.removeAttr('disabled');
            $tbresp3.removeAttr('disabled');
        } else {
            $tbpb3.attr('disabled', 'disabled').val('');
            $tbresp3.attr('disabled', 'disabled').val('');
            $tbdt3.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choice4 = $("[id*='choice4']"),
        $tbpb4 = $("[id*='tbpb4']"),
        $tbresp4 = $("[id*='tbresp4']"),
        $tbdt4 = $("[id*='tbdt4']");
    $choice4.change(function () {
        if ($choice4.val() === "2" || $choice4.val() === "3") {
            $tbpb4.removeAttr('disabled');
            $tbdt4.removeAttr('disabled');
            $tbresp4.removeAttr('disabled');
        } else {
            $tbpb4.attr('disabled', 'disabled').val('');
            $tbresp4.attr('disabled', 'disabled').val('');
            $tbdt4.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choice5 = $("[id*='choice5']"),
        $tbpb5 = $("[id*='tbpb5']"),
        $tbresp5 = $("[id*='tbresp5']"),
        $tbdt5 = $("[id*='tbdt5']");
    $choice5.change(function () {
        if ($choice5.val() === "2" || $choice5.val() === "3") {
            $tbpb5.removeAttr('disabled');
            $tbdt5.removeAttr('disabled');
            $tbresp5.removeAttr('disabled');
        } else {
            $tbpb5.attr('disabled', 'disabled').val('');
            $tbresp5.attr('disabled', 'disabled').val('');
            $tbdt5.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choice6= $("[id*='choice6']"),
        $tbpb6 = $("[id*='tbpb6']"),
        $tbresp6 = $("[id*='tbresp6']"),
        $tbdt6 = $("[id*='tbdt6']");
    $choice6.change(function () {
        if ($choice6.val() === "2" || $choice6.val() === "3") {
            $tbpb6.removeAttr('disabled');
            $tbdt6.removeAttr('disabled');
            $tbresp6.removeAttr('disabled');
        } else {
            $tbpb6.attr('disabled', 'disabled').val('');
            $tbresp6.attr('disabled', 'disabled').val('');
            $tbdt6.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choice7 = $("[id*='choice7']"),
        $tbpb7 = $("[id*='tbpb7']"),
        $tbresp7 = $("[id*='tbresp7']"),
        $tbdt7 = $("[id*='tbdt7']");
    $choice7.change(function () {
        if ($choice7.val() === "2" || $choice7.val() === "3") {
            $tbpb7.removeAttr('disabled');
            $tbdt7.removeAttr('disabled');
            $tbresp7.removeAttr('disabled');
        } else {
            $tbpb7.attr('disabled', 'disabled').val('');
            $tbresp7.attr('disabled', 'disabled').val('');
            $tbdt7.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choice8 = $("[id*='choice8']"),
        $tbpb8 = $("[id*='tbpb8']"),
        $tbresp8 = $("[id*='tbresp8']"),
        $tbdt8 = $("[id*='tbdt8']");
    $choice8.change(function () {
        if ($choice8.val() === "2" || $choice8.val() === "3") {
            $tbpb8.removeAttr('disabled');
            $tbdt8.removeAttr('disabled');
            $tbresp8.removeAttr('disabled');
        } else {
            $tbpb8.attr('disabled', 'disabled').val('');
            $tbresp8.attr('disabled', 'disabled').val('');
            $tbdt8.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choice9 = $("[id*='choice9']"),
        $tbpb9 = $("[id*='tbpb9']"),
        $tbresp9 = $("[id*='tbresp9']"),
        $tbdt9 = $("[id*='tbdt9']");
    $choice9.change(function () {
        if ($choice9.val() === "2" || $choice9.val() === "3") {
            $tbpb9.removeAttr('disabled');
            $tbdt9.removeAttr('disabled');
            $tbresp9.removeAttr('disabled');
        } else {
            $tbpb9.attr('disabled', 'disabled').val('');
            $tbresp9.attr('disabled', 'disabled').val('');
            $tbdt9.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicex10 = $("[id*='choicex10']"),
        $tbpbx10 = $("[id*='tbpbx10']"),
        $tbrespx10 = $("[id*='tbrespx10']"),
        $tbdtx10 = $("[id*='tbdtx10']");
    $choicex10.change(function () {
        if ($choicex10.val() === "2" || $choicex10.val() === "3") {
            $tbpbx10.removeAttr('disabled');
            $tbdtx10.removeAttr('disabled');
            $tbrespx10.removeAttr('disabled');
        } else {
            $tbpbx10.attr('disabled', 'disabled').val('');
            $tbrespx10.attr('disabled', 'disabled').val('');
            $tbdtx10.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicex11 = $("[id*='choicex11']"),
        $tbpbx11 = $("[id*='tbpbx11']"),
        $tbrespx11 = $("[id*='tbrespx11']"),
        $tbdtx11 = $("[id*='tbdtx11']");
    $choicex11.change(function () {
        if ($choicex11.val() === "2" || $choicex11.val() === "3") {
            $tbpbx11.removeAttr('disabled');
            $tbdtx11.removeAttr('disabled');
            $tbrespx11.removeAttr('disabled');
        } else {
            $tbpbx11.attr('disabled', 'disabled').val('');
            $tbrespx11.attr('disabled', 'disabled').val('');
            $tbdtx11.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choiceb12 = $("[id*='choiceb12']"),
        $tbpbb12 = $("[id*='tbpbb12']"),
        $tbrespb12 = $("[id*='tbrespb12']"),
        $tbdtb12 = $("[id*='tbdtb12']");
    $choiceb12.change(function () {
        if ($choiceb12.val() === "2" || $choiceb12.val() === "3") {
            $tbpbb12.removeAttr('disabled');
            $tbdtb12.removeAttr('disabled');
            $tbrespb12.removeAttr('disabled');
        } else {
            $tbpbb12.attr('disabled', 'disabled').val('');
            $tbrespb12.attr('disabled', 'disabled').val('');
            $tbdtb12.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicec13 = $("[id*='choicec13']"),
        $tbpbc13 = $("[id*='tbpbc13']"),
        $tbrespc13 = $("[id*='tbrespc13']"),
        $tbdtc13 = $("[id*='tbdtc13']");
    $choicec13.change(function () {
        if ($choicec13.val() === "2" || $choicec13.val() === "3") {
            $tbpbc13.removeAttr('disabled');
            $tbdtc13.removeAttr('disabled');
            $tbrespc13.removeAttr('disabled');
        } else {
            $tbpbc13.attr('disabled', 'disabled').val('');
            $tbrespc13.attr('disabled', 'disabled').val('');
            $tbdtc13.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choiced14 = $("[id*='choiced14']"),
        $tbpbd14 = $("[id*='tbpbd14']"),
        $tbrespd14 = $("[id*='tbrespd14']"),
        $tbdtd14 = $("[id*='tbdtd14']");
    $choiced14.change(function () {
        if ($choiced14.val() === "2" || $choiced14.val() === "3") {
            $tbpbd14.removeAttr('disabled');
            $tbdtd14.removeAttr('disabled');
            $tbrespd14.removeAttr('disabled');
        } else {
            $tbpbd14.attr('disabled', 'disabled').val('');
            $tbrespd14.attr('disabled', 'disabled').val('');
            $tbdtd14.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicee15 = $("[id*='choicee15']"),
        $tbpbe15 = $("[id*='tbpbe15']"),
        $tbrespe15 = $("[id*='tbrespe15']"),
        $tbdte15 = $("[id*='tbdte15']");
    $choicee15.change(function () {
        if ($choicee15.val() === "2" || $choicee15.val() === "3") {
            $tbpbe15.removeAttr('disabled');
            $tbdte15.removeAttr('disabled');
            $tbrespe15.removeAttr('disabled');
        } else {
            $tbpbe15.attr('disabled', 'disabled').val('');
            $tbrespe15.attr('disabled', 'disabled').val('');
            $tbdte15.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicef16 = $("[id*='choicef16']"),
        $tbpbf16 = $("[id*='tbpbf16']"),
        $tbrespf16 = $("[id*='tbrespf16']"),
        $tbdtf16 = $("[id*='tbdtf16']");
    $choicef16.change(function () {
        if ($choicef16.val() === "2" || $choicef16.val() === "3") {
            $tbpbf16.removeAttr('disabled');
            $tbdtf16.removeAttr('disabled');
            $tbrespf16.removeAttr('disabled');
        } else {
            $tbpbf16.attr('disabled', 'disabled').val('');
            $tbrespf16.attr('disabled', 'disabled').val('');
            $tbdtf16.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choiceg17 = $("[id*='choiceg17']"),
        $tbpbg17 = $("[id*='tbpbg17']"),
        $tbrespg17 = $("[id*='tbrespg17']"),
        $tbdtg17 = $("[id*='tbdtg17']");
    $choiceg17.change(function () {
        if ($choiceg17.val() === "2" || $choiceg17.val() === "3") {
            $tbpbg17.removeAttr('disabled');
            $tbdtg17.removeAttr('disabled');
            $tbrespg17.removeAttr('disabled');
        } else {
            $tbpbg17.attr('disabled', 'disabled').val('');
            $tbrespg17.attr('disabled', 'disabled').val('');
            $tbdtg17.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choiceh18 = $("[id*='choiceh18']"),
        $tbpbh18 = $("[id*='tbpbh18']"),
        $tbresph18 = $("[id*='tbresph18']"),
        $tbdth18 = $("[id*='tbdth18']");
    $choiceh18.change(function () {
        if ($choiceh18.val() === "2" || $choiceh18.val() === "3") {
            $tbpbh18.removeAttr('disabled');
            $tbdth18.removeAttr('disabled');
            $tbresph18.removeAttr('disabled');
        } else {
            $tbpbh18.attr('disabled', 'disabled').val('');
            $tbresph18.attr('disabled', 'disabled').val('');
            $tbdth18.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicei19 = $("[id*='choicei19']"),
        $tbpbi19 = $("[id*='tbpbi19']"),
        $tbrespi19 = $("[id*='tbrespi19']"),
        $tbdti19 = $("[id*='tbdti19']");
    $choicei19.change(function () {
        if ($choicei19.val() === "2" || $choicei19.val() === "3") {
            $tbpbi19.removeAttr('disabled');
            $tbdti19.removeAttr('disabled');
            $tbrespi19.removeAttr('disabled');
        } else {
            $tbpbi19.attr('disabled', 'disabled').val('');
            $tbrespi19.attr('disabled', 'disabled').val('');
            $tbdti19.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicej20 = $("[id*='choicej20']"),
        $tbpbj20 = $("[id*='tbpbj20']"),
        $tbrespj20 = $("[id*='tbrespj20']"),
        $tbdtj20 = $("[id*='tbdtj20']");
    $choicej20.change(function () {
        if ($choicej20.val() === "2" || $choicej20.val() === "3") {
            $tbpbj20.removeAttr('disabled');
            $tbdtj20.removeAttr('disabled');
            $tbrespj20.removeAttr('disabled');
        } else {
            $tbpbj20.attr('disabled', 'disabled').val('');
            $tbrespj20.attr('disabled', 'disabled').val('');
            $tbdtj20.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicek21 = $("[id*='choicek21']"),
        $tbpbk21 = $("[id*='tbpbk21']"),
        $tbrespk21 = $("[id*='tbrespk21']"),
        $tbdtk21 = $("[id*='tbdtk21']");
    $choicek21.change(function () {
        if ($choicek21.val() === "2" || $choicek21.val() === "3") {
            $tbpbk21.removeAttr('disabled');
            $tbdtk21.removeAttr('disabled');
            $tbrespk21.removeAttr('disabled');
        } else {
            $tbpbk21.attr('disabled', 'disabled').val('');
            $tbrespk21.attr('disabled', 'disabled').val('');
            $tbdtk21.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicel22 = $("[id*='choicel22']"),
        $tbpbl22 = $("[id*='tbpbl22']"),
        $tbrespl22 = $("[id*='tbrespl22']"),
        $tbdtl22 = $("[id*='tbdtl22']");
    $choicel22.change(function () {
        if ($choicel22.val() === "2" || $choicel22.val() === "3") {
            $tbpbl22.removeAttr('disabled');
            $tbdtl22.removeAttr('disabled');
            $tbrespl22.removeAttr('disabled');
        } else {
            $tbpbl22.attr('disabled', 'disabled').val('');
            $tbrespl22.attr('disabled', 'disabled').val('');
            $tbdtl22.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicem23 = $("[id*='choicem23']"),
        $tbpbm23 = $("[id*='tbpbm23']"),
        $tbrespm23 = $("[id*='tbrespm23']"),
        $tbdtm23 = $("[id*='tbdtm23']");
    $choicem23.change(function () {
        if ($choicem23.val() === "2" || $choicem23.val() === "3") {
            $tbpbm23.removeAttr('disabled');
            $tbdtm23.removeAttr('disabled');
            $tbrespm23.removeAttr('disabled');
        } else {
            $tbpbm23.attr('disabled', 'disabled').val('');
            $tbrespm23.attr('disabled', 'disabled').val('');
            $tbdtm23.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicen24 = $("[id*='choicen24']"),
        $tbpbn24 = $("[id*='tbpbn24']"),
        $tbrespn24 = $("[id*='tbrespn24']"),
        $tbdtn24 = $("[id*='tbdtn24']");
    $choicen24.change(function () {
        if ($choicen24.val() === "2" || $choicen24.val() === "3") {
            $tbpbn24.removeAttr('disabled');
            $tbdtn24.removeAttr('disabled');
            $tbrespn24.removeAttr('disabled');
        } else {
            $tbpbn24.attr('disabled', 'disabled').val('');
            $tbrespn24.attr('disabled', 'disabled').val('');
            $tbdtn24.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choiceo25 = $("[id*='choiceo25']"),
        $tbpbo25 = $("[id*='tbpbo25']"),
        $tbrespo25 = $("[id*='tbrespo25']"),
        $tbdto25 = $("[id*='tbdto25']");
    $choiceo25.change(function () {
        if ($choiceo25.val() === "2" || $choiceo25.val() === "3") {
            $tbpbo25.removeAttr('disabled');
            $tbdto25.removeAttr('disabled');
            $tbrespo25.removeAttr('disabled');
        } else {
            $tbpbo25.attr('disabled', 'disabled').val('');
            $tbrespo25.attr('disabled', 'disabled').val('');
            $tbdto25.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicep26 = $("[id*='choicep26']"),
        $tbpbp26 = $("[id*='tbpbp26']"),
        $tbrespp26 = $("[id*='tbrespp26']"),
        $tbdtp26 = $("[id*='tbdtp26']");
    $choicep26.change(function () {
        if ($choicep26.val() === "2" || $choicep26.val() === "3") {
            $tbpbp26.removeAttr('disabled');
            $tbdtp26.removeAttr('disabled');
            $tbrespp26.removeAttr('disabled');
        } else {
            $tbpbp26.attr('disabled', 'disabled').val('');
            $tbrespp26.attr('disabled', 'disabled').val('');
            $tbdtp26.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choiceq27 = $("[id*='choiceq27']"),
        $tbpbq27 = $("[id*='tbpbq27']"),
        $tbrespq27 = $("[id*='tbrespq27']"),
        $tbdtq27 = $("[id*='tbdtq27']");
    $choiceq27.change(function () {
        if ($choiceq27.val() === "2" || $choiceq27.val() === "3") {
            $tbpbq27.removeAttr('disabled');
            $tbdtq27.removeAttr('disabled');
            $tbrespq27.removeAttr('disabled');
        } else {
            $tbpbq27.attr('disabled', 'disabled').val('');
            $tbrespq27.attr('disabled', 'disabled').val('');
            $tbdtq27.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicer28 = $("[id*='choicer28']"),
        $tbpbr28 = $("[id*='tbpbr28']"),
        $tbrespr28 = $("[id*='tbrespr28']"),
        $tbdtr28 = $("[id*='tbdtr28']");
    $choicer28.change(function () {
        if ($choicer28.val() === "2" || $choicer28.val() === "3") {
            $tbpbr28.removeAttr('disabled');
            $tbdtr28.removeAttr('disabled');
            $tbrespr28.removeAttr('disabled');
        } else {
            $tbpbr28.attr('disabled', 'disabled').val('');
            $tbrespr28.attr('disabled', 'disabled').val('');
            $tbdtr28.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choices29 = $("[id*='choices29']"),
        $tbpbs29 = $("[id*='tbpbs29']"),
        $tbresps29 = $("[id*='tbresps29']"),
        $tbdts29 = $("[id*='tbdts29']");
    $choices29.change(function () {
        if ($choices29.val() === "2" || $choices29.val() === "3") {
            $tbpbs29.removeAttr('disabled');
            $tbdts29.removeAttr('disabled');
            $tbresps29.removeAttr('disabled');
        } else {
            $tbpbs29.attr('disabled', 'disabled').val('');
            $tbresps29.attr('disabled', 'disabled').val('');
            $tbdts29.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicet30 = $("[id*='choicet30']"),
        $tbpbt30 = $("[id*='tbpbt30']"),
        $tbrespt30 = $("[id*='tbrespt30']"),
        $tbdtt30 = $("[id*='tbdtt30']");
    $choicet30.change(function () {
        if ($choicet30.val() === "2" || $choicet30.val() === "3") {
            $tbpbt30.removeAttr('disabled');
            $tbdtt30.removeAttr('disabled');
            $tbrespt30.removeAttr('disabled');
        } else {
            $tbpbt30.attr('disabled', 'disabled').val('');
            $tbrespt30.attr('disabled', 'disabled').val('');
            $tbdtt30.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choiceu31 = $("[id*='choiceu31']"),
        $tbpbu31 = $("[id*='tbpbu31']"),
        $tbrespu31 = $("[id*='tbrespu31']"),
        $tbdtu31 = $("[id*='tbdtu31']");
    $choiceu31.change(function () {
        if ($choiceu31.val() === "2" || $choiceu31.val() === "3") {
            $tbpbu31.removeAttr('disabled');
            $tbdtu31.removeAttr('disabled');
            $tbrespu31.removeAttr('disabled');
        } else {
            $tbpbu31.attr('disabled', 'disabled').val('');
            $tbrespu31.attr('disabled', 'disabled').val('');
            $tbdtu31.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicev32 = $("[id*='choicev32']"),
        $tbpbv32 = $("[id*='tbpbv32']"),
        $tbrespv32 = $("[id*='tbrespv32']"),
        $tbdtv32 = $("[id*='tbdtv32']");
    $choicev32.change(function () {
        if ($choicev32.val() === "2" || $choicev32.val() === "3") {
            $tbpbv32.removeAttr('disabled');
            $tbdtv32.removeAttr('disabled');
            $tbrespv32.removeAttr('disabled');
        } else {
            $tbpbv32.attr('disabled', 'disabled').val('');
            $tbrespv32.attr('disabled', 'disabled').val('');
            $tbdtv32.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicew33 = $("[id*='choicew33']"),
        $tbpbw33 = $("[id*='tbpbw33']"),
        $tbrespw33 = $("[id*='tbrespw33']"),
        $tbdtw33 = $("[id*='tbdtw33']");
    $choicew33.change(function () {
        if ($choicew33.val() === "2" || $choicew33.val() === "3") {
            $tbpbw33.removeAttr('disabled');
            $tbdtw33.removeAttr('disabled');
            $tbrespw33.removeAttr('disabled');
        } else {
            $tbpbw33.attr('disabled', 'disabled').val('');
            $tbrespw33.attr('disabled', 'disabled').val('');
            $tbdtw33.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicex34 = $("[id*='choicex34']"),
        $tbpbx34 = $("[id*='tbpbx34']"),
        $tbrespx34 = $("[id*='tbrespx34']"),
        $tbdtx34 = $("[id*='tbdtx34']");
    $choicex34.change(function () {
        if ($choicex34.val() === "2" || $choicex34.val() === "3") {
            $tbpbx34.removeAttr('disabled');
            $tbdtx34.removeAttr('disabled');
            $tbrespx34.removeAttr('disabled');
        } else {
            $tbpbx34.attr('disabled', 'disabled').val('');
            $tbrespx34.attr('disabled', 'disabled').val('');
            $tbdtx34.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicey35 = $("[id*='choicey35']"),
        $tbpby35 = $("[id*='tbpby35']"),
        $tbrespy35 = $("[id*='tbrespy35']"),
        $tbdty35 = $("[id*='tbdty35']");
    $choicey35.change(function () {
        if ($choicey35.val() === "2" || $choicey35.val() === "3") {
            $tbpby35.removeAttr('disabled');
            $tbdty35.removeAttr('disabled');
            $tbrespy35.removeAttr('disabled');
        } else {
            $tbpby35.attr('disabled', 'disabled').val('');
            $tbrespy35.attr('disabled', 'disabled').val('');
            $tbdty35.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicez36 = $("[id*='choicez36']"),
        $tbpbz36 = $("[id*='tbpbz36']"),
        $tbrespz36 = $("[id*='tbrespz36']"),
        $tbdtz36 = $("[id*='tbdtz36']");
    $choicez36.change(function () {
        if ($choicez36.val() === "2" || $choicez36.val() === "3") {
            $tbpbz36.removeAttr('disabled');
            $tbdtz36.removeAttr('disabled');
            $tbrespz36.removeAttr('disabled');
        } else {
            $tbpbz36.attr('disabled', 'disabled').val('');
            $tbrespz36.attr('disabled', 'disabled').val('');
            $tbdtz36.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choiceza37 = $("[id*='choiceza37']"),
        $tbpbza37 = $("[id*='tbpbza37']"),
        $tbrespza37 = $("[id*='tbrespza37']"),
        $tbdtza37 = $("[id*='tbdtza37']");
    $choiceza37.change(function () {
        if ($choiceza37.val() === "2" || $choiceza37.val() === "3") {
            $tbpbza37.removeAttr('disabled');
            $tbdtza37.removeAttr('disabled');
            $tbrespza37.removeAttr('disabled');
        } else {
            $tbpbza37.attr('disabled', 'disabled').val('');
            $tbrespza37.attr('disabled', 'disabled').val('');
            $tbdtza37.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicezx38 = $("[id*='choicezx38']"),
        $tbpbzx38 = $("[id*='tbpbzx38']"),
        $tbrespzx38 = $("[id*='tbrespzx38']"),
        $tbdtzx38 = $("[id*='tbdtzx38']");
    $choicezx38.change(function () {
        if ($choicezx38.val() === "2" || $choicezx38.val() === "3") {
            $tbpbzx38.removeAttr('disabled');
            $tbdtzx38.removeAttr('disabled');
            $tbrespzx38.removeAttr('disabled');
        } else {
            $tbpbzx38.attr('disabled', 'disabled').val('');
            $tbrespzx38.attr('disabled', 'disabled').val('');
            $tbdtzx38.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicezc39 = $("[id*='choicezc39']"),
        $tbpbzc39 = $("[id*='tbpbzc39']"),
        $tbrespzc39 = $("[id*='tbrespzc39']"),
        $tbdtzc39 = $("[id*='tbdtzc39']");
    $choicezc39.change(function () {
        if ($choicezc39.val() === "2" || $choicezc39.val() === "3") {
            $tbpbzc39.removeAttr('disabled');
            $tbdtzc39.removeAttr('disabled');
            $tbrespzc39.removeAttr('disabled');
        } else {
            $tbpbzc39.attr('disabled', 'disabled').val('');
            $tbrespzc39.attr('disabled', 'disabled').val('');
            $tbdtzc39.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicezv40 = $("[id*='choicezv40']"),
        $tbpbzv40 = $("[id*='tbpbzv40']"),
        $tbrespzv40 = $("[id*='tbrespzv40']"),
        $tbdtzv40 = $("[id*='tbdtzv40']");
    $choicezv40.change(function () {
        if ($choicezv40.val() === "2" || $choicezv40.val() === "3") {
            $tbpbzv40.removeAttr('disabled');
            $tbdtzv40.removeAttr('disabled');
            $tbrespzv40.removeAttr('disabled');
        } else {
            $tbpbzv40.attr('disabled', 'disabled').val('');
            $tbrespzv40.attr('disabled', 'disabled').val('');
            $tbdtzv40.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state

    //**********************//

    var $choicezs41 = $("[id*='choicezs41']"),
        $tbpbzs41 = $("[id*='tbpbzs41']"),
        $tbrespzs41 = $("[id*='tbrespzs41']"),
        $tbdtzs41 = $("[id*='tbdtzs41']");
    $choicezs41.change(function () {
        if ($choicezs41.val() === "2" || $choicezs41.val() === "3") {
            $tbpbzs41.removeAttr('disabled');
            $tbdtzs41.removeAttr('disabled');
            $tbrespzs41.removeAttr('disabled');
        } else {
            $tbpbzs41.attr('disabled', 'disabled').val('');
            $tbrespzs41.attr('disabled', 'disabled').val('');
            $tbdtzs41.attr('disabled', 'disabled').val('');
        }
    }).trigger('change'); // added trigger to calculate initial state
});