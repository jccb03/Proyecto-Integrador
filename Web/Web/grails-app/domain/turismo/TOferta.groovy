package turismo

class TOferta {
    static belongsTo = [tour: TTour]

    static mapping = {
        version(false)
        table("t_oferta")
        id generator:'identity', column:'id'
    }
    //crear columna id identity
    //crear columna tour_id
    Boolean estado
    double descuento
    Integer cantidadCupos
    String descripcion

    static constraints = {
        estado nullable: false
        descuento nullable: true
        cantidadCupos nullable: false
        descripcion nullable: true
    }
}
