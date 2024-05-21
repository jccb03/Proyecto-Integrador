package FuncionesGenerales

import groovy.json.JsonOutput

import javax.imageio.ImageIO
import java.awt.Graphics2D
import java.awt.RenderingHints
import java.awt.image.BufferedImage
import java.sql.Timestamp
import java.text.NumberFormat
import java.text.SimpleDateFormat

class Funciones {

    static Map respuesta(Boolean status, Object informacion){
        Map mapa = new HashMap();
        mapa.put("f_key",status);
        mapa.put("f_data",informacion);
        return mapa;
    }

    List<Map<String, Object>> tipoDashoard() {
        List lista = new ArrayList();
        lista.add(["f_idrecord": 0, "f_descripcion": "--NINGUNO--"]);
        lista.add(["f_idrecord": 1, "f_descripcion": "PUNTO VENTA Y/O NORMAL"]);
        return lista;

    }
    static BigDecimal NormalFormat(Object obj) {

        try {
            if (!obj.toString().equals("")) {
                obj = obj.toString()
                        .replace(',', '')
                        .replace('f', '')
                        .replace('d', '')
                        .replace('F', '')
                        .replace('D', '')
                        .replace('$', '')
                        .replace('RD', '')
                        .replace('USD', '')
                        .replace('EUR', '')
                        .replace(';', '');
                if (obj.isNumber()) {
                    return obj.toBigDecimal();
                } else {
                    return 0
                }
            }
            return 0
        } catch (Exception e) {
            return 0
        }
    }

    static String CurrencyFormat(Object obj) {
        NumberFormat fm = NumberFormat.getCurrencyInstance(new Locale('en'));
        try {
            if (obj.toString().substring(0, 1).equals("-")) {
                return "-" + fm.format(obj).substring(2, fm.format(obj).length());
            } else {
                return fm.format(obj).substring(1, fm.format(obj).length());
            }
        } catch (Exception e) {
            return fm.format(0).substring(1, fm.format(0).length());
        }
    }

