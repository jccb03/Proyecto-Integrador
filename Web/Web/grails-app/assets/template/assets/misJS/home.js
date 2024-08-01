let _id = 0;



function buscarTour() {
    let params = {
        nombre: $("#nombre").val()
    }

    $.post("/turismo-facil/general/buscarTours", params)
        .then((response) => {
            $("#resultado").html(response);
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











