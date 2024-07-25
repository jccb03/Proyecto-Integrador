let _id = 0;


function salvar_oferta() {
if($("#descuento").val() < 100 && $("#descuento").val() > 0){
    let params = {
        // asegúrate de que los valores se están extrayendo correctamente
        tourId: $("#tourId").val(),
        descripcion: $("#descripcion").val(),
        cantidadCupos: $("#cantidadCupos").val(),
        descuento: $("#descuento").val(),
        id: $("#ofertaId").val()
    };

    var fullUrl = window.location.href;

    var url = new URL(fullUrl);

    // URL Sin parametros
    var urlWithoutParams = url.origin + url.pathname;


    $.post("/turismo-facil/crearOferta/salvar_oferta", params).then((response) => {
        if (response === "true") {
            Swal.fire({
                title: 'Éxito',
                text: 'Oferta modificada exitosamente',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    var fullUrl = window.location.href;
                    var url = new URL(fullUrl);
                    if(url.search.split('&')[1] === "tour=1"){
                        location.href = "/turismo-facil/toursAdm/infoTour?id="+$('#tourId').val();
                    }else{
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
    }).fail((error) => {
        console.log("Error: ", error);
        Swal.fire({
            title: 'Error',
            text: 'Error al conectar con el servidor.',
            confirmButtonText: 'OK'
        });
    });
    }else{
            Swal.fire({
                title: 'Error',
                text: 'El porsentaje de descuento sale del rango permitido (1, 100).',
                confirmButtonText: 'OK'
            });
        }
}
