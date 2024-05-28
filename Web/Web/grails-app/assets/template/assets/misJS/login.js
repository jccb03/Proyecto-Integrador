function login() {

    let params = {
        usuario: $("#user").val(),
        clave: $("#clave").val()
    }
    if (params.usuario === "") {
        alert("Debe digitar el usuario");
        return;
    }
    if (params.password === "") {
        alert("Debe digitar el password");
        return;
    }
    $.post(window.location + "/iniciar_sesion", params).then((data) => {
        if (data === "true") {
            window.location.reload();
        } else {
            alert("Usuario incorrecto");
        }
    }).fail((error) => {
        console.log(error)
    })
}

function redirectARegistro() {
    window.location.href = "/registrar_usuario";
}