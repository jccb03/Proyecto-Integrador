package turismo

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

    def registrar_usuario(int id,String nombre, String usuario, String clave, boolean admin) {
        TUsuarios tUsuarios = TUsuarios.findById(id);
        if (tUsuarios){
            tUsuarios.setNombre(nombre)
            tUsuarios.setUsuario(usuario)
            if (!tUsuarios.getClave().equals(clave) && !clave.isEmpty()){
                tUsuarios.setClave(clave)
            }
        }else {
            tUsuarios = new TUsuarios(nombre: nombre, usuario: usuario, clave: clave, administrador: admin)
        }
        tUsuarios.save(failOnError: true)
    }


    def registrar_tour(int id, String nombre, String descripcion, BigDecimal precio, Date fecha, int capacidad, int cupos ){
        TTour tTour = TTour.findById(id);
        if (tTour){
            tTour.setfNombre(nombre)
            tTour.setfDescripcion(descripcion)
            tTour.setfPrecio(precio)
            tTour.setfFecha(fecha)
            tTour.setfCapacidad(capacidad)
            tTour.setfCupos(cupos)

        }else {
            tTour = new TTour(fNombre: nombre, fDescripcion: descripcion, fPrecio: precio, fFecha: fecha, fCapacidad: capacidad, fCupos: cupos)
        }
        tTour.save(failOnError: true)
    }

    def obtener_tours(){
        
        return TTour.list()
    }
}

