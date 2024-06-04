// let _id = 0;
// (function () {
//
//
// })();
//
// function logout(id) {
//     let confirmDelete = confirm("¿Estás seguro de que desea salir?");
//     if (confirmDelete) {
//         // let params = {
//         //     id: id
//         // };
//         $.post(window.location + "/logout", params)
//             .then((data) => {
//                 if (data == "true") {
//                     alert("Saliendo")
//                 } else {
//                     alert("No se pudo salir");
//                 }
//             })
//             .fail((error) => {
//                 console.log(error);
//             });
//         alert("Estamos saliendo" );
//     } else {
//         alert("Operación cancelada");
//     }
// }