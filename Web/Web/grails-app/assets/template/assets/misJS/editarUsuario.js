function salvar_usuario() {
    let params = {
        id: $("#id").val(),
        nombre: $("#nombre").val(),
        apellido: $("#apellido").val(),
        correo: $("#correo").val(),
        telefono: $("#telefono").val(),
        usuario: $("#usuario").val(),
        cedula: $("#cedula").val(),
        clave: $("#clave").val(),
        administrador: $("#administrador").val() === "true", // Convierte el valor del select a booleano
        estado: $("#estado").is(":checked")
    };

    //URL Completa
    var fullUrl = window.location.href;

    var url = new URL(fullUrl);

    //URL Sin parametros
    var urlWithoutParams = url.origin + url.pathname;

    $.post(urlWithoutParams + "/modificar_usuario", params).then((response) => {
        if (response === "true") {
            Swal.fire({
                title: 'Usuario editado exitosamente',
                text: 'El usuario ha sido editado con éxito.'
            }).then(() => {
                window.location.href = '/turismo-facil/usuariosAdm';
            });
        } else {
            Swal.fire({
                title: 'Error',
                text: 'Hubo un error al registrar el usuario.'
            });
        }
    }).fail((error) => {
        console.log("Error: ", error);
        Swal.fire({
            title: 'Error',
            text: 'Error al conectar con el servidor.'
        });
    });
}
