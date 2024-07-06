let _id = 0;

function salvar_tour() {
    let params = {
        // asegúrate de que los valores se están extrayendo correctamente
        nombre: $("#nombre").val(),
        descripcion: $("#descripcion").val(),
        precio: $("#precio").val(),
        fecha: new Date($("#fecha").val()).getTime(),
        capacidad: $("#capacidad").val(),
        cupos: $("#cupos").val(),
    };

    $.post(window.location + "/salvar_tour", params).then((response) => {
        if (response === "true") {
            Swal.fire({
                title: 'Éxito',
                text: 'Tour creado exitosamente',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Redireccionar después de confirmar
                    location.href = "/turismo-facil/toursAdm";
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
