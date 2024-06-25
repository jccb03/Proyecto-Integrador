<%--
  Created by IntelliJ IDEA.
  User: pdl-1
  Date: 21/5/2024
  Time: 5:06 p. m.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Home</title>
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

<!-- ***** Main Banner Area Start ***** -->
<section id="section-1">
    <div class="content-slider">
        <input type="radio" id="banner1" class="sec-1-input" name="banner" checked>
        <input type="radio" id="banner2" class="sec-1-input" name="banner">
        <input type="radio" id="banner3" class="sec-1-input" name="banner">
        <input type="radio" id="banner4" class="sec-1-input" name="banner">
        <%
            def toursOrdenado = tours.sort { it.id }
            def primerosTours = toursOrdenado.take(6)
        %>
        <div class="slider">
            <g:each in="${primerosTours}" var="tour" status="i">
                <div id="top-banner-${tour.id}" class="banner">
                    <div class="banner-inner-wrapper header-text">
                        <div class="main-caption">
                            <g:if test="${tour.fDescripcion.toString().length() >= 50}">
                                <h2>${tour.fDescripcion.toString().substring(0, 50)}...</h2>
                            </g:if>
                            <g:else>
                                <h2>${tour.fDescripcion}</h2>
                            </g:else>
                            <h1>${tour.fNombre}</h1>

                            <div class="border-button"><a href="./reservaTour?id=${tour.id}">Ir</a></div>
                        </div>

                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="more-info">
                                        <div class="row">
                                            <div class="col-lg-3 col-sm-6 col-6">
                                                <i class="fa fa-user"></i>
                                                <h4><span>Capacidad:</span><br>${tour.fCapacidad}</h4>
                                            </div>

                                            <div class="col-lg-3 col-sm-6 col-6">
                                                <i class="fa fa-globe"></i>
                                                <h4><span>Fecha:</span><br><g:formatDate format="dd-MM-yyyy"
                                                                                         date="${tour.fFecha}"/><em></em>
                                                </h4>
                                            </div>

                                            <div class="col-lg-3 col-sm-6 col-6">
                                                <i class="fa fa-home"></i>
                                                <h4><span>Precio:</span><br>RD${tour.fPrecio}</h4>
                                            </div>

                                            <div class="col-lg-3 col-sm-6 col-6">
                                                %{--                                            <div class="main-button">--}%
                                                %{--                                                <a href="about.html"></a>--}%
                                                %{--                                            </div>--}%
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </g:each>
        </div>
        <nav>
            <div class="controls">
                <label for="banner1"><span class="progressbar"><span class="progressbar-fill"></span></span><span
                        class="text">1</span></label>
                <label for="banner2"><span class="progressbar"><span class="progressbar-fill"></span></span><span
                        class="text">2</span></label>
                <label for="banner3"><span class="progressbar"><span class="progressbar-fill"></span></span><span
                        class="text">3</span></label>
                <label for="banner4"><span class="progressbar"><span class="progressbar-fill"></span></span><span
                        class="text">4</span></label>
            </div>
        </nav>
    </div>
</section>
<!-- ***** Main Banner Area End ***** -->

<div class="visit-country" id="lista">
    <div class="container">
        <div class="row">
            <div class="col-lg-5">
                <div class="section-heading">
                    <h2 class="text-white">Visita uno de nuestros paisajes naturales</h2>

                    <p>Anímate a viajar con nosotros a hacer tour interno</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-8">
                <div class="items">
                    <div class="row">

                        <g:each in="${toursOrdenado}" var="tour" status="i">
                            <div class="col-lg-12 tour">
                                <div class="item">
                                    <div class="row">
                                        <div class="col-lg-4 col-sm-5">
                                            <div class="image">
                                                <img src="assets/images/country-01.jpg" alt="">
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
                                                    <li><i class="fa fa-user"></i> ${tour.fCupos} cupos</li>
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
                        <div class="col-lg-12">
                            <ul id="pagination" class="page-numbers">
                                <li id="prevButton"><a href=""><i class="fa fa-arrow-left"></i></a></li>

                                <div id="number-pages">

                                </div>
                                <li id="nextButton"><a href=""><i class="fa fa-arrow-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="side-bar-map">
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="map">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d12469.776493332698!2d-80.14036379941481!3d25.907788681148624!2m3!1f357.26927939317244!2f20.870722720054623!3f0!3m2!1i1024!2i768!4f35!3m3!1m2!1s0x88d9add4b4ac788f%3A0xe77469d09480fcdb!2sSunny%20Isles%20Beach!5e1!3m2!1sen!2sth!4v1642869952544!5m2!1sen!2sth"
                                        width="100%" height="550px" frameborder="0"
                                        style="border:0; border-radius: 23px; " allowfullscreen=""></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="call-to-action">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <h2>¿Estás buscando hacer excursiones locales?</h2>
                <h4>Haz una reservación con nosotros ya</h4>
            </div>

%{--            <div class="col-lg-4">--}%
%{--                <g:if test="${session.usuario}">--}%
%{--                    <g:if test="${((turismo.TUsuarios) session.usuario).administrador == false}">--}%
%{--                        <div class="border-button"><a--}%
%{--                                href="./reservaTour?id=${tour.id}">Reservar Tour</a>--}%
%{--                        </div>--}%
%{--                    </g:if>--}%
%{--                </g:if>--}%
%{--            </div>--}%

%{--            <div class="col-lg-4">--}%
%{--                <div class="border-button">--}%
%{--                    <a href="./reservaTour?id=${tour.id}">>Reserva ya</a>--}%
%{--                </div>--}%
%{--            </div>--}%
        </div>
    </div>
</div>
<asset:javascript src="assets/misJS/organizarTours.js"/>
<asset:javascript src="assets/misJS/reservaTour.js"/>
<asset:javascript src="assets/misJS/home.js"/>
</body>
</html>