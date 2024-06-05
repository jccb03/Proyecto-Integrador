let _id =0;
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
            alert("Tour creado exitosamente");
        } else {
            alert("Error al registrar el tour.");
        }
    }).fail((error) => {
        console.log("Error: ", error);
        alert("Error al conectar con el servidor.");
    });
}