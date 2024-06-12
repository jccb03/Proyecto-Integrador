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

    //URL Completa
    var fullUrl = window.location.href;

    var url = new URL(fullUrl);

    //URL Sin parametros
    var urlWithoutParams = url.origin + url.pathname;

    $.post(urlWithoutParams + "/modificar_tour", params).then((response) => {
        if (response === "true") {
            alert("Tour editado exitosamente");
        } else {
            alert("Error al registrar el tour.");
        }
    }).fail((error) => {
        console.log("Error: ", error);
        alert("Error al conectar con el servidor.");
    });
}