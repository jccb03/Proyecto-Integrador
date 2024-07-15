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
    <title>Login</title>
</head>
<body>
<div class="reservation-form">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2 style="color: white">${params.buscar}</h2>
                <table id="busqueda" class="table table-dark">
                    <thead>
                    <tr>
%{--                        <th>ID</th>--}%
                        <th>Estado</th>
                        <th>Tour</th>
                        <th>Cliente</th>
                        <th>Fecha</th>
%{--                        <th>Total Personas</th>--}%
%{--                        <th>Acción</th>--}%

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${resultado}" var="tours" status="i">
                        <tr>

                            <td>${tours.estado ? 'Activa' : 'Inactiva'}</td>
                            <td>${tours.fNombre}</td>
                            <td>${session.usuario.nombre}</td>
                            <td>
%{--                                <g:formatDate date="${new Date().parse('yyyy-MM-dd HH:mm:ss.S')}" format="dd/MM/yyyy" />--}%
                                <g:formatDate date="${tours.fFecha}" format="dd/MM/yyyy" />
                            </td>
%{--                            <td>${resultado.fCupos}</td>--}%

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<asset:javascript src="assets/misJS/home.js"/>
</body>


</html>