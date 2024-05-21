package turismo

import FuncionesGenerales.Funciones

class LoginController {
    Funciones funciones = new Funciones();

    def index() {
        render (view: "/general/login")
    }
}
