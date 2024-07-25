package turismo

class UrlMappings {

    static mappings = {
        "/turismo-facil/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        get "/"(redirect: "/home")
        get "/general/index"(redirect: "/home")
        get "/general/home"(redirect: "/home")
        get "/home"(controller: "general", action: "index")
        get "/login"(controller: "login", action: "index")
        post "/login/iniciar_sesion"(controller: "login", action: "iniciar_sesion")
        get "/registrar_usuario"(controller: "general", action:"mostrarRegistroUsuario")
        post "/registrar_usuario/salvar_usuario"(controller:"general", action:"salvar_usuario")
        post "/crearOferta/salvar_oferta"(controller: "general", action: "salvar_oferta")
        get "/logout"(controller: "general", action:"logout")
        get "/crearTour"(controller: "general", action:"crearTour")
        //get "/editarTour"(controller: "general", action:"editarTour")
        get "/editarTour"(controller: "general", action: "editarTour")
        get "/ofertas.gsp"(controller: "general", action: "verOfertasCliente")
        post "/editarTour/modificar_tour"(controller: "general", action:"modificar_tour")
        get "/registrar_admin"(controller: "general", action:"registroAdmin")
        post "/registrar_admin/salvar_admin"(controller:"general", action:"salvar_admin")
        get "/reservaTour"(controller:"general", action:"reservaTour")
        post "/reservaTour/salvarReserva"(controller:"general", action:"salvarReserva")
        post"/home/eliminarTour"(controller: "general", action: "eliminarTour")
        post"/eliminarTour"(controller: "general", action: "eliminarTour")

        get "/usuariosAdm"(controller: "general", action: "usuariosAdm")
        post "/usuariosAdm/eliminar_usuario"(controller: "general", action: "eliminar_usuario")
        get "/usuariosAdm/editar_usuario"(controller: "general", action: "editar_usuario")
        post "/usuariosAdm/editar_usuario/modificar_usuario"(controller: "general", action: "modificar_usuario")
        get "/reservasAdm"(controller: "general", action: "reservasAdm")
        get "/toursAdm"(controller: "general", action: "toursAdm")
        get "/toursAdm/infoTour"(controller: "general", action: "infoTour")
        get "/toursAdm/infoTour/editarTourinfo"(controller: "general", action: "editarTour")
        get "/toursAdm/crearTour"(controller: "general", action:"crearTour")
        post "/crearTour/salvar_tour"(controller: "general", action:"salvar_tour")
        post "/toursAdm/infoTour/editarTourinfo/modificar_tour"(controller: "general", action: "modificar_tour")
        post "/buscarTours"(controller: "general", action: "buscarTours")
        get "/ofertasAdm"(controller: "general", action: "ofertasAdm")
        get "/crearOferta"(controller: "general", action: "crearOferta")
        get "/elegirTour"(controller: "general", action: "elegirTour")
        get "/ofertas"(controller: "general", action: "verOfertasClientes")
        get "/editarOferta"(controller: "general", action: "editarOferta")
        post "/eliminarOferta"(controller: "general", action: "eliminarOferta")
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
