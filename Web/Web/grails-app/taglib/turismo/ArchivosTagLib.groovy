package turismo

class ArchivosTagLib {
//    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "ArchivosTagLib"
    static defaultEncodeAs = [taglib: 'raw']

    def modalBuscarClientes = {
        out << g.render(
                template: "/templateTaglibs/modalBuscarClientes", model: [
                nombre     : it.nombre,
                titulo     : it.titulo,
                variableData : it.variableData,
                funcion    : it.funcion ? it.funcion : "",
                campoFocus : it.campoFocus ? it.campoFocus : ""
        ]

        )
    }
}
