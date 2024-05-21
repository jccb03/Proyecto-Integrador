let _id = 0;
(function () {


})();

function agregar() {
    nuevo();
    $("#encabezado").text("Agregar usuario");
    $("#modalUsuario").modal("show");
}

function nuevo() {
    _id = 0;
    $("#username").val("")
    $("#nombre").val("")
    $("#clave").val("")
}

function salvar() {
    let params = {
        id: _id,
        username: $("#username").val(),
        nombre: $("#nombre").val(),
        password: $("#password").val(),
    }

    $.post(window.location + "/salvarUsuarios", params).then((data) => {
        if (data == "true") {
            alert("Usuario salvado");
            nuevo();
            $("#modalUsuario").modal("hide");
        } else {
            alert("No se pudo guardar");
        }

    }).fail((error) => {
        console.log(error)
    })


}

function editar(id) {
    $("#encabezado").text("Editar usuario")
    $("#modalUsuario").modal("show");

    let params = {
        id: id
    }
    $.post(window.location + "/getUsuarios", params).then((data) => {
        _id = data.ID;
        $("#username").val(data.USERNAME)
        $("#nombre").val(data.NOMBRE)
        $("#password").val(data.PASSWORD)
    }).fail((error) => {
        console.log(error)
    })
}

function borrar(id) {
    let params = {
        id: id
    };
    $.post(window.location + "/eliminarUsuarios", params)
        .then((data) => {
            if (data == "true") {
                alert("Usuario eliminado")
            } else {
                alert("No se pudo eliminar");
            }
        })
        .fail((error) => {
            console.log(error);
        });
    alert("Estamos borrando el usuario " + id);
}

