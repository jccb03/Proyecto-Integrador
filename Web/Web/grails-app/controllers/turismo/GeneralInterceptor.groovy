package turismo


class GeneralInterceptor {

    GeneralInterceptor() {
        matchAll().
                excludes(controller: "login")
    }

    boolean before() {
        if (session.usuario) {
            def usuario = session.usuario
            def requestPath = request.getServletPath()

            if (requestPath.contains("crearTour") || requestPath.contains("registrar_admin")) {
                if (!usuario.administrador) {
                    redirect(controller: "general", action: "index")
                    return false
                }
            }
            return true
        } else {
            if(request.getServletPath().contains("registrar_usuario")){
                return true
            }
            redirect(controller: "login", action: "index")
            return false
        }
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}

