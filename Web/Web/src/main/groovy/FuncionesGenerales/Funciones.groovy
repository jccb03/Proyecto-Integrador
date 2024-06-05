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


     BigDecimal normalFormat(Object obj) {

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

     String currencyFormat(Object obj) {
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

}
