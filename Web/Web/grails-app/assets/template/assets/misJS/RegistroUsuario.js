let _id =0;
function salvar_usuario() {
    let params = {
        // asegúrate de que los valores se están extrayendo correctamente
        usuario: $("#usuario").val(),
        nombre: $("#nombre").val(),
        clave: $("#clave").val(),
        apellido: $("#apellido").val(),
        correo: $("#correo").val(),
        telefono: $("#telefono").val(),
        administrador: false,
        cedula: $("#cedula").val(),
        estado : true
    };

    $.post(window.location.pathname + "/salvar_usuario", params)
        .then((response) => {
            if (response === "true") {
                Swal.fire({
                    title: '¡Usuario registrado exitosamente!',
                    showConfirmButton: false,
                    timer: 1500
                }).then(() => {
                    location.href = "./turismo-facil"
                });
            } else {
                Swal.fire({
                    title: 'Error al registrar el usuario',
                    text: 'Hubo un problema al intentar registrar el usuario.',
                    confirmButtonText: 'Ok'
                });
            }
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

// function redirectARegistro() {
//     window.location.href = "/registrar_usuario";
// }