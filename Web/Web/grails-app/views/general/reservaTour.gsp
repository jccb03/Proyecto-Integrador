<%--
  Created by IntelliJ IDEA.
  User: Justin
  Date: 20/6/2024
  Time: 7:19 p. m.
--%>

<%@ page import="turismo.TUsuarios" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta name="layout" content="main"/>
    <title>Reservar Tour</title>
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Formulario de Reserva</title>
</head>

<body>
<div class="reservation-form">
    <div class="container">
        <h1 style="color: white">Formulario de Reserva</h1>

        <form>
            <div class="row">
                <div class="col-4">
                    <div class="form-group">
                        <label for="cliente">Cliente:</label>
                        <input type="text" class="form-control" id="cliente" disabled
                               value="${((turismo.TUsuarios) session.usuario).nombre}" placeholder="Nombre del cliente">
                    </div>
                </div>

                <div class="col-4">
                    <div class="form-group">
                        <label for="tour">Tour:</label>
                        <input type="text" class="form-control" id="tour" disabled value="${tour?.fNombre}"
                               placeholder="Tour">

                        %{--          <select type="text" class="form-control" id="tours" >--}%
                        %{--            <g:each in="${tTourList}">--}%
                        %{--              <option value="${it.id}">${it.fNombre}</option>--}%
                        %{--            </g:each>--}%
                        %{--            <option value="${tTour.id}">${tour.fNombre}</option>--}%
                        %{--             // required value="${tour!=null?tour.fCapacidad:0}"--}%
                        %{--          </select>--}%
                    </div>

                </div>

                <div class="col-4">
                    <div class="form-group">
                        <label for="fechas">Fecha:</label>
                        <input type="text" class="form-control" disabled
                               value="${tour ? simpleDateFormat.format(tour.fFecha) : ""}" id="fechas">
                    </div>
                </div>

                <div class="col-2">
                    <div class="form-group">
                        <label for="cupos">Cupos</label>
                        <input type="number" disabled class="form-control" value="${cupo}">
                    </div>
                </div>

                <div class="col-2">
                    <div class="form-group">
                        <label for="cupos">Reservas</label>
                        <input type="number" id="cupos" disabled class="form-control" value="${cupos_reservados}">
                    </div>
                </div>

                <div class="col-4">
                    <div class="form-group">
                        <label for="totalPersonas">Cantidad de personas:</label>
                        <input type="number" class="form-control" id="totalPersonas" min="1" max="${cupo - cupos_reservados}">
                    </div>
                </div>

                <div class="col-12">
                    <div class="form-group">
                        <label for="info-adicional">Información adicional:</label>

                        <div class="border p-2" id="info-adicional" style="height: 150px; overflow-y: auto;"></div>
                    </div>
                </div>
            </div>
            <button type="button" class="btn btn-primary" onclick="salvarReserva()">Reservar</button>
        </form>
    </div>
</div>

<script>
    let idtour = ${params.id?params.id:0}
</script>
<asset:javascript src="assets/misJS/reservaTour.js"/>
</body>
</html>

