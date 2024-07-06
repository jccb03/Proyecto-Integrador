<%--
  Created by IntelliJ IDEA.
  User: pdl-1
  Date: 21/5/2024
  Time: 5:14 p. m.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="main"/>
  <title>Editar Tour</title>
</head>
<body>
<div class="reservation-form">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <form id="reservation-form" name="gs" action="javascript:void(0);" method="post" role="search">
          <div class="row">
            <div class="col-lg-12">
              <h4>Editar Tour</h4>
            </div>
            <input type="text" name="id" class="id" id="id" autocomplete="" required value="${tour!=null?tour.id:0}" hidden>
            <div class="col-lg-6">
              <fieldset>
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" name="nombre" class="nombre" id="nombre" placeholder="nombre" autocomplete="on" required value="${tour!=null?tour.fNombre:''}">
              </fieldset>
            </div>
            <div class="col-lg-6">
              <fieldset>
                <label for="descripcion" class="form-label">Descripcion</label>
                <input type="text" name="descripcion" class="descripcion" id="descripcion" placeholder="descripcion" autocomplete="on" required value="${tour!=null?tour.fDescripcion:''}">
              </fieldset>
            </div>
            <div class="col-lg-6">
              <fieldset>
                <label for="precio" class="form-label">Precio</label>
                <input type="number" name="precio" class="precio" id="precio" placeholder="precio" autocomplete="on" required value="${tour!=null?tour.fPrecio:0.00}">
              </fieldset>
            </div>

            <div class="col-lg-6">
              <fieldset>
                <label for="fecha" class="form-label">Fecha</label>

                            <input type="date" name="fecha" class="fecha" id="fecha" placeholder="fecha" autocomplete="on" required value="<g:formatDate date="${tour!=null?tour.fFecha:new Date()}" format="yyyy-MM-dd"/>">

                </fieldset>
            </div>

            <div class="col-lg-6">
              <fieldset>
                <label for="capacidad" class="form-label">Capacidad</label>
                <input type="text" name="capacidad" class="capacidad" id="capacidad" placeholder="capacidad" autocomplete="on" required value="${tour!=null?tour.fCapacidad:0}">
              </fieldset>
            </div>

            <div class="col-lg-6">
              <fieldset>
                <label for="cupos" class="form-label">Cupos</label>
                <input type="text" name="cupos" class="cupos" id="cupos" placeholder="cupos" autocomplete="on" required value="${tour!=null?tour.fCupos:0}">
              </fieldset>
            </div>

            <div class="col-lg-12">
              <fieldset>
                <button class="main-button" type="button" onclick="editar_tourinfo()">Confirmar</button>
              </fieldset>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
%{--<asset:javascript src="assets/misJS/login.js"/>--}%
<asset:javascript src="assets/misJS/editarTour.js"/>
</body>
</html>