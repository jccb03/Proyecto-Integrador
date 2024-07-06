let _id =0;
function salvar_usuario() {
    let params = {
        // asegúrate de que los valores se están extrayendo correctamente
        usuario: $("#usuario").val(),
        nombre: $("#nombre").val(),
        apellido: $("#apellido").val(),
        telefono: document.getElementById("telefono").value,
        correo: $("#correo").val(),
        clave: $("#clave").val(),
        cedula: $("#cedula").val(),
        administrador: true,
        estado : true
    };
    console.log(params)
    $.post(window.location.pathname + "/salvar_admin", params)
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
                    text: 'Hubo un problema al intentar registrar el usuario como administrador.',
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