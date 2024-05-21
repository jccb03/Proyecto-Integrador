package turismo

class GeneralController {

    def index() { }

//     pude ser def o void
    def home (){
        render( view: "/general/home");
    }
}
