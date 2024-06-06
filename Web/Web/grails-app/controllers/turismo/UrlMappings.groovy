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
        post "/crearTour/salvar_tour"(controller: "general", action:"salvar_tour")
        get "/registrar_admin"(controller: "general", action:"registroAdmin")
        post "/registrar_admin/salvar_admin"(controller:"general", action:"salvar_admin")
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
