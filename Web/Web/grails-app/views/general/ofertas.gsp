<%--
  Created by IntelliJ IDEA.
  User: pdl-1
  Date: 21/5/2024
  Time: 5:14 p. m.
--%>

<html>
<head>
    <meta name="layout" content="main"/>
    <title>Ofertas</title>
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
                                    <h2 class="text-white">Ultimas Ofertas</h2>
                                </div>
                            </div>
                        </div>
                        <g:if test="${ofertas.isEmpty()}">
                        <h1 class="text text-white">
                            No hay ofertas disponibles actualmente...
                        </h1>
                        </g:if>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="items">
                                    <div class="row">
                                        <g:each in="${ofertas}" var="oferta" status="i">
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
                                                                        <h4 class="text-white">${oferta.descripcion} | ${oferta.tour.fNombre} | -${oferta.descuento}%</h4>
                                                                        <span>Republica Dominicana</span>
                                                                    </div>
                                                                    <p>${oferta.tour.fDescripcion}</p>

                                                                    <div class="col-lg-6">
                                                                        <g:if test="${session.usuario}">
                                                                            <g:if test="${((turismo.TUsuarios) session.usuario).administrador == false}">
                                                                                <div class="border-button"><a
                                                                                        href="./reservaTour?id=${oferta.tour.id}&ofertaId=${oferta.id}">Reservar Tour</a>
                                                                                </div>
                                                                            </g:if>
                                                                        </g:if>
                                                                    </div>
                                                                </div>
                                                                <br>
                                                                <h3 style="color: white; font-style: bold;">
                                                                    RD$ ${(oferta.tour.fPrecio - (oferta.tour.fPrecio * (oferta.descuento/100)))}
                                                                </h3>

                                                                <h3 style="color: white;">
                                                                   Antes: <span class="oferta-subrayado">RD$ ${oferta.tour.fPrecio}</span>
                                                                </h3>
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