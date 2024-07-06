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
                <form id="reservation-form" name="gs" method="submit" role="search">
                    <div class="row">
                        <div class="col-lg-12">
                            <h4>Login</h4>
                        </div>
                        <div class="col-lg-6">
                            <fieldset>
                                <label for="user" class="form-label">Usuario</label>
                                <input type="text" name="user" class="user" id="user" placeholder="Usuario" autocomplete="on" value="" required>
                            </fieldset>
                        </div>
                        <div class="col-lg-6">
                            <fieldset>
                                <label for="clave" class="form-label">Contraseña</label>
                                <input type="password" name="password" class="password" id="clave" placeholder="******" value="" autocomplete="on" required>
                            </fieldset>
                        </div>
                        <div class="col-lg-12">
                            <fieldset>
                                <button class="main-button" type="button" onclick="login()">Login</button>
                            </fieldset>
                        </div>

                        <div class="col-lg-12">
                            <fieldset>
                                <a class="main-button" href="./registrar_usuario">Registrate</a>
                            </fieldset>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<asset:javascript src="assets/misJS/login.js"/>
</body>
</html>