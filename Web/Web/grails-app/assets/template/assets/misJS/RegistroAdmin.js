let _id =0;
function salvar_usuario() {
    let params = {
        // asegúrate de que los valores se están extrayendo correctamente
        usuario: $("#usuario").val(),
        nombre: $("#nombre").val(),
        clave: $("#clave").val(),
        admin: $("#admin").val(),
    };

    $.post(window.location + "/salvar_admin", params).then((response) => {
        if (response === "true") {
            alert("Usuario registrado exitosamente.");
        } else {
            alert("Error al registrar el usuario.");
        }
    }).fail((error) => {
        console.log("Error: ", error);
        alert("Error al conectar con el servidor.");
    });
}

// function redirectARegistro() {
//     window.location.href = "/registrar_usuario";
// }