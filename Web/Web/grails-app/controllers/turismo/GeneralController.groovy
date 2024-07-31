package turismo

import FuncionesGenerales.Funciones
import grails.converters.JSON

import java.text.SimpleDateFormat

class GeneralController {
    Funciones funciones = new Funciones()

    // Inyección del servicio
    GeneralService generalService
    def correoService;

    def index() {
        def tours = generalService.obtener_tours()
        render(view: "/general/home", model: [tours: tours])
    }

    def obtenerTours() {
        def tours = generalService.obtener_tours()
        println "Tours: " + tours
        respond tours as JSON
    }




    def toursAdm() {
        def tours = generalService.obtener_tours()
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy")
        List<Long> cupos = []

        tours.each { tour ->
            if (tour) {
                Long cupo = tour.fCupos ?: 0
                Long cupos_reservados = TReserva.findAllByEstadoAndTour(true, tour).sum { it.totalPersonas ?: 0 } ?: 0
                cupos.add(cupos_reservados)
            } else {
                println("Tour con id ${params.id} no encontrado.")
                cupos.add(0)
            }
        }

        println("cupos: " + cupos)
        render(view: "/general/toursAdm", model: [tours: tours, cuposreservados: cupos])
    }


    def elegirTour() {
        def tours = generalService.obtener_tours()
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy")
        List<Long> cupos = []

        tours.each { tour ->
            if (tour) {
                Long cupo = tour.fCupos ?: 0
                Long cupos_reservados = TReserva.findAllByEstadoAndTour(true, tour).sum { it.totalPersonas ?: 0 } ?: 0
                cupos.add(cupos_reservados)
            } else {
                println("Tour con id ${params.id} no encontrado.")
                cupos.add(0)
            }
        }

        println("cupos: " + cupos)
        render(view: "/general/elegirTour", model: [tours: tours, cuposreservados: cupos])
    }


    def crearTour() {
        render(view: "/general/crearTour");
    }



    def editarTour(int id) {
        TTour tTour = null;
        if (params.containsKey("id")) {
            tTour = TTour.findById(id);
        }
        render(view: "/general/editarTour", model: [tour: tTour]);
    }

    def editarTourinfo(int id) {
        TTour tTour = null;
        if (params.containsKey("id")) {
            tTour = TTour.findById(id);
        }
        render(view: "/general/editarTourinfo", model: [tour: tTour]);
    }

    def infoTour(int id) {
        TTour tTour = TTour.findById(id);
        def reservas = generalService.obtener_reservaTour(tTour);
        TOferta tOferta = TOferta.findAllByEstadoAndTour(true, tTour)[0]
        render(view: "/general/infoTour", model: [tour: tTour, reservas: reservas, oferta: tOferta]);
    }

    def editarOferta(int id){
        def oferta = TOferta.findById(id)
        render(view: "/general/editarOferta", model: [oferta: oferta])
    }

    def verOfertasClientes(){
        def ofertas = generalService.obtenerOfertas()

        ArrayList<Integer> reservados = new ArrayList<Integer>()

        ofertas.each { oferta ->
            def _reservas = generalService.obtener_reservaTour(oferta.tour)
            int totalPersonas = _reservas.sum { it.totalPersonas as Integer } ?: 0
            println("Reservas: ${_reservas} | Cantidad Personas: ${totalPersonas}")
            reservados.add(totalPersonas)
        }

        render(view: "/general/ofertas.gsp", model: [ofertas: ofertas,
                                                     busqueda  : params.buscar,
                                                     reservados: reservados
                                                    ]
        )
    }

    def editar_usuario(int id) {
        TUsuarios tUsuario = null;
        if (params.containsKey("id")) {
            tUsuario = TUsuarios.findById(id);
        }
        render(view: "/general/editar_usuario", model: [usuario: tUsuario]);
    }


    // Este método solo renderiza la vista para el registro
    def mostrarRegistroUsuario() {
        render(view: "/general/registrar_usuario");
    }

    def registroAdmin() {
        render(view: "/general/registrar_admin");
    }

    // Este método procesa el registro del usuario
    def salvar_usuario() {
        String nombre = params.nombre
        String usuario = params.usuario
        String clave = params.clave
        String apellido = params.apellido
        String correo = params.correo
        String telefono = params.telefono
        String cedula = params.cedula

        //println "Intentando registrar usuario: $usuarFio"
        try {
            // Llamada correcta al método del servicio
            generalService.registrar_usuario(0, nombre, usuario, apellido, correo, telefono, cedula, clave, false, true)
            render(text: "true")
        } catch (e) {
            log.error("Error al registrar usuario", e)
            render(text: "false", status: 500)
        }
    }

