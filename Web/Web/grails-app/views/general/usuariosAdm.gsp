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
    <title>Usuarios</title>
</head>
<body>
<div class="reservation-form">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <nav class="navbar bg-body-tertiary">
                      <ul class="nav nav-pills">
                        <li class="navbar-brand text-white">
                            <h3 class="text text-white">Usuarios</h3>
                        </li>

                      </ul>
                      <ul class="nav nav-pills">
                          <li class="nav-item dropdown mb-3 d-flex" style="">
                              <a class="nav-link active dropdown-toggle my-2 my-sm-0" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Nuevo</a>
                              <ul class="dropdown-menu">
                                  <li><a class="dropdown-item" href="./registrar_admin">Administrador</a></li>
                                  <li><a class="dropdown-item" href="./registrar_usuario">Usuario</a></li>
                              </ul>
                          </li>
                      </ul>
                  </nav>
                  <table id="usuarios" class="display">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Cedula</th>
                                <th>Correo</th>
                                <th>Teléfono</th>
                                <th>Usuario</th>
                                <th>Administrador</th>
                                <th>Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                             <g:each in="${usuarios}" var="usuario" status="i">
                                 <tr>
                                     <td>${usuario.id}</td>
                                     <td>${usuario.nombre}</td>
                                     <td>${usuario.apellido}</td>
                                     <td>${usuario.cedula}</td>
                                     <td>${usuario.correo}</td>
                                     <td>${usuario.telefono}</td>
                                     <td>${usuario.usuario}</td>
                                     <td>${usuario.administrador ? 'Sí' : 'No'}</td>
                                     <td>
                                         <button class="btn btn-danger" onclick="post_eliminar_usuario(${usuario.id}, '${usuario.usuario}')">
                                             <i class="fa fa-trash"></i>
                                         </button>
                                         <button class="btn btn-info" onclick="editar_usuario(${usuario.id})">
                                            <i class="fa fa-pencil"></i>
                                         </button>
                                     </td>
                                 </tr>
                             </g:each>
                        </tbody>
                    </table>
            </div>
        </div>
    </div>
</div>
<asset:javascript src="assets/misJS/login.js"/>
<asset:javascript src="assets/misJS/usuariosAdm.js"/>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var table = document.getElementById('usuarios');
        new DataTable(table);
    });
    console.log("Usuario: ${((turismo.TUsuarios) session.usuario).usuario}")
    function post_eliminar_usuario(id, usuario){
        if(usuario === "${((turismo.TUsuarios) session.usuario).usuario}"){
            Swal.fire({
              title: "Aviso",
              text: "No puede eliminar la cuenta que esta logueada.",
            });
        }else{
            eliminar_usuario(id, usuario)
        }
    }
</script>
</body>
</html>