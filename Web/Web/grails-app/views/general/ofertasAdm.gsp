<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Ofertas</title>
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
                   <h2 class="text text-white">Ofertas</h2>
                </li>

                  <ul class="nav nav-pills">
                      <li class="nav-item dropdown mb-3 d-flex" style="">
                          <a class="nav-link active my-2 my-sm-0" href="./elegirTour">Nueva Oferta</a>
                      </li>
                  </ul>
                </nav>

                <table id="ofertas" class="table table-dark">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tour</th>
                            <th>Descripción</th>
                            <th>Descuento</th>
                            <th>Existencia</th>
                            <th>Costo sin Oferta</th>
                            <th>Costo Con Oferta</th>
                            <th>Accion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${ofertas}" var="oferta" status="i">
                            <tr>
                                <td>${oferta.id}</td>
                                <td><a href="./toursAdm/infoTour?id=${oferta.tour.id}">${oferta.tour.fNombre}</a></td>
                                <g:if test="${oferta.descripcion.toString().length() >= 50}">
                                    <td>${oferta.descripcion.toString().substring(0, 50)}...</td>
                                </g:if>
                                <g:else>
                                    <td>${oferta.descripcion.toString()}</td>
                                </g:else>
                                <td>${oferta.descuento}%</td>
                                <td>${oferta.cantidadCupos}</td>
                                <td>RD$${oferta.tour.fPrecio}</td>
                                <td>RD$${oferta.tour.fPrecio-((oferta.descuento/100)*oferta.tour.fPrecio)}</td>
                                <td>
                                     <button class="btn btn-danger" onclick="eliminar_oferta(${oferta.id})">
                                         <i class="fa fa-trash"></i>
                                     </button>

                                     <button class="btn btn-info" onclick="editar_oferta(${oferta.id})">
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
        $('#ofertas').DataTable();
    });

    function editar_oferta(id){
        location.href="/turismo-facil/editarOferta?id="+id;
    }

    // Función para eliminar una reserva
    function eliminar_oferta(id) {
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
                    url: '/turismo-facil/eliminarOferta',
                    data: { id: id },
                    success: function(response) {
                        if (response === 'true') {
                            Swal.fire(
                                'Eliminado',
                                'La oferta ha sido eliminada correctamente.',
                                'success'
                            );
                            // Recargar la página o actualizar la tabla después de eliminar
                            location.reload();
                        } else {
                            Swal.fire(
                                'Error',
                                'Hubo un problema al eliminar la oferta.',
                                'error'
                            );
                        }
                    },
                    error: function(xhr, status, error) {
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

    document.title = "Ofertas";

</script>
</body>
</html>
