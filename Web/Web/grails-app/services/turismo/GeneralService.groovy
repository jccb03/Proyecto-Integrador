package turismo

import com.sun.corba.se.impl.oa.toa.TOAFactory
import grails.gorm.transactions.Transactional

@Transactional
class GeneralService {

    def sqlService;


//  Map iniciar_sesion(String usuario, String clave){
//
//
//
//      String sql = "select * from t_usuarios where usuario = ? and clave = ?";
//      Collection collection = [];
//      collection.add(usuario)
//      collection.add(clave)
//      return sqlService.getQueryMap(sql,collection)
//  }

    TUsuarios iniciar_sesion(String usuario, String clave) {
        TUsuarios tUsusarios = TUsuarios.findByUsuarioAndClave(usuario, clave);
        return tUsusarios;
    }

//    TReserva encontrar_reserva(String usuario ) {
//        TReserva tReserva = TReserva.findByUsuario(usuario);
//        return tUsusarios;
//    }
    def deshabilitar_usuario(int id){
        TUsuarios tUsuarios = TUsuarios.findById(id);
        if (tUsuarios) {
            tUsuarios.setEstado(false)
        }
        tUsuarios.save(failOnError: true)
    }

    def obtener_reservaTour(TTour tTour){
        def reservas = TReserva.findAllByTour(tTour)
        return reservas
    }

    def registrar_usuario(int id, String nombre, String usuario, String apellido, String correo, String telefono, String cedula, String clave, boolean admin, boolean estado) {
        TUsuarios tUsuarios = TUsuarios.findByUsuario(usuario)
        if (tUsuarios) {
            tUsuarios.setNombre(nombre)
            tUsuarios.setUsuario(usuario)
            tUsuarios.setApellido(apellido)
            tUsuarios.setTelefono(telefono)
            tUsuarios.setCorreo(correo)
            tUsuarios.setAdministrador(admin)
            tUsuarios.setEstado(estado)
            tUsuarios.setCedula(cedula)
            println("Clave de tUsuario: " + tUsuarios.getClave())
            println("Clave nueva: "+ clave)

            println("Clave antes: "+ tUsuarios.clave)
            if (!tUsuarios.getClave().equals(clave) && !clave.isEmpty()) {
                tUsuarios.setClave(clave)
            }
            println("Clave despues: "+ tUsuarios.clave)
        } else {
            tUsuarios = new TUsuarios(nombre: nombre, usuario: usuario, clave: clave, administrador: admin, apellido: apellido, correo: correo, telefono: telefono, cedula: cedula, estado: true)
        }
        tUsuarios.save(failOnError: true)
    }


    def eliminar_oferta(int id){
        TOferta tOferta = TOferta.findById(id);
        tOferta.estado = false;
        tOferta.save(failOnError: true)
    }

    def registrar_tour(int id, String nombre, String descripcion, BigDecimal precio, Date fecha, int capacidad, int cupos) {
        TTour tTour = TTour.findById(id);
        if (tTour) {
            tTour.setfNombre(nombre)
            tTour.setfDescripcion(descripcion)
            tTour.setfPrecio(precio)
            tTour.setfFecha(fecha)
            tTour.setfCapacidad(capacidad)
            tTour.setfCupos(cupos)

        } else {
            tTour = new TTour(fNombre: nombre, fDescripcion: descripcion, fPrecio: precio, fFecha: fecha, fCapacidad: capacidad, fCupos: cupos, estado: true)
        }
        tTour.save(failOnError: true)

    }

    def registrar_reserva(long totalPersonas, Long idcliente, Long idtour, Long idfecha) {
        TUsuarios usuarios = TUsuarios.findById(idcliente)
        TTour tour = TTour.findById(idtour)
        TReserva tReserva = new TReserva(
                totalPersonas: totalPersonas,
                usuarios: usuarios,
                tour: tour,
                idfecha: idfecha,
                estado: true
        )
        println("tReserva": tReserva)
        tReserva.save(failOnError: true)
    }



    def obtener_ofertas(){
        def ofertas = TOferta.findAllByEstado(true)
        return ofertas
    }

    def eliminar_tour(int id) {
        TTour tTour = TTour.findById(id)
        if (tTour) {
            tTour.estado = false
            tTour.save(failOnError: true)
        }
    }


    def conseguirToursNombre(String nombre){
       def tours = TTour.findAllByFNombreIlike("%${nombre}%")
       return tours
    }

    def obtener_tours() {
        return TTour.list()
    }

    def obtener_usuarios() {
        return TUsuarios.list()
    }

    def obtener_usuarios_activos() {
        return TUsuarios.findAllByEstado(true)
    }


    def registrar_oferta(int tourId,  String descripcion, int cantidadCupos, double descuento, id){
        TTour tour = TTour.findById(tourId)
//        def tieneOfertas = false;
//        if(!TOferta.findAllByEstadoAndTour(true, tour).isEmpty()){
            if(id!=0){
                TOferta tOferta = TOferta.findById(id)
                tOferta.descripcion = descripcion
                tOferta.descuento = descuento
                tOferta.cantidadCupos = cantidadCupos
                tOferta.save(failOnError: true)
            }else{
                TOferta tOferta = new TOferta(
                        tour: tour,
                        descripcion: descripcion,
                        cantidadCupos: cantidadCupos,
                        descuento: descuento,
                        estado: true
                )
                tOferta.save(failOnError: true)
            }
//        }else{
//            tieneOfertas = true;
//        }
//        return tieneOfertas;

    }

    def obtenerOfertas() {
        return TOferta.findAllByEstado(true);
    }

    def obtener_reservas_activas(){
        return TReserva.findAllByEstado(true)
    }

}

