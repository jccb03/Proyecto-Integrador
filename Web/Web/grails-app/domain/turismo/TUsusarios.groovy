package turismo

import grails.converters.JSON

class TUsusarios {
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
        nombre nullable: true;
        usuario nullable: true;
        clave nullable: true;
        nombre nullable: true;
    }

    String toString(){
        return this.properties.toString();
    }
}
