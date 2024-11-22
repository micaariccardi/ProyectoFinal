﻿function ConfirmarDNI() {
    let mensajeA = document.getElementById("mensajeB");

    const dni = document.getElementById("Documento").value.trim();

    let longitudValida = false;

    // Validar longitud exacta de 8 caracteres
    if (dni.length === 8) {
        mensajeA.style.color = "green";
        longitudValida = true;
    } else {
        mensajeA.style.color = "red";
        longitudValida = false;
    }

    // Devolver true si todas las condiciones son verdaderas
    return longitudValida;
}

function ConfirmarMinimo(minimo) {
    let mensajeA = document.getElementById("mensajeC");

    const tel = document.getElementById("Telefono").value.trim();

    let longitudValida = false;

    // Validar longitud exacta de 8 caracteres
    if (tel.length >= minimo) {
        mensajeA.style.color = "green";
        longitudValida = true;
    } else {
        mensajeA.style.color = "red";
        longitudValida = false;
    }

    // Devolver true si todas las condiciones son verdaderas
    return longitudValida;
}

function validarSemanasGestacion() {
    const maximo = 50; // Definir el máximo de semanas de gestación permitido
    let mensajeA = document.getElementById("mensajeA");
    const semanas = document.getElementById("SemanasGestacion").value.trim();
    
    if (semanas === "") {
        mensajeA.style.color = "red";
        mensajeA.textContent = "Campo requerido";
        return;
    }

    // Validar si es un número válido y menor o igual al máximo
    if (!isNaN(semanas) && parseInt(semanas) <= maximo) {
        mensajeA.style.color = "green";
        mensajeA.textContent = "Semanas de gestación válidas";
    } else {
        mensajeA.style.color = "red";
        mensajeA.textContent = "La cantidad de semanas supera el máximo permitido";
    }
}

//subir muestra por partes
function saveParte1() {
    var data = $("#formParte1").serialize();
    localStorage.setItem('formParte1', data);
    $("#parte1").hide();
    $("#parte2").show();
    populateFormPart('formParte2');
}

function saveParte2() {
    var data = $("#formParte2").serialize();
    localStorage.setItem('formParte2', data);
    $("#parte2").hide();
    $("#parte3").show();
    populateFormPart('formParte3');
}

function saveParte3() {
    var data = $("#formParte3").serialize();
    localStorage.setItem('formParte3', data);
    $("#parte3").hide();
    $("#parte4").show();
    populateFormPart('formParte4');
}

function saveParte4() {
    var data = $("#formParte4").serialize();
    localStorage.setItem('formParte4', data);
    $("#parte4").hide();
    $("#parte5").show();
    populateFormPart('formParte5');
}

function saveParte5() {
    var data = $("#formParte5").serialize();
    localStorage.setItem('formParte5', data);
    $("#parte5").hide();
    $("#parte6").show();
    populateFormPart('formParte6');
}

function saveParte6() {
    var data = $("#formParte6").serialize();
    localStorage.setItem('formParte6', data);
    $("#parte6").hide();
    $("#parte7").show();
    populateFormPart('formParte7');
}

function goBack(part) {
    if (part === 1) {
        $("#parte1").show();
        $("#parte2").hide();
    } else if (part === 2) {
        $("#parte2").show();
        $("#parte3").hide();
        populateFormPart('formParte2');
    } else if (part === 3) {
        $("#parte3").show();
        $("#parte4").hide();
        populateFormPart('formParte3');
    } else if (part === 4) {
        $("#parte4").show();
        $("#parte5").hide();
        populateFormPart('formParte4');
    }
    else if (part === 5) {
        $("#parte4").show();
        $("#parte5").hide();
        populateFormPart('formParte5');
    }
    else if (part === 6) {
        $("#parte5").show();
        $("#parte6").hide();
        populateFormPart('formParte6');
    }
    

}

