package org.example.proyectointegrador.Repositorios;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class TourRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Map<String, Object>> findTodosTours() {
        String sql = "SELECT A.ID, U.NOMBRE AS AUTOR, A.nombre, A.descripcion, A.FECHA, A.AGENCIA " +
                "FROM tour A INNER JOIN usuario U ON A.autor = U.id";
        return jdbcTemplate.queryForList(sql);
    }
}