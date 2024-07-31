function salvar_oferta() {
    // Obtén los valores de los campos
    let descuento = $("#descuento").val();
    let tourId = $("#tourId").val();
    let descripcion = $("#descripcion").val();
    let cantidadCupos = $("#cantidadCupos").val();
    let ofertaId = $("#ofertaId").val();

    // Validar que el descuento esté en el rango permitido (1, 100)
    if (descuento <= 0 || descuento >= 100) {
        Swal.fire({
            title: 'Error',
            text: 'El porcentaje de descuento debe estar entre 1 y 100.',
            confirmButtonText: 'OK'
        });
        return; // Sale de la función si el descuento está fuera del rango
    }

    // Validar que todos los campos estén completos
    if (!tourId || !descripcion || !cantidadCupos || !descuento || !ofertaId) {
        Swal.fire({
            title: 'Campos incompletos',
            text: 'Por favor, completa todos los campos antes de enviar.',
            confirmButtonText: 'OK'
        });
        return; // Sale de la función si hay campos vacíos
    }

    let params = {
        tourId: tourId,
        descripcion: descripcion,
        cantidadCupos: cantidadCupos,
        descuento: descuento,
        id: ofertaId
    };

    var fullUrl = window.location.href;
    var url = new URL(fullUrl);
    var urlWithoutParams = url.origin + url.pathname;

    $.post("/turismo-facil/crearOferta/salvar_oferta", params)
        .then((response) => {
            if (response === "true") {
                Swal.fire({
                    title: 'Éxito',
                    text: 'Oferta modificada exitosamente',
                    confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.isConfirmed) {
                        var fullUrl = window.location.href;
                        var url = new URL(fullUrl);
                        if (url.search.includes("tour=1")) {
                            location.href = "/turismo-facil/toursAdm/infoTour?id=" + $('#tourId').val();
                        } else {
                            location.href = "/turismo-facil/ofertasAdm";
                        }
                    }
                });
            } else {
                Swal.fire({
                    title: 'Error',
                    text: 'Error al registrar la oferta.',
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
