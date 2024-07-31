package turismo

class TReserva {

    static belongsTo = [tour: TTour, usuarios: TUsuarios, oferta: TOferta] // Definición de la relación con TTour y TUsuario

    static mapping = {
        version(false)
        table("t_reserva")
        id generator:'identity', column:'id'
    }



    Boolean estado
//    Long idtour
//    Long idcliente
    Long idfecha
    Long totalPersonas

    static constraints = {
        estado nullable: true
        oferta nullable: true
        totalPersonas nullable: true
//        idtour nullable: false
//        idcliente nullable: false
        idfecha nullable: true
        totalPersonas nullable: true


    }
}
