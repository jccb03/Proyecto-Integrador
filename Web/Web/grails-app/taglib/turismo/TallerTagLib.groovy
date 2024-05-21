package turismo

class TallerTagLib {
    //    static defaultEncodeAs = [taglib:'html']
    static namespace = "TallerTagLib"
    static defaultEncodeAs = [taglib: 'raw']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def modalReimprimirOrdenTaller = {
        out << g.render(
                template: "/templateTaglibs/modalReimprimirOrdenTaller", model: [
                nombre         : it.nombre,
                titulo         : it.titulo,
                accion:it.accion,
                controlador:it.controlador,
                url:it.url,
                tipoImpresion:it.tipoImpresion
        ]
        )
    }
}
