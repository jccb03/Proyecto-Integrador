package turismo

class TReserva {

    static mapping = {
        version(false)
        table("t_reserva")
        id generator:'identity', column:'id'
    }



    Boolean estado
    Long idtour
    Long idcliente
    Long idfecha
    Long totalPersonas

    static constraints = {
        estado nullable: true
        idtour nullable: false
        idcliente nullable: false
        idfecha nullable: false
        totalPersonas nullable: false

    }
}
