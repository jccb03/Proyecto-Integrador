<%--
  Created by IntelliJ IDEA.
  User: JQ
  Date: 14/12/2019
  Time: 10:34 a. m.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en" class="fullscreen-bg">
<head>
    <meta name="layout" content="main">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>Error 404</title>
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <asset:link rel="apple-touch-icon" sizes="76x76" href="template/assets/img/apple-icon.png"/>
    <asset:link rel="icon" type="image/png" sizes="96x96" href="template/assets/img/favicon.png"/>
  </head>


<body>
<style>
/*.vertical-align-wrap {*/
/*    background:  url('/lion/assets/early-sunrise.jpg') no-repeat center center fixed;*/
/*    -webkit-background-size: cover;*/
/*    -moz-background-size: cover;*/
/*    -o-background-size: cover;*/
/*    opacity: 200;*/
/*    color: white;*/
/*}*/
.efecto {
    color: #fff;
    font-size: 12em;
    font-weight: bold;
    font-family: Helvetica;
    text-shadow:
            0 1px 0 #ccc,
            0 2px 0 #c9c9c9,
            0 3px 0 #bbb,
            0 4px 0 #b9b9b9,
            0 5px 0 #aaa,
            0 6px 1px rgba(0,0,0,.1),
            0 0 5px rgba(0,0,0,.1),
            0 1px 3px rgba(0,0,0,.3),
            0 3px 5px rgba(0,0,0,.2),
            0 5px 10px rgba(0,0,0,.25),
            0 10px 10px rgba(0,0,0,.2),
            0 20px 20px rgba(0,0,0,.15);
}

.hit-the-floor {
    text-align: center;
}

</style>
<div class="page-error">
    <!-- WRAPPER -->
    <div id="wrapper">
        <div class="vertical-align-wrap">
            <div class="vertical-align-middle">
                <h1>
                    <span class="clearfix title">
                        <span class="number left efecto">404</span>
                        <span class="text efecto">Oops!
                            <br/>Pagina no disponible</span>
                    </span>
                </h1>
                <p>Esta pagina no esta dispobile, por favor contacte el administrador</p>
%{--                <p>You can also use search form below to find the page you are looking for.</p>--}%
%{--                <form class="searchbox">--}%
%{--                    <div class="input-group input-group-lg">--}%
%{--                        <input class="form-control" type="text">--}%
%{--                        <span class="input-group-btn">--}%
%{--                            <button class="btn btn-primary" type="button"><i class="fa fa-search"></i>--}%
%{--                                <span>Search</span>--}%
%{--                            </button>--}%
%{--                        </span>--}%
%{--                    </div>--}%
%{--                </form>--}%
                <div>
                    <a href="javascript:history.go(-1)" class="btn btn-default"><i class="fa fa-arrow-left"></i> <span>Atras</span></a>
                    <a href="./principal" class="btn btn-default"><i class="fa fa-home"></i> <span>Principal</span></a>
                </div>
            </div>
        </div>
    </div>
    <!-- END WRAPPER -->
</div>

</body>


</html>
