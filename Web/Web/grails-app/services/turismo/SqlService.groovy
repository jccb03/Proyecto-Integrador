package turismo
import grails.gorm.transactions.Transactional
import grails.util.Holders
import org.springframework.dao.EmptyResultDataAccessException
import org.springframework.jdbc.core.JdbcTemplate
import java.sql.Timestamp

@Transactional
class SqlService {
    static transactional = true;
    def dataSource = Holders.getGrailsApplication().mainContext.getBean("dataSource");

    def Date GetNow() {
        def template = new JdbcTemplate(dataSource);
        return template.queryForObject("select now()", Date.class);
    }
    def Date GetNowDate() {
        def template = new JdbcTemplate(dataSource);
        return template.queryForObject("select now()::Date", Date.class);
    }

    def getQueryForObject(String sql, Collection collection, Class aClass) {
        try{
            def template = new JdbcTemplate(dataSource);
            return template.queryForObject(sql,collection.toArray(), aClass);
        }catch (EmptyResultDataAccessException e) {
            return  null;
        }catch (Exception e) {
            e.printStackTrace()
            return  null;
        }

    }

    def getQueryForObject(String sql, Class aClass) {
        try{
            def template = new JdbcTemplate(dataSource);
            return template.queryForObject(sql, aClass);
        }catch (EmptyResultDataAccessException e) {
            return  null;
        }catch (Exception e) {
            e.printStackTrace()
            return  null;
        }
    }

    def String GetFechaFormato(String fecha) {
        def template = new JdbcTemplate(dataSource);
//        println(fecha)
        return template.queryForObject("select to_char('$fecha'::TIMESTAMP, 'yyyy/MM/dd HH:MI:SS')", String.class);

    }

    def String GetFechaFormato(String fecha, String formato) {
        def template = new JdbcTemplate(dataSource);
//        println(fecha)
        return template.queryForObject("select to_char('$fecha'::TIMESTAMP, '$formato')", String.class);

    }

    def String GetDiaFecha(String fecha) {
        def template = new JdbcTemplate(dataSource);
        return template.queryForObject("select  EXTRACT(DOW FROM '$fecha'::timestamp) as f_dia", String.class);

    }

    def Integer GetSecuencia(String tipodocumento, Long empresa) {
        def template = new JdbcTemplate(dataSource);
        String sql = "select get_secuencia('${tipodocumento.toUpperCase()}',$empresa)";
        Integer a = template.queryForObject(sql, Integer.class);
        return a;
    }

    BigDecimal GetCreditoDisponibleCliente(Long empresa, Long idcliente) {
        def template = new JdbcTemplate(dataSource);
        String sql = "select cxcp.get_credito_disponible($empresa,$idcliente)";
        BigDecimal monto = template.queryForObject(sql, BigDecimal.class);
        return monto;
    }

    String GetSecuenciaNcf(Long id) {
        def template = new JdbcTemplate(dataSource);
        String sql = "SELECT get_secuencia_ncf($id)";
        return template.queryForObject(sql, String.class);
    }

    def Beginwork() {
        def template = new JdbcTemplate(dataSource);
        template.execute("BEGIN WORK;");

    }

    def ejecutarQuery(String sql) {
        try
        {
            def template = new JdbcTemplate(dataSource);
            template.execute(sql);
        }catch (Exception e) {
            e.printStackTrace()
        }

    }
    def Commit() {
        def template = new JdbcTemplate(dataSource);
        template.execute("COMMIT WORK;");
    }

    def String Get_Concatenar_tipo_numero_to_char(String tipo, String numero, Integer cantidad) {
        String ceros = "";

        for (int i = 0; i < cantidad; i++) {
            ceros = ceros + "0";
        }
        def template = new JdbcTemplate(dataSource);
        String a = template.queryForObject("SELECT '$tipo'||to_char($numero,'FM$ceros');", String.class);
        return a.toString();
    }

    def List<Map<String, Object>> getQuery(String sql) {
        try {
            def template = new JdbcTemplate(dataSource);
            return template.queryForList(sql);
        }catch (Exception e) {
            e.printStackTrace()
            return  Collections.EMPTY_LIST
        }

    }

    def Map<String, Object> getQueryMap(String sql) {
        try {
            def template = new JdbcTemplate(dataSource);
            return template.queryForMap(sql);
        } catch (EmptyResultDataAccessException e) {
            return  [:];
        }catch (Exception e) {
            e.printStackTrace()
            return  [:];
        }
    }

    def Map<String, Object> getQueryMap(String sql, Collection collection) {
        try {
            def template = new JdbcTemplate(dataSource);
            return template.queryForMap(sql, collection.toArray());
        } catch (EmptyResultDataAccessException e) {
            return  [:];
        }catch (Exception e) {
            e.printStackTrace()
            return  [:];
        }
    }

    def List<Map<String, Object>> getQuery(String sql, Collection params) {

        try{
            def template = new JdbcTemplate(dataSource);
            return template.queryForList(sql, params.toArray());
        }catch (Exception e) {
            e.printStackTrace()
            Collections.EMPTY_LIST;
        }

    }

    def Timestamp Get_Sumar_Dias(Date fecha_inicial, Integer dias) {
        def template = new JdbcTemplate(dataSource);
        String f1 = fecha_inicial.format("yyyy-MM-dd");
        Timestamp a = template.queryForObject("SELECT ('$f1'::date +'$dias days'::INTERVAL )::TIMESTAMP", Timestamp.class);
        return a;
    }


    def Timestamp Get_sumar_Horas(Timestamp fecha_inicial, Integer horas) {
        def template = new JdbcTemplate(dataSource);
//        String f1=fecha_inicial.format("yyyy-MM-dd");
        String f1 = fecha_inicial;
        Timestamp a = template.queryForObject("SELECT ('$f1'::TIMESTAMP + interval '$horas hour')", Timestamp.class);
        return a;
    }

    def GetDiferenciasDias(Date fecha_inicial, Date fecha_final) {
        def template = new JdbcTemplate(dataSource);
        String f1 = fecha_inicial;
        Integer a = template.queryForObject("select extract(days from (timestamp '${fecha_final.format("yyyy-MM-dd")}' - timestamp '${fecha_inicial.format("yyyy-MM-dd")}'))::INTEGER ", Integer.class);
        return a;
    }


    def Timestamp Get_Restar_Dias(Date fecha_inicial, Integer dias) {
        def template = new JdbcTemplate(dataSource);
        String f1 = fecha_inicial.format("yyyy-MM-dd");
        Timestamp a = template.queryForObject("SELECT ('$f1'::date -'$dias days'::INTERVAL )::TIMESTAMP", Timestamp.class);
        return a;
    }

    def Date Get_Restar_Dias(Timestamp fecha_inicial, Integer dias) {
        def template = new JdbcTemplate(dataSource);
        String f1 = fecha_inicial.format("yyyy-MM-dd");
        Date a = template.queryForObject("SELECT ('$f1'::date -'$dias days'::INTERVAL )::DATE ", Date.class);
        return a;
    }

    def Date Get_Sumar_Dias(Timestamp fecha_inicial, Integer dias) {
        def template = new JdbcTemplate(dataSource);
        String f1 = fecha_inicial.format("yyyy-MM-dd");
        Date a = template.queryForObject("SELECT ('$f1'::date +'$dias days'::INTERVAL )::DATE ", Date.class);
        return a;
    }

    
    def serviceMethod() {

    }
}
