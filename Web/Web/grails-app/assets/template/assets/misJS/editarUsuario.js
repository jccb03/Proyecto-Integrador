function salvar_usuario() {
    // Obtén los valores de los campos
    let id = $("#id").val();
    let nombre = $("#nombre").val();
    let apellido = $("#apellido").val();
    let correo = $("#correo").val();
    let telefono = $("#telefono").val();
    let usuario = $("#usuario").val();
    let cedula = $("#cedula").val();
    let clave = $("#clave").val();
    let administrador = $("#administrador").val() === "true"; // Convierte el valor del select a booleano
    let estado = $("#estado").is(":checked");


    if (!id || !nombre || !apellido || !correo || !telefono || !usuario || !cedula || !clave) {
        Swal.fire({
            title: 'Campos incompletos',
            text: 'Por favor, completa todos los campos antes de enviar.',
            confirmButtonText: 'OK'
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
                          $("#correo").focus();
                      });
            return;
        }

    // URL completa
    var fullUrl = window.location.href;
    var url = new URL(fullUrl);



    // URL sin parámetros
    var urlWithoutParams = url.origin + url.pathname;

    let params = {
        id: id,
        nombre: nombre,
        apellido: apellido,
        correo: correo,
        telefono: telefono,
        usuario: usuario,
        cedula: cedula,
        clave: clave,
        administrador: administrador,
        estado: estado
    };

    $.post(urlWithoutParams + "/modificar_usuario", params)
        .then((response) => {
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
        })
        .fail((error) => {
            console.log("Error: ", error);
            Swal.fire({
                title: 'Error',
                text: 'Error al conectar con el servidor.'
            });
        });
}
