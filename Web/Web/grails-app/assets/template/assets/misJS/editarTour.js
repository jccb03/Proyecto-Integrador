function editar_tour() {
    let params = {
        // asegúrate de que los valores se están extrayendo correctamente
        id: $("#id").val(),
        nombre: $("#nombre").val(),
        descripcion: $("#descripcion").val(),
        precio: $("#precio").val(),
        fecha: new Date($("#fecha").val()).getTime(),
        capacidad: $("#capacidad").val(),
        cupos: $("#cupos").val(),
    };

    // URL Completa
    var fullUrl = window.location.href;

    var url = new URL(fullUrl);

    // URL Sin parametros
    var urlWithoutParams = url.origin + url.pathname;

    $.post(urlWithoutParams + "/modificar_tour", params).then((response) => {
        if (response === "true") {
            Swal.fire({
                title: 'Éxito',
                text: 'Tour editado exitosamente',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "/turismo-facil/toursAdm/infoTour?id="+$("#id").val();
                }
            });
        } else {
            Swal.fire({
                title: 'Error',
                text: 'Error al registrar el tour.',
                confirmButtonText: 'OK'
            });
        }
    }).fail((error) => {
        console.log("Error: ", error);
        Swal.fire({
            title: 'Error',
            text: 'Error al conectar con el servidor.',
            confirmButtonText: 'OK'
        });
    });
}

function editar_tourinfo() {
    let params = {
        // asegúrate de que los valores se están extrayendo correctamente
        id: $("#id").val(),
        nombre: $("#nombre").val(),
        descripcion: $("#descripcion").val(),
        precio: $("#precio").val(),
        fecha: new Date($("#fecha").val()).getTime(),
        capacidad: $("#capacidad").val(),
        cupos: $("#cupos").val(),
    };

    // URL Completa
    var fullUrl = window.location.href;

    var url = new URL(fullUrl);

    // URL Sin parametros
    var urlWithoutParams = url.origin + url.pathname;

    $.post(urlWithoutParams + "/modificar_tour", params).then((response) => {
        if (response === "true") {
            Swal.fire({
                title: 'Éxito',
                text: 'Tour editado exitosamente',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "/turismo-facil/toursAdm/infoTour?id="+$("#id").val();
                }
            });
        } else {
            Swal.fire({
                title: 'Error',
                text: 'Error al registrar el tour.',
                confirmButtonText: 'OK'
            });
        }
    }).fail((error) => {
        console.log("Error: ", error);
        Swal.fire({
            title: 'Error',
            text: 'Error al conectar con el servidor.',
            confirmButtonText: 'OK'
        });
    });
}
