package turismo

class InventarioTagLib {
//    static defaultEncodeAs = [taglib:'html']
    static namespace = "InventarioTaglib"
    static defaultEncodeAs = [taglib: 'raw']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def modalBuscarProductos = {
        out << g.render(
                template: "/templateTaglibs/modalBuscarProductos", model: [
                nombre     : it.nombre,
                titulo     : it.titulo,
                dataProduto: it.dataProduto,
                funcion    : it.funcion ? it.funcion : "",
                campoFocus : it.campoFocus ? it.campoFocus : ""
        ]

        )
    }
    def modalSucursalCategoriasExistencia = {
        out << g.render(
                template: "/templateTaglibs/modalSucursalCategoriasExistencia", model: [
                nombre         : it.nombre,
                titulo         : it.titulo,
                tsucursalList  : it.tsucursalList,
                tcategoriasList: it.tcategoriasList,
                accion:it.accion,
                controlador:it.controlador,
                url:it.url
        ]
        )
    }

    def modalSucursalCategoriasExistenciaDescontinuado = {
        out << g.render(
                template: "/templateTaglibs/modalSucursalCategoriasExistenciaDescontinuado", model: [
                nombre         : it.nombre,
                titulo         : it.titulo,
                tsucursalList  : it.tsucursalList,
                tcategoriasList: it.tcategoriasList,
                accion:it.accion,
                controlador:it.controlador,
                url:it.url
        ]
        )
    }
    def modalFechasSucursal = {
        out << g.render(
                template: "/templateTaglibs/modalFechasSucursal", model: [
                nombre         : it.nombre,
                titulo         : it.titulo,
                tsucursalList  : it.tsucursalList,
                accion:it.accion,
                controlador:it.controlador,
                url:it.url
        ]
        )
    }
    def modalFechasSucursalCategorias = {
        out << g.render(
                template: "/templateTaglibs/modalFechasSucursalCategorias", model: [
                nombre         : it.nombre,
                titulo         : it.titulo,
                tsucursalList  : it.tsucursalList,
                tcategoriasList  : it.tcategoriasList,
                accion:it.accion,
                controlador:it.controlador,
                url:it.url
        ]
        )
    }
    def modalFechasSucursalTipoFactura = {
        out << g.render(
                template: "/templateTaglibs/modalFechasSucursalTipoFactura", model: [
                nombre         : it.nombre,
                titulo         : it.titulo,
                tsucursalList  : it.tsucursalList,
                accion:it.accion,
                controlador:it.controlador,
                url:it.url
        ]
        )
    }
}
