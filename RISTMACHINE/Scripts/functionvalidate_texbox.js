//check textbox validate blank border color red : 06/092018
function checkTextField1(field1) {
    if (field1.value === '') {
        bootbox.alert({
            title: "RIST MACHINE ALERT:",
            message: "Please Insert Maker..",
            size: 'large'
        });

        document.getElementById('<%= tb_maker.ClientID %>').style.border = "2px solid red";
    } else {
        document.getElementById('<%= tb_maker.ClientID %>').style.border = "";
    }
}
function checkTextField2(field2) {
    if (field2.value === '') {
        bootbox.alert({
            title: "RIST MACHINE ALERT:",
            message: "Please Insert Country..",
            size: 'large'
        });

        document.getElementById('<%= tb_country.ClientID %>').style.border = "2px solid red";
    } else {
        document.getElementById('<%= tb_country.ClientID %>').style.border = "";
    }
}