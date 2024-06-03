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
    <title>Registro Usuario</title>
</head>
<body>
<div class="reservation-form">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <form id="reservation-form" name="gs" action="javascript:void(0);" method="post" role="search">
                    <div class="row">
                        <div class="col-lg-12">
                            <h4>Registro Usuario</h4>
                        </div>
                        <div class="col-lg-6">
                            <fieldset>
                                <label for="nombre" class="form-label">Nombre</label>
                                <input type="text" name="nombre" class="nombre" id="nombre" placeholder="nombre" autocomplete="on" required>
                            </fieldset>
                        </div>
                        <div class="col-lg-6">
                            <fieldset>
                                <label for="usuario" class="form-label">Usuario</label>
                                <input type="text" name="usuario" class="usuario" id="usuario" placeholder="Usuario" autocomplete="on" required>
                            </fieldset>
                        </div>
                        <div class="col-lg-6">
                            <fieldset>
                                <label for="clave" class="form-label">Contraseña</label>
                                <input type="password" name="clave" class="clave" id="clave" placeholder="******" autocomplete="on" required>
                            </fieldset>
                        </div>
                        <div class="col-lg-12">
                            <fieldset>
                                <button class="main-button" type="button" onclick="salvar_usuario()">Confirmar</button>
                            </fieldset>
                        </div>


                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<asset:javascript src="assets/misJS/login.js"/>
<asset:javascript src="assets/misJS/RegistroUsuario.js"/>
</body>
</html>