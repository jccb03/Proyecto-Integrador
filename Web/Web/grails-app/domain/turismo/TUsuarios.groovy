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
    String cedula
    String usuario
    String clave
    Boolean administrador
    Boolean estado

    static constraints = {
        nombre nullable: true
        apellido nullable: true
        correo nullable: false
        telefono nullable: false
        cedula nullable: true
        usuario nullable: false
        clave nullable: false
        estado nullable : false
    }

    String toString(){
        return this.properties.toString();
    }
}
