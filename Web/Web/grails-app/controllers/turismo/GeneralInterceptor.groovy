package turismo


class GeneralInterceptor {

    GeneralInterceptor() {
        matchAll().
                excludes(controller: "login")
    }
    boolean before() {
        if (session.usuario ) {
            return true
        } else {
            println(request.getServletPath());
            if(request.getServletPath().contains("registrar_usuario")){
                return true
            }

            redirect controller: "login", actionName: "index"
            return false
        }
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
