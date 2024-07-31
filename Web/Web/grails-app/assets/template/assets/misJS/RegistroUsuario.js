function salvar_usuario() {
    let usuario = $("#usuario").val();
    let nombre = $("#nombre").val();
    let clave = $("#clave").val();
    let apellido = $("#apellido").val();
    let correo = $("#correo").val();
    let telefono = $("#telefono").val();
    let cedula = $("#cedula").val();

    if (!usuario || !nombre || !clave || !apellido || !correo || !telefono || !cedula) {
        Swal.fire({
            title: 'Campos incompletos',
            text: 'Por favor, completa todos los campos antes de enviar.',
            confirmButtonText: 'Ok'
        });
        return;
    }

        let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(correo)) {
            Swal.fire({
                title: 'Correo inválido',
                text: 'El correo electrónico ingresado no es válido.',
                confirmButtonText: 'OK'
            }).then(() => {
                          $("#correo").focus(); // Hacer foco en el campo de correo
                      });
            return;
        }

    let params = {
        usuario: usuario,
        nombre: nombre,
        clave: clave,
        apellido: apellido,
        correo: correo,
        telefono: telefono,
        administrador: false,
        cedula: cedula,
        estado: true
    };

    $.post(window.location.pathname + "/salvar_usuario", params)
        .then((response) => {
            if (response === "true") {
                Swal.fire({
                    title: '¡Usuario registrado exitosamente!',
                    showConfirmButton: false,
                    timer: 1500
                }).then(() => {
                    location.href = "./turismo-facil";
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