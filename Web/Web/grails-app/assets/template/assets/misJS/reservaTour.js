let _id =0;
function salvarReserva() {
    let params = {
        totalPersonas: $("#totalPersonas").val(),
        idcliente: $("#clienteid").val(),
        // idfecha: $("#fechas").val(),
        idfecha: 1,
        idtour: idtour,
    };

    $.post(String(window.location).split("?")[0] + "/salvarReserva", params)
        .then((response) => {
            if (response === "true") {
                Swal.fire({
                    title: '¡Reserva salvada exitosamente! Se le redireccionará al inicio.',
                    showConfirmButton: false,
                    timer: 2500
                }).then((result) => {
                    // Redireccionar después de que se cierre la alerta
                    if (result.dismiss === Swal.DismissReason.timer) {
                        location.href = "/turismo-facil";
                    }
                })
            } else {
                Swal.fire({
                    title: 'Error al registrar el tour',
                    text: 'Hubo un problema al intentar salvar la reserva.',
                    confirmButtonText: 'Ok'
                });
            }
        })
        .fail((error) => {
            console.log("Error: ", error);
            Swal.fire({
                title: 'Error al conectar con el servidor',
                text: 'Hubo un problema al conectar con el servidor.',
                confirmButtonText: 'Ok'
            });
        });
}



function borrarTour(id) {
    let confirmDelete = confirm("¿Estás seguro de que quieres eliminar este tour?");
    if (confirmDelete) {
        let params = {
            id: id
        };
        $.post(window.location +"/eliminarTour", params)
            .then((data) => {
                if (data == "true") {
                    alert("Tour eliminado")
                } else {
                    alert("No se pudo eliminar");
                }
            })
            .fail((error) => {
                console.log(error);
            });
        alert("Estamos borrando el tour " + id);
    } else {
        alert("Operación cancelada");
    }
}