function populateFormPart(formulario) {
    var data = localStorage.getItem(formulario);

    const params = new URLSearchParams(data);
    // Convertir a un objeto
    const obj = {};
    params.forEach((value, key) => {
    obj[key] = decodeURIComponent(value); // Decodificar los valores
    });

    console.log(obj);
}
var ultimaMuestra = 0;
function submitForm() {
    var parte1Data = $("#formParte1").serializeArray();
    var parte2Data = $("#formParte2").serializeArray();
    var parte3Data = $("#formParte3").serializeArray();
    var parte4Data = $("#formParte4").serializeArray();
    var parte5Data = $("#formParte5").serializeArray();

    // Combina todos los datos en un solo objeto
    var convertToObj = function(dataArray) {
        var dataObject = {};
        dataArray.forEach(function(field) {
            dataObject[field.name] = field.value;
        });
        return dataObject;
    };

    var finalData = {
        parte1: convertToObj(parte1Data),
        parte2: convertToObj(parte2Data),
        parte3: convertToObj(parte3Data),
        parte4: convertToObj(parte4Data),
        parte5: convertToObj(parte5Data)
    };

    console.log(finalData);
    
    $.ajax({
        type: 'POST',
        url: '/Home/SaveMuestra',
        contentType: 'application/json',
        data: JSON.stringify(finalData),
        dataType: 'json',
        success: function(response) {
            alert('Datos guardados exitosamente');
            $("#parte6").css("display", "block");
            $("#parte6IdMuestra").val(response);
            console.log(response);
            ultimaMuestra = response
        },
        error: function(xhr, status, error) {
            console.error('Error al guardar datos:', error);
        }
    });
}   

function submitForm2() {
    var parte6Data = $("#formParte6").serializeArray();
    console.log( parte6Data);
    // Combina todos los datos en un solo objeto
    var convertToObj = function(dataArray) {
        var dataObject = {};
        dataArray.forEach(function(field) {
            dataObject[field.name] = field.value;
        });
        return dataObject;
    };

    /*var finalData = {
        idMuestra : ultimaMuestra,
        data: convertToObj(parte6Data)
    };*/

    var finalData = {
        idMuestra : ultimaMuestra,
        data: {FirmaSello: parte6Data[0]}
    };

    console.log("parte 6" );
    console.log( finalData);
    $.ajax({
        type: 'POST',
        url: '/Home/ActualizarMuestra',
        contentType: 'application/json',
        data: JSON.stringify(finalData),
        dataType: 'json',
        success: function(response) {
            alert('Datos guardados exitosamente');
        },
        error: function(xhr, status, error) {
            console.error('Error al guardar datos:', error);
        }
    });
}


document.addEventListener('DOMContentLoaded', () => {
    const form = document.querySelector('.formCrearPerfil');
    form.addEventListener('submit', manejarEnvio);
});

document.getElementById('nombreHospital').addEventListener('input', function() {
    const options = document.querySelectorAll('#datalistHospitalesMuestra option');
    options.forEach(option => {
        if (option.value === this.value) {
            document.getElementById('idHospital').value = option.getAttribute('data-id');
        }
    });
});



$('#exampleModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // Botón que disparó el modal
    var nombreHospital = button.data('nombre');
    var direccion = button.data('direccion');
    var localidad = button.data('localidad');
    var provincia = button.data('provincia');
    var servicio = button.data('servicio');
    var responsable = button.data('responsable');
    var telefono = button.data('telefono');
  
    // Asignar los datos al modal
    var modal = $(this);
    modal.find('#nombreHospital').text(nombreHospital);
    modal.find('#Direccion').text('Dirección: ' + direccion);
    modal.find('#Localidad').text('Localidad: ' + localidad);
    modal.find('#Provincia').text('Provincia: ' + provincia);
    modal.find('#Servicio').text('Servicio: ' + servicio);
    modal.find('#Responsable').text('Responsable: ' + responsable);
    modal.find('#Telefono').text('Teléfono: ' + telefono);
  });
  

const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
})


document.getElementById('addEmailBtn').addEventListener('click', function() {
    let emailIndex = document.querySelectorAll('#emailsContainer input').length;
    let newEmailInput = document.createElement('input');
    newEmailInput.type = 'email';
    newEmailInput.classList.add('form-control', 'mb-2');
    newEmailInput.name = `emails[${emailIndex}]`;
    newEmailInput.placeholder = `Email ${emailIndex + 1}`;
    newEmailInput.required = true;
    document.getElementById('emailsContainer').appendChild(newEmailInput);
});

document.getElementById('addReferenteBtn').addEventListener('click', function() {
    let referenteIndex = document.querySelectorAll('#referentesContainer input').length;
    let newReferenteInput = document.createElement('input');
    newReferenteInput.type = 'text';
    newReferenteInput.classList.add('form-control', 'mb-2');
    newReferenteInput.name = `referentes[${referenteIndex}]`;
    newReferenteInput.placeholder = `Referente ${referenteIndex + 1}`;
    newReferenteInput.required = true;
    document.getElementById('referentesContainer').appendChild(newReferenteInput);
});
