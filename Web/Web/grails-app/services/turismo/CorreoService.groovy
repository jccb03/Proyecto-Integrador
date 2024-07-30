package turismo

import grails.gorm.transactions.Transactional

@Transactional
class CorreoService {

    static transactional = true;
    def serviceMethod() {

    }

    def enviarEmailHtml(String[] correo, byte[] archivo, String asunto, String mensaje) {
        def nombre = new Date().toString().md5().toString() + ".pdf";
        sendMail {
            multipart true
            to correo
            from "noreply@turismofacilrd.com"
            subject asunto
            html mensaje
            // attachBytes "Some-File-Name.xml", "text/xml", contentOrder.getBytes("UTF-8")
            //To get started quickly, try the following
            //attachBytes './web-app/images/grails_logo.jpg','image/jpg', new File('./web-app/images/grails_logo.jpg').readBytes()
//              attachBytes nombre, 'application/pdf', archivo;
            attachBytes nombre, 'application/pdf', archivo;

        }
    }

    def enviarEmail(String[] correo, byte[] archivo, String asunto, String mensaje) {

        def nombre = new Date().toString().md5().toString() + ".pdf";
        sendMail {
            multipart true
            to correo
            from "noreply@turismofacilrd.com"
            subject asunto
            body mensaje
            // attachBytes "Some-File-Name.xml", "text/xml", contentOrder.getBytes("UTF-8")
            //To get started quickly, try the following
            //attachBytes './web-app/images/grails_logo.jpg','image/jpg', new File('./web-app/images/grails_logo.jpg').readBytes()
//              attachBytes nombre, 'application/pdf', archivo;
            attachBytes nombre, 'application/pdf', archivo;
        }

    }

    def enviarEmail(String[] correo,  String asunto, String mensaje) {

//        def nombre = new Date().toString().md5().toString() + ".pdf";
        sendMail {
            multipart true
            to correo
            from "noreply@turismofacilrd.com"
            subject asunto
            body mensaje
            // attachBytes "Some-File-Name.xml", "text/xml", contentOrder.getBytes("UTF-8")
            //To get started quickly, try the following
            //attachBytes './web-app/images/grails_logo.jpg','image/jpg', new File('./web-app/images/grails_logo.jpg').readBytes()
//              attachBytes nombre, 'application/pdf', archivo;
//            attachBytes nombre, 'application/pdf', archivo;
        }

    }
}
