package turismo

import grails.converters.JSON

class TUsuarios {
    static mapping = {
        version(false)
        table("t_usuarios")
        id generator:'identity', column:'id'
    }

    String nombre
    String usuario
    String clave
    Boolean administrador
    static constraints = {
        nombre nullable: true
        usuario nullable: false
        clave nullable: false
    }

    String toString(){
        return this.properties.toString();
    }
}
