let _id =0;w
function salvar_usuario() {
    let params = {
        id: _id,
        usuario: $("#usuario").val(),
        nombre: $("#nombre").val(),
        clave: $("#clave").val(),
    }

    $.post(window.location + "/salvar_usuario", params).then((data) => {
        if (data == "true") {
            alert("Usuario salvado");
           // nuevo();
           // $("#modalUsuario");
        } else {
            alert("No se pudo guardar");
        }

    }).fail((error) => {
        console.log(error)
    })


}

// function redirectARegistro() {
//     window.location.href = "/registrar_usuario";
// }