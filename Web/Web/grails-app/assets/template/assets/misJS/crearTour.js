function salvar_tour() {
    // Obtén los valores de los campos
    let nombre = $("#nombre").val();
    let descripcion = $("#descripcion").val();
    let precio = $("#precio").val();
    let fecha = $("#fecha").val();
    let capacidad = $("#capacidad").val();
    let cupos = $("#cupos").val();

    // Validar que ninguno de los campos esté vacío
    if (!nombre || !descripcion || !precio || !fecha || !capacidad || !cupos) {
        Swal.fire({
            title: 'Campos incompletos',
            text: 'Por favor, completa todos los campos antes de enviar.',
            confirmButtonText: 'OK'
        });
        return; // Sale de la función si hay campos vacíos
    }

    // Asegúrate de que la fecha sea válida
    let fechaTimestamp = new Date(fecha).getTime();
    if (isNaN(fechaTimestamp)) {
        Swal.fire({
            title: 'Fecha inválida',
            text: 'Por favor, ingresa una fecha válida.',
            confirmButtonText: 'OK'
        });
        return;
    }

    let params = {
        nombre: nombre,
        descripcion: descripcion,
        precio: precio,
        fecha: fechaTimestamp,
        capacidad: capacidad,
        cupos: cupos,
    };

    $.post(window.location + "/salvar_tour", params)
        .then((response) => {
            if (response === "true") {
                Swal.fire({
                    title: 'Éxito',
                    text: 'Tour creado exitosamente',
                    confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.isConfirmed) {

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
        })
        .fail((error) => {
            console.log("Error: ", error);
            Swal.fire({
                title: 'Error',
                text: 'Error al conectar con el servidor.',
                confirmButtonText: 'OK'
            });
        });
}
