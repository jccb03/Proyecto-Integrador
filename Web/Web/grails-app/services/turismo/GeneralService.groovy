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

    def registrar_usuario(int id,String nombre, String usuario, String clave) {
        TUsuarios tUsuarios = TUsuarios.findById(id);
        if (tUsuarios){
            tUsuarios.setNombre(nombre)
            tUsuarios.setUsuario(usuario)
            if (!tUsuarios.getClave().equals(clave) && !clave.isEmpty()){
                tUsuarios.setClave(clave)
            }
        }else {
            tUsuarios = new TUsuarios(nombre: nombre, usuario: usuario, clave: clave, administrador: false)
        }
        tUsuarios.save(failOnError: true)
    }
}