    static String formatDate(Date fecha, String formato) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(formato)
        return simpleDateFormat.format(fecha)
    }

    static String formatDate(Timestamp fecha, String formato) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(formato)
        return simpleDateFormat.format(fecha)
    }




    String RellenarString(String valor, Integer tamano) {
        Integer valortamano = valor.length()

        if (valortamano > tamano) {
            valor = valor.substring(0, tamano)
        }
        if (valortamano < tamano) {
            valor = String.format('%1$-' + tamano.toString() + "s", valor)
        }
        return valor
    }


    String alinearAlaDerecha(String parametro, int limite) {
        String espacio = " ", a = ""
        if (limite == 0) {
            limite = 40
        }
        for (int i = 0; i < (limite - parametro.length()); i++) {
            a = a + espacio
        }
        parametro = a + parametro
        return parametro
    }

    String alinearCentro(String texto, Integer numero) {

        if (texto.length() > numero) {
            texto = Asignar_tres_puntos(texto, numero)
        }
        String valor =
                RellenarString('', ((numero - texto.length()) / 2).toInteger()) +
                        texto +
                        RellenarString('', numero - (((numero - texto.length()) / 2).toInteger() + texto.length()))
        return valor
    }

    String Asignar_tres_puntos(String valor, Integer tamano) {
        Integer valortamano = valor.trim().length()
        String aux = valor
        if (valortamano >= tamano) {
            aux = valor.substring(0, tamano - 3) + '...'
        }
        return aux
    }


    String getBarcodeEscPosCodeEpson() {

        byte[] barcode = [29, 107, 67, 12]
        return new String(barcode)
    }

    String AddLinea(String valor, Integer tamano) {

        String linea = ''
        for (int i = 1; i <= tamano; i++) {
            linea = linea + valor
        }
        return linea
    }

    String cortarPapelPrinter() {

        byte[] cortar = [27, 100, 2, 27, 105]
        return new String(cortar)
    }

    private String getFileExtension(String name) {
        String extension = "";
        try {
            extension = name.substring(name.lastIndexOf("."));
        } catch (Exception e) {
            extension = "";
        }
        return extension;
    }

    String negrita(boolean enabled) {
        final byte[] EmphasizedOff = [27, 70];
        final byte[] EmphasizedOn = [27, 69];

        String s = "";
        if (enabled) {
            s = new String(EmphasizedOn);
        } else {
            s = new String(EmphasizedOff);
        }
        return s;
    }

    String getBarcodeEscPosCodeStart(String codigo) {
        String s = "";
        byte[] bytes = [27, 98, 54, 50, 50, 70];

        s += new String(bytes);
        s += codigo;
        bytes = [30];
        s += new String(bytes);
        System.err.println("CODE " + s);
        return s;
    }

    def ReducirAumentarImagen(byte[] file, int MAX_WIDTH, int MAX_HEIGHT) {


//        BufferedImage bimage = loadImage(file);
        InputStream is = new ByteArrayInputStream(file);
        BufferedImage bimage = ImageIO.read(is);
        if (bimage.getHeight() > bimage.getWidth()) {
            int heigt = (bimage.getHeight() * MAX_WIDTH) / bimage.getWidth();
            bimage = resize(bimage, MAX_WIDTH, heigt);
            int width = (bimage.getWidth() * MAX_HEIGHT) / bimage.getHeight();
            bimage = resize(bimage, width, MAX_HEIGHT);
        } else {
            int width = (bimage.getWidth() * MAX_HEIGHT) / bimage.getHeight();
            bimage = resize(bimage, width, MAX_HEIGHT);
            int heigt = (bimage.getHeight() * MAX_WIDTH) / bimage.getWidth();
            bimage = resize(bimage, MAX_WIDTH, heigt);
        }
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(bimage, "jpg", baos);
        byte[] bytes_foto = baos.toByteArray();
        return bytes_foto;
    }

    public BufferedImage resize(BufferedImage bufferedImage, int newW, int newH) {
        int w = bufferedImage.getWidth();
        int h = bufferedImage.getHeight();
        BufferedImage bufim = new BufferedImage(newW, newH, bufferedImage.getType());
        Graphics2D g = bufim.createGraphics();
        g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        g.drawImage(bufferedImage, 0, 0, newW, newH, 0, 0, w, h, null);
        g.dispose();
        return bufim;
    }

    public BufferedImage loadImage(File file) {
        BufferedImage bimage = null;
        try {
            bimage = ImageIO.read(file);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bimage;
    }

    def enviarServerPrint(String factura) {
        try {

            return imprimirDocumentoPos(factura.getBytes())
        } catch (Exception e) {
            e.printStackTrace()
            return false;
        }
    }

    String imprimirDocumentoPos(byte[] documento) {
        Map map = new HashMap()
        String t = "lioerp-" + formatDate(new Date(), "yyyy-MM-dd")
        map.token = t.encodeAsMD5()
        map.byteFormat = false
        map.printer = ""
        map.document = documento.encodeBase64().toString()
//        String json = "json="+JsonOutput.toJson(map)
        String json = JsonOutput.toJson(map)
        return json;
    }

//    Map imprimirDocumentoPosOld(byte[] documento) {
//        Map map = new HashMap()
//        String t = "rextek-" + formatDate(new Date(), "yyyy-MM-dd")
//        map.token = t.md5()
//        map.byteFormat = false
//        map.printer = ""
//        map.document = documento.encodeBase64().toString()
//        String json = "json=" + JsonOutput.toJson(map)
//        try {
//            URL url = new URL("http://localhost:4567/rextek/print");
//            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//            conn.setRequestMethod("POST");
//            conn.setDoOutput(true)
//            OutputStream os = conn.getOutputStream()
//            byte[] input = json.getBytes("utf-8");
//            os.write(input, 0, input.length);
//            BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
//            Map response = new JsonSlurper().parse(br.readLine().getBytes()) as Map
//            return response;
//        } catch (Exception e) {
//            e.printStackTrace()
//            return [error: -1]
//        }
//
//
//    }

}
