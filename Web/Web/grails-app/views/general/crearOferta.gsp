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
  <title>Creacion de Tour</title>
</head>
<body>
<div class="reservation-form">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <form id="reservation-form" name="gs" action="javascript:void(0);" method="post" role="search">
          <div class="row">
            <div class="col-lg-12">
              <h4>Creacion de Oferta</h4>
            </div>

            <div class="col-lg-6">
              <fieldset>
                <label for="nombre" class="form-label">Tour Nombre</label>
                <input type="text" name="tour" class="tour" id="tour" placeholder="Tour" autocomplete="on" required value="${tour.fNombre}" readonly>
                <input type="text" name="tourId" class="tourId" id="tourId" hidden placeholder="Tour" autocomplete="on" required value="${tour.id}">
                <input type="text" name="ofertaId" class="ofertaId" id="ofertaId" hidden placeholder="Tour" autocomplete="on" required value="0">
              </fieldset>
            </div>

            <div class="col-lg-6">
              <fieldset>
                <label for="nombre" class="form-label">Descripcion de Oferta</label>
                <input type="text" name="descripcion" class="descripcion" id="descripcion" placeholder="Descripcion" autocomplete="on" required value="">
              </fieldset>
            </div>

            <div class="col-lg-6">
              <fieldset>
                <label for="nombre" class="form-label">Cantidad Cupos</label>
                <input type="number" name="cupos" class="cupos" id="cantidadCupos" placeholder="Cantidad de Cupos" autocomplete="on" required value="">
              </fieldset>
            </div>

            <div class="col-lg-6">
              <fieldset>
                <label for="nombre" class="form-label">Descuento %</label>
                <input type="number" name="descuento" class="descuento" id="descuento" placeholder="100" autocomplete="on" required value="">
              </fieldset>
            </div>

            <div class="col-lg-12">
              <fieldset>
                <button class="main-button" type="button" onclick="salvar_oferta()">Confirmar</button>
              </fieldset>
            </div>


          </div>
        </form>
      </div>
    </div>
  </div>
</div>
%{--<asset:javascript src="assets/misJS/login.js"/>--}%
<asset:javascript src="assets/misJS/crearOferta.js"/>
</body>
</html>