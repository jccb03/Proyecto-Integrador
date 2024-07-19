<%--
  Created by IntelliJ IDEA.
  User: pdl-1
  Date: 21/5/2024
  Time: 5:14 p. m.
--%>

<%@ page import="turismo.TReserva" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Login</title>
</head>
<body>
<div class="reservation-form">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="section-heading">
                                    <h2 class="text-white">Resultado de la busqueda</h2>

                                    <h3 class="text-info">"${busqueda}"</h3>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="items">
                                    <div class="row">
                                        <g:each in="${resultado}" var="tour" status="i">
                                            <div class="col-lg-12 tour mt-4 mb-4">
                                                <div class="item">
                                                    <div class="row">
                                                        <div class="col-lg-4 col-sm-5">
                                                            <div class="image">
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

                                                        <div class="col-lg-8 col-sm-7">
                                                            <div class="right-content">
                                                                <div class="row">
                                                                    <div class="col-lg-6">
                                                                        <h4 class="text-white">${tour.fNombre}</h4>
                                                                        <span>Republica Dominicana</span>
                                                                    </div>

                                                                    <div class="col-lg-6">
                                                                        <g:if test="${session.usuario}">
                                                                            <g:if test="${((turismo.TUsuarios) session.usuario).administrador == true}">
                                                                                <div class="border-button"><a
                                                                                        href="./editarTour?id=${tour.id}">Editar Tour</a>
                                                                                </div>
                                                                                <div class="border-button" onclick="borrarTour(${tour.id})"><a
                                                                                        >Eliminar Tour</a>
                                                                                </div>
                                                                            </g:if>
                                                                        </g:if>
                                                                    </div>

                                                                    <div class="col-lg-6">
                                                                        <g:if test="${session.usuario}">
                                                                            <g:if test="${((turismo.TUsuarios) session.usuario).administrador == false}">
                                                                                <div class="border-button"><a
                                                                                        href="./reservaTour?id=${tour.id}">Reservar Tour</a>
                                                                                </div>
                                                                            </g:if>
                                                                        </g:if>
                                                                    </div>
                                                                </div>

                                                                <p>${tour.fDescripcion}</p>
                                                                <ul class="info">
                                                                    <%
                                                                        List<turismo.TReserva> tReservaList =  turismo.TReserva.findAllByTourAndEstado(tour,false);
                                                                        int reservados = tReservaList.size()>0?tReservaList.sum {it.totalPersonas}:0;
                                                                    %>
                                                                    <li><i class="fa fa-user"></i> ${tour.fCupos} Cupos / ${reservados}  reservados / ${tour.fCupos - reservados} disponibles</li>
                                                                    <li><i class="fa fa-globe"></i> <g:formatDate format="dd/MM/yyyy"
                                                                                                                  date="${tour.fFecha}"/>
                                                                    </li>
                                                                    <li><i class="fa fa-home"></i> RD$${tour.fPrecio}</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </g:each>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</div>

<asset:javascript src="assets/misJS/reservaTour.js"/>
<asset:javascript src="assets/misJS/home.js"/>
</body>


</html>