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
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <style>
            #map {
                height: 400px;
                width: 100%;
                border: none;
                z-index: 0;
            }
        </style>
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
<div class="reservation-form" >
    <div class="container">
        <h1 style="color: white;">${tour.fNombre}</h1>
        <div class="row">
            <div class="col-6">
                <br/>
                <h3 style="color: white;  text-align: justify;">${tour.fDescripcion}</h3>
                <br/>
                <div class="border-button"><a href="#reservar">Reservar Tour</a></div>
            </div>
            <div class="col-6">
                <div id="map"></div>
            </div>
        </div>
        <br/>
        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="holder.js/500x250?theme=dark" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
              <img src="holder.js/500x250?theme=dark" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
              <img src="holder.js/500x250?theme=dark" class="d-block w-100" alt="...">
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button id="reservar" class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
        <hr />
        <h1 style="color: white" >Formulario de Reserva</h1>
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
<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <script>
            // Inicializar el mapa
            const map = L.map('map').setView([70.1627, 18.7357], 13);  // Coordenadas iniciales y nivel de zoom

            // Agregar capa de mapa desde OpenStreetMap
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxZoom: 19,
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(map);

            let marker;

                const _location = "${tour.fNombre}";
                const url = "https://nominatim.openstreetmap.org/search?format=json&q="+encodeURIComponent(_location);

                fetch(url)
                    .then(response => response.json())
                    .then(data => {
                        if (data.length > 0) {
                            const latLng = [data[0].lat, data[0].lon];
                            map.setView(latLng, 14); // Centrar el mapa en la nueva ubicación

                            // Remover marcador anterior si existe
                            if (marker) {
                                map.removeLayer(marker);
                            }

                            // Agregar un nuevo marcador
                            marker = L.marker(latLng).addTo(map)
                                .bindPopup(data[0].display_name)
                                .openPopup();
                        } else {
                            alert('Ubicación no encontrada.');
                        }
                    })
                    .catch(error => {
                        console.error('Error al buscar la ubicación:', error);
                    });

        </script>
<asset:javascript src="assets/misJS/reservaTour.js"/>
</body>
</html>