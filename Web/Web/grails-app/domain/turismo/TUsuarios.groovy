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
        correo nullable: true
        telefono nullable: true
        cedula nullable: true
        usuario nullable: true
        clave nullable: true
        estado nullable : true
    }

    String toString(){
        return this.properties.toString();
    }
}
