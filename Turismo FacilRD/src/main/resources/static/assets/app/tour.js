let _id = 0;
(function () {


})();

function agregar() {
    nuevo();
    $("#encabezado").text("Crear tour");
    $("#modalTour").modal("show");
}

function nuevo() {
    _id = 0;
    $("#nombre").val("")
    $("#descripcion").val("")
    $("#agencia").val("")
    $("#fecha").val("")
}


function editar(id) {
    $("#modalTour").modal("show");
    $("#encabezado").text("Editar tour");


    let params = {
        id: id
    }
    $.post(window.location + "/conseguirTour", params).then((data) => {
        _id = data.ID;
        $("#nombre").val(data.NOMBRE)
        $("#descripcion").val(data.DESCRIPCION)
        $("#agencia").val(data.AGENCIA)
        $("#fecha").val(data.AGENCIA)
    }).fail((error) => {
        console.log(error)
    })
}

function salvar() {
    let params = {
        id: _id,
        nombre: $("#nombre").val(),
        descripcion: $("#descripcion").val(),
        agencia: $("#agencia").val(),
        fecha: $("#fecha").val(),
    }

    $.post(window.location + "/salvarTour", params).then((data) => {
        if (data == "true") {
            alert("Tour salvado");
            nuevo();
            $("#modalTour").modal("hide");
        } else {
            alert("No se pudo salvar");
        }


    }).fail((error) => {
        console.log(error)
    })
}


function borrar(id) {
    let confirmDelete = confirm("¿Estás seguro de que quieres eliminar este tour?");
    if (confirmDelete) {
        let params = {
            id: id
        };
        $.post(window.location + "/eliminarTour", params)
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

