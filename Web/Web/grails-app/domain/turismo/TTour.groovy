package turismo

import grails.converters.JSON

class TTour {

    static mapping = {
        version(false)
        table("t_tour")
        id generator:'identity', column:'id'
    }

    String fNombre
    String fDescripcion
    BigDecimal fPrecio
    Date fFecha
    int fCapacidad
    int fCupos

    static constraints = {
        fNombre nullable: false
        fDescripcion nullable: false
        fPrecio nullable: false
        fFecha nullable: false
        fCapacidad nullable: false
        fCupos nullable: false
    }

    String toString(){
        return this.properties.toString();
    }
}
