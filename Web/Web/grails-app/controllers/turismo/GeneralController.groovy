package turismo

class GeneralController {


    def index() {
        render( view: "/general/home");
    }

//     puede ser def o void
    def registrar_usuario(){
        render(view: "/general/registrar_usuario");
    }
    def salvar_usuario(){
        Long id = params.id
        String nombre = params.nombre
        String usuario = params.usuario
        String clave = params.clave
        registrar_usuario(id,nombre,usuario,clave)
    }

}
