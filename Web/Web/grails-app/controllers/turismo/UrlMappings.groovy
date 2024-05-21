package turismo

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        get "/"(redirect: "/home")
        get "/home"(controller: "general", action: "home")
        get "/login"(controller: "login", action: "index")

        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
