// let _id = 0;
// (function () {
//
//
// })();
//
// function borrarTour(id) {
//     let confirmDelete = confirm("¿Estás seguro de que quieres eliminar este tour?");
//     if (confirmDelete) {
//         let params = {
//             id: id
//         };
//         $.post(window.location + "/eliminarTour", params)
//             .then((data) => {
//                 if (data == "true") {
//                     alert("Tour eliminado")
//                 } else {
//                     alert("No se pudo eliminar");
//                 }
//             })
//             .fail((error) => {
//                 console.log(error);
//             });
//         alert("Estamos borrando el tour " + id);
//     } else {
//         alert("Operación cancelada");
//     }
// }