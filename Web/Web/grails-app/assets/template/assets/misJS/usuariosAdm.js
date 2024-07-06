function eliminar_usuario(_id, user){
    // Corrección: Usar ":" en lugar de "=" para inicializar propiedades del objeto
    params = {
        id: _id
    };

    Swal.fire({
      title: "Aviso",
      text: "¿En realidad desea eliminar el usuario?",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Aceptar"
    }).then((result) => {
      if (result.isConfirmed) {
        $.post(window.location + "/eliminar_usuario", params).then((response) => {
            if (response === "true") {
                Swal.fire({
                  title: "Eliminado!",
                  text: "El usuario fue eliminado correctamente.",
                }).then(() => {  // Corrección: cambiar los paréntesis por una función flecha
                    location.href = "./usuariosAdm";
                });
            } else {
                Swal.fire({
                  title: "Error",
                  text: "Error al registrar el usuario.",
                });
            }
        }).fail((error) => {
            Swal.fire({
              title: "Error",
              text: "Error al conectar con el servidor.",
            });
            console.log(error);
        });
      }
    });
}

function editar_usuario(id){
    location.href = window.location + '/editar_usuario?id=' + id;
}