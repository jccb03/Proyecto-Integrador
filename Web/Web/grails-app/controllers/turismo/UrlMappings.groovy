package turismo

class UrlMappings {

    static mappings = {
        "/turismo-facil/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        get "/"(redirect: "/home")
        get "/home"(controller: "general", action: "index")
        get "/login"(controller: "login", action: "index")
        post "/login/iniciar_sesion"(controller: "login", action: "iniciar_sesion")
        get "/registrar_usuario"(controller: "general", action:"mostrarRegistroUsuario")
        post "/registrar_usuario/salvar_usuario"(controller:"general", action:"salvar_usuario")
        get "/logout"(controller: "general", action:"logout")
        get "/crearTour"(controller: "general", action:"crearTour")
        //get "/editarTour"(controller: "general", action:"editarTour")
        get "/editarTour"(controller: "general", action: "editarTour")
        post "/crearTour/salvar_tour"(controller: "general", action:"salvar_tour")
        post "/editarTour/modificar_tour"(controller: "general", action:"modificar_tour")
        get "/registrar_admin"(controller: "general", action:"registroAdmin")
        post "/registrar_admin/salvar_admin"(controller:"general", action:"salvar_admin")
        get "/reservaTour"(controller:"general", action:"reservaTour")
        post "/reservaTour/salvarReserva"(controller:"general", action:"salvarReserva")
        post"/home/eliminarTour"(controller: "general", action: "eliminarTour")
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
