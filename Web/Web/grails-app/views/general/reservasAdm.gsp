<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Reservas</title>
    <!-- Agregar estilos CSS y scripts JavaScript necesarios -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
<div class="reservation-form">
    <div class="container">
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
                            <th>Estado</th>
                            <th>Tour</th>
                            <th>Cliente</th>
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
                                <td>${reserva.estado ? 'Activa' : 'Inactiva'}</td>
                                <td>${reserva.tour.fNombre}</td>
                                <td>${reserva.usuarios.nombre}</td>
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
    </div>
</div>

<script>
    // Inicializar DataTable para la tabla de reservas
    $(document).ready(function() {
        var table = $('#reservas').DataTable();
                $('.dt-search').append(`
                    &nbsp;&nbsp;&nbsp;
                    <label for="dt-search-1">Tour:</label>
                    <select id="filter-select" class="dt-input">
                        <option value="">Todos los Tours</option>
                        <g:each in="${select}" var="tour" status="i">
                            <option value="${tour}">${tour}</option>
                        </g:each>
                    </select>
                `);

                 // Evento de cambio para el select
                $('#filter-select').on('change', function() {
                    var searchValue = $(this).val();
                    table.column(2).search(searchValue).draw();
                });

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

    // Función para editar una reserva (si es necesario)
    function editar_reserva(id) {
        // Implementar la lógica para editar la reserva según tu aplicación
        console.log('Editar reserva con ID:', id);
        // Aquí podrías redirigir a la página de edición de la reserva o mostrar un modal de edición
    }

    console.log("${reservasUnicas}");
</script>
</body>
</html>