    def modificar_usuario() {
        int id = params.id as int
        String nombre = params.nombre
        String usuario = params.usuario
        String clave = params.clave
        String apellido = params.apellido
        String correo = params.correo
        String telefono = params.telefono

        String cedula = params.cedula

        boolean admin = Boolean.parseBoolean(params.administrador)
        boolean estado = true

        try {
            generalService.registrar_usuario(id, nombre, usuario, apellido, correo, telefono, cedula, clave, admin, estado)
            render(text: "true")
        } catch (e) {
            log.error("Error al registrar usuario", e)
            render(text: "false", status: 500)
        }
    }

    def eliminar_usuario(int id) {
        try {
            generalService.deshabilitar_usuario(id);
            render(text: "true")
        }
        catch (e) {
            log.error("Error al registrar usuario", e)
            render(text: "false", status: 500)
        }
    }

    def salvar_admin() {
        def cedula = params.cedula
        def nombre = params.nombre
        def apellido = params.apellido
        def correo = params.correo
        def telefono = params.telefono
        def usuario = params.usuario
        def clave = params.clave
        boolean admin = true
        boolean estado = params.estado
        println(params)

        try {
            // Call the method with individual parameters
            generalService.registrar_usuario(0, nombre, usuario, apellido, correo, telefono, cedula, clave, admin, estado)
            render(text: "true")
        } catch (e) {
            log.error("Error al registrar usuario", e)
            render(text: "false", status: 500)
        }
    }


    def usuariosAdm() {
        def usuarios = generalService.obtener_usuarios_activos()
        render(view: "/general/usuariosAdm", model: [usuarios: usuarios])
    }

    def modificar_tour() {
        print(params)
        def id = params.id as int
        def nombre = params.nombre as String
        def descripcion = params.descripcion
        def precio = params.precio as BigDecimal
        def fecha = new Date(funciones.normalFormat(params.fecha).toLong())
        def capacidad = params.capacidad as int
        def cupos = params.cupos as int
        try {
            generalService.registrar_tour(id, nombre, descripcion, precio, fecha, capacidad, cupos);
            render(text: "true");
        } catch (e) {
            log.error("Error al modificar el tour", e)
            render(text: "false", status: 500)
        }
    }

    def verOfertas(){
        def ofertas = generalService.obtenerOfertas()
        render(view: "ofertas.gsp", ofertas: ofertas)
    }

    def salvar_tour() {
        def nombre = params.nombre
        def descripcion = params.descripcion
        def precio = params.precio as BigDecimal
        def fecha = new Date(funciones.normalFormat(params.fecha).toLong())
        def capacidad = params.capacidad as int
        def cupos = params.cupos as int

        try {
            generalService.registrar_tour(0, nombre, descripcion, precio, fecha, capacidad, cupos)
            render(text: "true", status: 200)
        } catch (e) {
            log.error("Error al registrar el tour", e)
            render(text: "false", status: 500)
        }

    }


    def reservasAdm() {
        def reservas = generalService.obtener_reservas_activas()
        def reservasUnicas = generalService.obtener_reservas_activas().collect { it.tour.fNombre }.unique()
        println("reservasUnicas: " + reservasUnicas)
        render(view: "/general/reservasAdm", model: [reservas: reservas, select: reservasUnicas])
    }

    def reservaTour(int id) {

        TTour tTour
        Long cupo = 0
        Long cupos_reservados = 0
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        if (params.containsKey("id")) {
            tTour = TTour.findById(id);
            cupo = tTour.fCupos;
            //gracias a la relacion, solo se debe usar el objeto tTour usando el ByEstadoAndTour
            List<TReserva> tReservaList = TReserva.findAllByEstadoAndTour(true, tTour);
//            println("TTour: "+tTour)
//            println("TReservaList: " + tReservaList)
            tReservaList.forEach {
                cupos_reservados += it.totalPersonas;
            }
        }
        render(view: "/general/reservaTour", model: [tour: tTour, cupo: cupo, cupos_reservados: cupos_reservados, simpleDateFormat: simpleDateFormat]);
    }

//    def reservaTourOferta(int id, int ofertaId) {
//        TTour tTour
//        Long cupo = 0
//        Long cupos_reservados = 0
//        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
//        TOferta tOferta = TOferta.findById();
//        if (params.containsKey("id")) {
//            tTour = TTour.findById(id);
//            cupo = tTour.fCupos;
//            //gracias a la relacion, solo se debe usar el objeto tTour usando el ByEstadoAndTour
//            List<TReserva> tReservaList = TReserva.findAllByEstadoAndTour(true, tTour);
////            println("TTour: "+tTour)
////            println("TReservaList: " + tReservaList)
//            tReservaList.forEach {
//                cupos_reservados += it.totalPersonas;
//            }
//        }
//        render(view: "/general/reservaTour", model: [tour: tTour, cupo: cupo, cupos_reservados: cupos_reservados, simpleDateFormat: simpleDateFormat, oferta: tOferta]);
//    }

