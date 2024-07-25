<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Informacion de Tour</title>
    <style>
    .tour {
        display: none;
    }

    .tour.visible {
        display: block;
    }

    .page-numbers {
        display: flex;
        list-style-type: none;
        padding: 0;
    }

    .page-numbers li {
        margin: 0 5px;
    }

    .page-numbers li.active a {
        font-weight: bold;
    }
    </style>
</head>

<body>
<div class="reservation-form">
<div class="container mt-8">
    <div class="row">
        <div class="col-lg-8">
            <div class="section-heading">
                <div class="row">
                    <div class="col-lg-7">
                        <h2 class="text-white">${tour.fNombre}</h2>
                    </div>
                    <div class="col-lg-2">
                        <div class="border-button">
                            <a href="/turismo-facil/toursAdm">
                                Volver
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="border-button">
                            <a href="./infoTour/editarTourinfo?id=${tour.id}">
                                Editar Tour
                            </a>
                        </div>
                    </div>
                    <p>${tour.fDescripcion}</p>
                    <hr class="mt-3 mb-3" style="border: solid white;"/>
                    <h3 class="text text-white">Cupos: ${tour.fCupos} | Cupos Reservados: ${reservas.sum { it.totalPersonas }}</h3>
                    <hr class="mt-3 mb-3" style="border: solid white;"/>
                    <div style="display: flex;
                                justify-content: space-between;
                                align-content: center;
                                flex-direction: row;
                                align-items: center;
                                ">

                        <g:if test="${oferta == null}">
                            <h3 class="text text-white">Precio: RD$ ${tour.fPrecio}</h3>
                            <div class="border-button">
                                <a href="/turismo-facil/crearOferta?id=${tour.id}&tour=1">
                                    Crear Oferta
                                </a>
                            </div>

                    </div>
                        </g:if>
                        <g:else>
                            <h3 class="text text-white">Precio: <span class="oferta-text">RD$ ${tour.fPrecio-((oferta.descuento/100)*tour.fPrecio)}</span>
                            <span class="oferta-subrayado">${tour.fPrecio}</span></h3>
                            <div class="border-button">
                                <a href="/turismo-facil/editarOferta?id=${oferta.id}&tour=1">
                                    Editar Oferta
                                </a>
                            </div>

                    </div>
                                        <p>${oferta.descripcion} ${oferta.descuento % 1 == 0 ? oferta.descuento.toInteger() : oferta.descuento}% de descuento</p>

                        </g:else>

                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="container">
                <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                  <div class="carousel-inner">
                    <div class="carousel-item active">
                      <img src="holder.js/400x250?theme=dark" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                      <img src="holder.js/400x250?theme=dark" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                      <img src="holder.js/400x250?theme=dark" class="d-block w-100" alt="...">
                    </div>
                  </div>
                  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                  </button>
                  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                  </button>
                </div>
            </div>
        </div>
    </div>
                <div class="row">
                    <div class="col-lg-12">
                        <nav class="navbar bg-body-tertiary">
                            <ul class="nav nav-pills">
                                <li class="navbar-brand text-white">
                                    Reservas
                                </li>
                            </ul>
                            <%-- <ul class="nav nav-pills">
                                <li class="nav-item dropdown mb-3 d-flex">
                                    <a class="nav-link active dropdown-toggle my-2 my-sm-0" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Nueva</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="./nueva_reserva">Nueva Reserva</a></li>
                                    </ul>
                                </li>
                            </ul> --%>
                        </nav>
                         <%-- <div id="example_wrapper" class="dataTables_wrapper">
                                <div class="dataTables_filter">
                                    <label>
                                        Buscar:
                                        <input type="search" class="" placeholder="" aria-controls="example">
                                    </label>
                                    <select id="filter-select" class="form-select">
                                        <option value="">Todos los Tours</option>
                                        <g:each in="${select}" var="tour" status="i">
                                            <option value="${tour}">${tour}</option>
                                        </g:each>
                                    </select>
                                </div>
                            </div> --%>

                        <table id="reservas" class="table table-dark">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Cliente</th>
                                    <th>Telefono Cliente</th>
                                    <th>Cedula del CLiente</th>
                                    <th>Fecha</th>
                                    <th>Total Personas</th>
                                    <%--
                                        <th>Acción</th>
                                    --%>
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${reservas}" var="reserva" status="i">
                                    <tr>
                                        <td>${reserva.id}</td>
                                        <%-- <td>${reserva.estado ? 'Activa' : 'Inactiva'}</td> --%>
                                        <%-- <td>${reserva.tour.fNombre}</td> --%>
                                        <td>${reserva.usuarios.nombre} ${reserva.usuarios.apellido}</td>
                                        <td>${reserva.usuarios.telefono}</td>
                                        <td>${reserva.usuarios.cedula}</td>
                                        <td>
                                            <g:formatDate date="${new Date().parse('yyyy-MM-dd HH:mm:ss.S', reserva.tour.fFecha.toString())}" format="dd/MM/yyyy" />
                                        </td>
                                        <td>${reserva.totalPersonas}</td>
                                        <%-- <td>
                                            <button class="btn btn-danger" onclick="eliminar_reserva(${reserva.id})">
                                                <i class="fa fa-trash"></i>
                                            </button>
                                            <button class="btn btn-info" onclick="editar_reserva(${reserva.id})">
                                                <i class="fa fa-pencil"></i>
                                            </button>
                                        </td> --%>
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                    </div>
                </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="items">
                    <div class="row">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    // Inicializar DataTable para la tabla de reservas
    $(document).ready(function() {
        $('#reservas').DataTable();
    });

    // Función para eliminar una reserva
    function eliminar_reserva(id) {
        Swal.fire({
            title: '¿Estás seguro?',
            text: 'No podrás revertir esta acción.',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                // Aquí deberías implementar la lógica para eliminar la reserva con AJAX
                // Ejemplo de petición AJAX para eliminar la reserva
                $.ajax({
                    type: 'POST',
                    url: '/eliminar_reserva',
                    data: { id: id },
                    success: function(response) {
                        if (response === 'true') {
                            Swal.fire(
                                'Eliminado',
                                'La reserva ha sido eliminada correctamente.',
                                'success'
                            );
                            // Recargar la página o actualizar la tabla después de eliminar
                            location.reload();
                        } else {
                            Swal.fire(
                                'Error',
                                'Hubo un problema al eliminar la reserva.',
                                'error'
                            );
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error al eliminar reserva:', error);
                        Swal.fire(
                            'Error',
                            'Hubo un problema al conectar con el servidor.',
                            'error'
                        );
                    }
                });
            }
        });
    }

    console.log("${reservasUnicas}");



</script>
</body>
</html>