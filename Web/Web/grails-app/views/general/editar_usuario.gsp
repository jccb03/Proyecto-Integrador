<%--
  Created by IntelliJ IDEA.
  User: pdl-1
  Date: 21/5/2024
  Time: 5:14 p. m.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Editar Usuario</title>
</head>
<body>
<div class="reservation-form">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <form id="reservation-form" name="gs" action="javascript:void(0);" method="post" role="search">
                    <div class="row">
                       <div class="col-lg-12">
                           <h4>Editar Usuario</h4>
                       </div>
                       <input type="text" name="id" class="id" id="id" autocomplete="" required value="${usuario != null ? usuario.id : 0}" hidden>
                       <div class="col-lg-6">
                           <fieldset>
                               <label for="nombre" class="form-label">Nombre</label>
                               <input type="text" name="nombre" class="nombre" id="nombre" placeholder="Nombre" autocomplete="on" value="${usuario != null ? usuario.nombre : ''}" required>
                           </fieldset>
                       </div>
                       <div class="col-lg-6">
                           <fieldset>
                               <label for="apellido" class="form-label">Apellido</label>
                               <input type="text" name="apellido" class="apellido" id="apellido" placeholder="Apellido" autocomplete="on" value="${usuario != null ? usuario.apellido : ''}" required>
                           </fieldset>
                       </div>
                       <div class="col-lg-6">
                           <fieldset>
                               <label for="cedula" class="form-label">Cedula</label>
                               <input type="text" name="cedula" class="cedula" id="cedula" placeholder="Cedula" autocomplete="on" value="${usuario != null ? usuario.cedula : ''}" required>
                           </fieldset>
                       </div>
                       <div class="col-lg-6">
                           <fieldset>
                               <label for="correo" class="form-label">Correo</label>
                               <input type="email" name="correo" class="correo" id="correo" placeholder="Correo" autocomplete="on" value="${usuario != null ? usuario.correo : ''}" required>
                           </fieldset>
                       </div>
                       <div class="col-lg-6">
                           <fieldset>
                               <label for="telefono" class="form-label">Telefono</label>
                               <input type="phone" name="telefono" class="telefono" id="telefono" placeholder="Telefono" autocomplete="on" value="${usuario != null ? usuario.telefono : ''}" required>
                           </fieldset>
                       </div>
                       <div class="col-lg-6">
                           <fieldset>
                               <label for="usuario" class="form-label">Usuario</label>
                               <input type="text" name="usuario" class="usuario" id="usuario" placeholder="Usuario" autocomplete="on" value="${usuario != null ? usuario.usuario : ''}" required>
                           </fieldset>
                       </div>
                       <div class="col-lg-6">
                           <fieldset>
                               <label for="clave" class="form-label">Contraseña</label>
                               <div class="row">
                                   <div class="col-lg-8">
                                       <input type="password" name="clave" class="clave" id="clave" placeholder="******" autocomplete="on" required value="${usuario != null ? usuario.clave : ''}" readonly>
                                   </div>
                                   <div class="col-lg-4">
                                       <button class="btn btn-info" onclick="editar_clave()">
                                           <i class="fa fa-pencil"></i>
                                       </button>
                                   </div>
                               </div>
                           </fieldset>
                       </div>
                       <div class="col-lg-6">
                           <fieldset>
                               <label for="administrador" class="form-label">Rol</label>
                               <select name="administrador" class="administrador" id="administrador">
                                   <option value="true" ${usuario != null && usuario.administrador ? 'selected' : ''}>Administrador</option>
                                   <option value="false" ${usuario != null && !usuario.administrador ? 'selected' : ''}>Usuario</option>
                               </select>
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
<asset:javascript src="assets/misJS/editarUsuario.js"/>
<script>
   function editar_clave(){
        event.preventDefault();
        var clave = $("#clave");
        clave.prop("readonly", !clave.prop("readonly"));
    }
</script>
</body>
</html>
