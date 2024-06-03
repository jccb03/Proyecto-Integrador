package turismo

class GeneralController {

    // Inyección del servicio
    GeneralService generalService

    def index() {
        render(view: "/general/home");
    }

    // Este método solo renderiza la vista para el registro
    def mostrarRegistroUsuario() {
        render(view: "/general/registrar_usuario");
    }

    // Este método procesa el registro del usuario
    def salvar_usuario() {
        def nombre = params.nombre
        def usuario = params.usuario
        def clave = params.clave
        println "Intentando registrar usuario: $usuario"
        try {
            // Llamada correcta al método del servicio
            generalService.registrar_usuario(nombre, usuario, clave)
            render(text: "true")
        } catch (Exception e) {
            log.error("Error al registrar usuario", e)
            render(text: "false", status: 500)
        }
    }
}
