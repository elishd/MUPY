
////////////////////////////////////////////////////////////////////////////////
//VALIDACIONES 
////////////////////////////////////////////////////////////////////////////////
function Digitos(e, field) {
    var teclaPulsada = window.event ? window.event.keyCode : e.which;
    var valor = field.value;

    if (teclaPulsada == 08 || (teclaPulsada == 46 && valor.indexOf(".") == -1)) return true;

    return /\d/.test(String.fromCharCode(teclaPulsada));
}
//onkeypress = "return Digitos(event, this);"

function DigitosNegativos(e, field) {
    var teclaPulsada = window.event ? window.event.keyCode : e.which;
    var valor = field.value;

    if (teclaPulsada == 08 || (teclaPulsada == 46 && valor.indexOf(".") == -1) || (teclaPulsada == 45 && valor.indexOf("-") == -1)) return true;

    return /^-?\d/.test(String.fromCharCode(teclaPulsada));
}
//onkeypress = "return Digitos(event, this);"

function Numeros(e, field) {
    var teclaPulsada = window.event ? window.event.keyCode : e.which;
    var valor = field.value;

    if (teclaPulsada == 08) return true;

    return /\d/.test(String.fromCharCode(teclaPulsada));
}
//onkeypress = "return Numeros(event, this);"


function Letras(e, field) {
    var teclaPulsada = window.event ? window.event.keyCode : e.which;
    var valor = field.value;

    if (teclaPulsada == 08) return true;

    return /[A-Za-zÑÁÉÍÓÚñáéíóú\s]/.test(String.fromCharCode(teclaPulsada));
}
//onkeypress = "return Letras(event, this);"


////////////////////////////////////////////////////////////////////////////////
//PERMITE DAR FORMATO A UN VALOR TIPO FECHA
////////////////////////////////////////////////////////////////////////////////
function formatDate(text, format) {
    var dt;

    if (typeof (text) === 'undefined' || text === null)
        text = '';
    else {
        dt = new Date(parseInt(text.substr(6), 10));
        text = dt.format(format); //using 3rd party plugin "Date Format 1.2.3 by (c) 2007-2009 Steven Levithan <stevenlevithan.com>"   
    }
    return text;
}
//formatDate(e.data.record.Fecha, 'dd/mm/yyyy HH:MM:ss TT')



$(document).ready(function () {

    $(".currency").inputmask({ removeMaskOnSubmit: true, autoUnmask: true, alias: "numeric", prefix: "$ ", groupSeparator: ',', autoGroup: true, digits: 5, digitsOptional: false, placeholder: '0' });

    $(".select2-single").select2({
        language: "es",
        width: '100%'
    });

    $('input').attr('autocomplete', 'off');


    //Deficion de calendario
    $('.dpicker').datetimepicker({
        timepicker: false,
        format: 'Y-m-d'
    });

    $.datetimepicker.setLocale('es');


});




