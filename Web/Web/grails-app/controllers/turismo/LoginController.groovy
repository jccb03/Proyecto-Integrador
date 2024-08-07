package turismo

import FuncionesGenerales.Funciones

class LoginController {
    def generalService;
    Funciones funciones = new Funciones();
    def correoService;

    def index() {
//        String [] correos =  ["justin_quijada@hotmail.com"];
//
//
//       correoService.enviarEmail(correos,"VOLANTE DE RESERVACION ","Hola, para confirmar su reserva")
        render (view: "/general/login")
    }

    def iniciar_sesion(){


        String username = params.usuario as String;
        String password = params.clave as String;
        // Consulta la base de datos para verificar las credenciales

//        Map mapa = generalService.iniciar_sesion(username,password);
        TUsuarios usuario = generalService.iniciar_sesion(username,password);
        if (usuario){
            session.setAttribute("usuario",usuario);
//            println(session.usuario);
            render(text: "true");
        }else {
            session.removeAttribute("usuario");
            render(text: "false");
        }
    }

}
