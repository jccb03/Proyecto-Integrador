package turismo


class GeneralInterceptor {

    GeneralInterceptor() {
        matchAll().
                excludes(controller: "login")
    }

    boolean before() {
        def requestPath = request.getServletPath()

        if (requestPath.contains("home")
        ){
            return true;
        }
        if (session.usuario) {
            def usuario = session.usuario

            if (requestPath.contains("crearTour") || requestPath.contains("registrar_admin") || requestPath.contains("editarTour")) {
                if (!usuario.administrador) {
                    redirect(controller: "general", action: "home")
                    return false
                }
            }
            return true
        } else {
            if(request.getServletPath().contains("registrar_usuario")){
                return true
            }
            redirect(controller: "general", action: "home")
            return false
        }
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}

