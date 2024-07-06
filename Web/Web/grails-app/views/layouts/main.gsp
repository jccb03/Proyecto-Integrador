<%@ page import="turismo.TUsuarios" %>
<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    %{--    <title>--}%
    %{--       TURISMO--}%
    %{--    </title>--}%
    <g:layoutTitle default="TURISMO"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <title>WoOx Travel Bootstrap 5 Theme</title>

    <!-- Bootstrap core CSS -->
    <asset:stylesheet src="vendor/bootstrap/css/bootstrap.min.css"/>


    <!-- Additional CSS Files -->
    <asset:stylesheet src="assets/css/fontawesome.css"/>
    <asset:stylesheet src="assets/css/templatemo-woox-travel.css"/>
    <asset:stylesheet src="assets/css/owl.css"/>
    <asset:stylesheet src="assets/css/animate.css"/>
    <asset:stylesheet src="assets/css/dataTables.dataTables.min.css"/>
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    <style>
        div.dt-container .dt-input {
            border: 1px solid #aaa;
            border-radius: 3px;
            padding: 5px;
            background-color: #232223;
            color: inherit;
        }
    </style>

    <!-- VENDOR CSS -->
    <g:layoutHead/>
</head>

<body>

<!-- ***** Preloader Start ***** -->
<div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
        <span class="dot"></span>

        <div class="dots">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
</div>
<!-- ***** Preloader End ***** -->

<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="/turismo-facil/home" class="logo">
                        %{--                        <img src="assets/images/logo.png" alt="">--}%
                        <asset:image src="assets/images/logo.png" alt=""/>
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="./home" class="active">Home</a></li>
                        <g:if test="${session.usuario}">
                            <g:if test="${((turismo.TUsuarios) session.usuario).administrador == true}">
                               <li class="nav-item">
                                    <a class="nav-link" href="/turismo-facil/toursAdm" id="navbarDropdown">
                                            Tours
                                  </a>
                               </li>

                                <%-- <li class="nav-item dropdown">
                                          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Tours
                                          </a>
                                          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="./crearTour">Crear Tour</a></li>
                                <li><a class="dropdown-item" href="./editarTour">Editar Tour</a></li>
                                <li>
                                    <a class="dropdown-item" href="./reservasAdm">Ver Reservas</a>
                                </li>
                                </ul>
                                 </li>--%>
                                 <li class="nav-item dropdown">
                               <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Administrar
                               </a>
                               <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                             <li><a class="dropdown-item" href="/turismo-facil/usuariosAdm">Usuarios</a></li>
                             </ul>
                              </li>

                            </g:if>
                        </g:if>

                    %{--                        <li><a href="reservation.html">Reservaciones</a></li>--}%
                    %{--                        <li><a href="reservation.html">Reserva ya</a></li>--}%
                        <g:if test="${session.usuario}">
                            <li><a href="./logout">Logout</a></li>
                        </g:if>
                        <g:else>
                            <li><a href="./login">Login</a></li>
                        </g:else>
                    </ul>
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ***** Header Area End ***** -->
<g:layoutBody/>
<footer>
    <div class="container">
    </div>
</footer>


<!-- Scripts -->
<!-- Bootstrap core JavaScript -->

<asset:javascript src="vendor/jquery/jquery.min.js"/>
<asset:javascript src="assets/js/jquery.mask.js"/>
<asset:javascript src="assets/js/popper.js"/>
<asset:javascript src="vendor/bootstrap/js/bootstrap.min.js"/>
<asset:javascript src="assets/js/isotope.min.js"/>
<asset:javascript src="assets/js/owl-carousel.js"/>
<asset:javascript src="assets/js/wow.js"/>
<asset:javascript src="assets/js/tabs.js"/>
<asset:javascript src="assets/js/popup.js"/>
<asset:javascript src="assets/js/custom.js"/>
<asset:javascript src="assets/js/sweetalert2.js"/>
<asset:javascript src="assets/js/holder/holder.js"/>
<asset:javascript src="assets/js/dataTables.min.js"/>

<script>
    Holder.addTheme("dark", {
          bg: "#000",
          fg: "#22b3c1",
          size: 11,
          font: "Monaco",
          fontweight: "normal"
    });

    function bannerSwitcher() {
        next = $('.sec-1-input').filter(':checked').next('.sec-1-input');
        if (next.length) next.prop('checked', true);
        else $('.sec-1-input').first().prop('checked', true);
    }

    var bannerTimer = setInterval(bannerSwitcher, 5000);

    $('nav .controls label').click(function () {
        clearInterval(bannerTimer);
        bannerTimer = setInterval(bannerSwitcher, 5000)
    });


</script>

</body>

</html>
