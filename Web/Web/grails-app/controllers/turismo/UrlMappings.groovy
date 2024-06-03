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
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
