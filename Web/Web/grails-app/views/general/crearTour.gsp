<%--
  Created by IntelliJ IDEA.
  User: Justin
  Date: 3/6/2024
  Time: 5:27 p. m.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Mi Formulario</title>
</head>
<body>

<form action="/submit" method="post">
  <label for="nombre">Nombre:</label><br>
  <input type="text" id="nombre" name="nombre"><br>
  <label for="descripcion">Descripción:</label><br>
  <textarea id="descripcion" name="descripcion"></textarea><br>
  <label for="precio">Precio:</label><br>
  <input type="number" id="precio" name="precio" step="0.01" min="0"><br>
  <label for="fecha">Fecha:</label><br>
  <input type="date" id="fecha" name="fecha"><br>
  <label for="capacidad">Capacidad:</label><br>
  <input type="number" id="capacidad" name="capacidad" min="1"><br>
  <input type="submit" value="Enviar">
</form>

</body>
</html>
