package turismo

import grails.converters.JSON

class TUsuarios {
    static mapping = {
        version(false)
        table("t_usuarios")
        id generator:'identity', column:'id'
    }

    String nombre
    String apellido
    String correo
    String telefono
    String usuario
    String clave
    Boolean administrador

    static constraints = {
        nombre nullable: true
        apellido nullable: true
        correo nullable: false
        telefono nullable: false
        usuario nullable: false
        clave nullable: false

    }

    String toString(){
        return this.properties.toString();
    }
}
