let _id =0;
function salvarReserva() {
    let params = {
        totalPersonas: $("#totalPersonas").val(),
        idcliente: $("#cliente").val(),
        // idfecha: $("#fechas").val(),
        idfecha: 1,
        idtour: idtour,
    };

    $.post(String(window.location).split("?")[0] + "/salvarReserva", params).then((response) => {
        if (response === "true") {
            alert("Reserva salvada exitosamente");
        } else {
            alert("Error al registrar el tour.");
        }
    }).fail((error) => {
        console.log("Error: ", error);
        alert("Error al conectar con el servidor.");
    });
}