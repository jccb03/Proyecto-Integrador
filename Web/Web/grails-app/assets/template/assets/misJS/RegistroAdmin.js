function salvar_usuario() {

    let usuario = $("#usuario").val();
    let nombre = $("#nombre").val();
    let apellido = $("#apellido").val();
    let telefono = document.getElementById("telefono").value;
    let correo = $("#correo").val();
    let clave = $("#clave").val();
    let cedula = $("#cedula").val();

    if (!usuario || !nombre || !apellido || !telefono || !correo || !clave || !cedula) {
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
        apellido: apellido,
        telefono: telefono,
        correo: correo,
        clave: clave,
        cedula: cedula,
        administrador: true,
        estado: true
    };

    console.log(params); // Para verificar que los parámetros se están enviando correctamente

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
