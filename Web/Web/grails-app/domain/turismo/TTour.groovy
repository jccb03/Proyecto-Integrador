package turismo
class TTour {

    static belongsTo = [reserva: TReserva, usuarios: TUsuarios]
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
    Boolean estado

    static constraints = {
        fNombre nullable: false
        fDescripcion nullable: false
        fPrecio nullable: false
        fFecha nullable: false
        fCapacidad nullable: false
        fCupos nullable: false
        estado nullable: false
    }

    String toString(){
        return this.properties.toString();
    }
}