    def eliminarOferta(int id){
        try{
            generalService.eliminar_oferta(id);
            render(text: "true", status: 200)
        } catch (e) {
            log.error("Error al eliminar la oferta", e)
            render(text: "false", status: 500)
        }
    }

    def salvarReserva() {
        def totalPersonas = params.totalPersonas as Long
        def idcliente = ((TUsuarios) session.usuario).id as Long
        def idtour = params.idtour as Long
        def idfecha = params.idfecha as Long
        def correoUsuario = ((TUsuarios) session.usuario).correo
//        def oferta = TOferta.findById(params.ofertaId)
        def oferta = null

//        if (oferta == null) {
//
//            render(text: "Oferta not found", status: 404)
//            return
//        }

        try {
//            def reserva = new TReserva(totalPersonas: totalPersonas, clienteId: idcliente, tourId: idtour, fechaId: idfecha, oferta: oferta)
//            reserva.save(flush: true)

            def reserva  =  generalService.registrar_reserva(
                    totalPersonas,
                    idcliente,
                    idtour,
                    idfecha
            )

            // Send confirmation email
            String[] correos = [correoUsuario]
            correoService.enviarEmail(correos, "VOLANTE DE RESERVACION \n", "HOLA, para procesar la reserva completamente favor de hacer un deposito a la siguiente cuenta")
            render(text: "true")
        } catch (e) {
            log.error("Error al salvar la reserva", e)
            render(text: "false", status: 500)
        }
    }







    def eliminarTour() {
        def id = params.id as int
        generalService.eliminar_tour(id)
        // redirect(url: '/home')
    }

    def buscarTours() {
        def resultado = generalService.conseguirToursNombre(params.buscar)

        ArrayList<Integer> reservados = new ArrayList<Integer>()

        resultado.each { rTour ->
            def _reservas = generalService.obtener_reservaTour(rTour)
            int totalPersonas = _reservas.sum { it.totalPersonas as Integer } ?: 0
            println("Reservas: ${_reservas} | Cantidad Personas: ${totalPersonas}")
            reservados.add(totalPersonas)
        }

//        def reservas =  generalService.obtener_reservaTour(resultado.first());
//        def reservasRestantes =(int) reservas.sum { it.totalPersonas };
        render(view: "/general/resultadosBusqueda", model: [
                resultado : resultado,
                busqueda  : params.buscar,
                reservados: reservados
        ])
    }

    def crearOferta(int id){
        def tour = TTour.findById(id);
        render(view: "/general/crearOferta", model: [tour: tour])
    }

    def deshabilitarOfertas(int tourId){
        TTour tTour = TTour.findById(tourId);

        try{
            def ofertas = TOferta.findAllByEstadoAndTour(true, tour)

            ofertas.each { oferta ->
                oferta.estado = false
                oferta.save(flush: true)
            }

            render(text: "true", status: 200);
        }catch (e){
            render(text: "false", status: 500);
        }


    }

    def salvar_oferta(int tourId,  String descripcion, int cantidadCupos, double descuento, int id){
        try {
            // Call the method with individual parameters

            generalService.registrar_oferta(tourId, descripcion, cantidadCupos, descuento, id)
            render(text: "true")
        } catch (e) {
            log.error("Error al registrar usuario", e)
            render(text: "false", status: 500)
        }
    }

    def ofertasAdm() {
        def ofertas = generalService.obtenerOfertas()
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy")
//        List<Long> cupos = []
//
//        ofertas.gsp.each { tour ->
//            if (tour) {
//                Long cupo = tour.fCupos ?: 0
//                Long cupos_reservados = TReserva.findAllByEstadoAndTour(true, tour).sum { it.totalPersonas ?: 0 } ?: 0
//                cupos.add(cupos_reservados)
//            } else {
//                println("Tour con id ${params.id} no encontrado.")
//                cupos.add(0)
//            }
//        }

        render(view: "/general/ofertasAdm", model: [ofertas: ofertas])
    }

    def logout() {
        session.usuario = null
        redirect(url: '/login')
    }


}
