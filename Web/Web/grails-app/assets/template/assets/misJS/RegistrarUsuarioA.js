let _id =0;
function salvar_usuario(admin) {
    let params = {
        // asegúrate de que los valores se están extrayendo correctamente
        usuario: $("#usuario").val(),
        nombre: $("#nombre").val(),
        clave: $("#clave").val(),
        apellido: $("#apellido").val(),
        correo: $("#correo").val(),
        cedula: $("#cedula").val(),
        telefono: $("#telefono").val(),
        administrador: false,
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
                    location.href = "./usuariosAdm";
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
console.log(admin)
}

// function redirectARegistro() {
//     window.location.href = "/registrar_usuario";
// }