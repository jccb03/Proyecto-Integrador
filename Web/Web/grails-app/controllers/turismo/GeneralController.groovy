package turismo

import FuncionesGenerales.Funciones

class GeneralController {
    Funciones funciones = new Funciones()

    // Inyección del servicio
    GeneralService generalService

    def index() {
        render(view: "/general/home");
    }

    def crearTour() {
        render(view: "/general/crearTour");
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
        //println "Intentando registrar usuario: $usuario"
        try {
            // Llamada correcta al método del servicio
            generalService.registrar_usuario(0,nombre, usuario, clave)
            render(text: "true")
        } catch (e) {
            log.error("Error al registrar usuario", e)
            render(text: "false", status: 500)
        }

    }

    def salvar_tour() {
        def nombre = params.nombre
        def descripcion = params.descripcion
        def precio = params.precio as BigDecimal
        def fecha = new Date(funciones.normalFormat(params.fecha).toLong())
        def capacidad = params.capacidad as int
        def cupos = params.cupos as int

        try {
            // Llamada correcta al método del servicio
            generalService.registrar_tour(0, nombre, descripcion, precio, fecha, capacidad, cupos)
            render(text: "true")
        } catch (e) {
            log.error("Error al registrar el tour", e)
            render(text: "false", status: 500)
        }

    }

    def logout(){
        session.usuario = null
        redirect(url: '/login')
    }
}
