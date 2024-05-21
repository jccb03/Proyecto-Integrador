package turismo

class PuntoVentaTagLib {
    //    static defaultEncodeAs = [taglib:'html']
    static namespace = "PuntoVentaTagLib"
    static defaultEncodeAs = [taglib: 'raw']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def modalReimprimirDevoluciones = {
        out << g.render(
                template: "/templateTaglibs/modalReimprimirDevolucion", model: [
                nombre         : it.nombre,
                titulo         : it.titulo,
                accion:it.accion,
                controlador:it.controlador,
                url:it.url,
                tipoImpresion:it.tipoImpresion
        ]
        )
    }

    def modalValidacionUsuario = {
        out << g.render(
                template: "/templateTaglibs/modalValidacionUsuario", model: [
                nombre         : it.nombre,
                titulo         : it.titulo,
                opcion:it.opcion,
                funcion:it.funcion
        ]
        )
    }

    def modalReimprimirCotizacion= {
        out << g.render(
                template: "/templateTaglibs/modalReimprimirCotizacion", model: [
                nombre         : it.nombre,
                titulo         : it.titulo,
                accion:it.accion,
                controlador:it.controlador,
                url:it.url,
                tipoImpresion:it.tipoImpresion,
                sucursalList:it.sucursalList
        ]
        )
    }
    def modalBuscarCotizacion= {
        out << g.render(
                template: "/templateTaglibs/modalBuscarCotizacion", model: [
                nombre         : it.nombre,
                titulo         : it.titulo,
                sucursalList:it.sucursalList,
                ideditar:it.ideditar,
                funcion: it.funcion
        ]
        )
    }
}
