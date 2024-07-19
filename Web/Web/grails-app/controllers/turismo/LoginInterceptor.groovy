package turismo
class LoginInterceptor {

    LoginInterceptor(){
        match(controller: "login")
    }

    boolean before() {
        if (request.getServletPath().contains("/iniciar_sesion")){
            return  true;
        }
        if (!session.usuario){
            return   true
        }else {
            if (actionName.equals("logout")){
                return true
            }
            else {
                redirect  controller: "general", actionName: "home"
                return  false
            }
        }
        return true;
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
