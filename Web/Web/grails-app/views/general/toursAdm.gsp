<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Tours</title>
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
                <li class="navbar-brand text-white">
                   <h2 class="text text-white">Tours</h2>
                </li>

                  <ul class="nav nav-pills">
                      <li class="nav-item dropdown mb-3 d-flex" style="">
                          <a class="nav-link active my-2 my-sm-0" href="./crearTour">Nuevo Tour</a>
                      </li>
                      <li class="nav-item dropdown mb-3 d-flex" style="margin-left: 3px;">
                          <a class="nav-link active my-2 my-sm-0" href="./ofertasAdm">Ofertas</a>
                      </li>
                  </ul>
                </nav>

                <table id="reservas" class="table table-dark">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Precio</th>
                            <th>Fecha</th>
                            <th>Cupos</th>
                            <th>Cupos Reservados</th>
                            <th>Estado</th>
                            <th>Accion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${tours}" var="tour" status="i">
                            <tr>
                                <td>${tour.id}</td>
                                <td><a href="./toursAdm/infoTour?id=${tour.id}">${tour.fNombre}</a></td>
                                <g:if test="${tour.fDescripcion.toString().length() >= 50}">
                                    <td>${tour.fDescripcion.toString().substring(0, 50)}...</td>
                                </g:if>
                                <g:else>
                                    <td>${tour.fDescripcion.toString()}</td>
                                </g:else>
                                <td>${tour.fPrecio}</td>
                                <td><g:formatDate date="${tour.fFecha}" format="dd/MM/yyyy" /></td>
                                <td>${tour.fCupos}</td>
                                <td>${cuposreservados[i]}</td>
                                <td>${tour.estado ? 'Activo' : 'Inactivo'}</td>
                                <td>
                                 <button class="btn btn-danger" onclick="eliminar_tour(${tour.id})">
                                     <i class="fa fa-trash"></i>
                                 </button>
                                 <button class="btn btn-info" onclick="editar_tour(${tour.id})">
                                    <i class="fa fa-pencil"></i>
                                 </button>
                             </td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<%--<div class="container">
    <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="holder.js/780x500?theme=dark" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="holder.js/780x500?theme=dark" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="holder.js/780x500?theme=dark" class="d-block w-100" alt="...">
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
</div>--%>
<script>
    // Inicializar DataTable para la tabla de reservas
    $(document).ready(function() {
        $('#reservas').DataTable();
    });

    function eliminar_tour(id) {
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
                $.ajax({
                    type: 'POST',
                    url: '/eliminar_tour',
                    data: { id: id },
                    success: function(response) {
                        if (response === 'true') {
                            Swal.fire(
                                'Eliminado',
                                'El tour ha sido eliminado correctamente.',
                                'success'
                            );
                            location.reload();
                        } else {
                            Swal.fire(
                                'Error',
                                'Hubo un problema al eliminar el tour.',
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

    function editar_tour(id){
        location.href = "./toursAdm/infoTour/editarTourinfo?id="+id;
    }


</script>
</body>
</html>
