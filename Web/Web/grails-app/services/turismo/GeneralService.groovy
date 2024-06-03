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
    TUsusarios iniciar_sesion(String usuario, String clave) {
        TUsusarios tUsusarios = TUsusarios.findByUsuarioAndClave(usuario, clave);
        return tUsusarios;
    }

    def registrar_usuario(String nombre, String usuario, String clave) {
        def tUsuario = new TUsusarios(nombre: nombre, usuario: usuario, clave: clave, administrador: false)
        println "Creando nuevo usuario: $usuario"
        tUsuario.save(failOnError: true)
    }
}

