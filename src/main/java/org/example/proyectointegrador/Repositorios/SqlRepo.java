package org.example.proyectointegrador.Repositorios;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.List;
import java.util.Map;

@Repository
@Transactional
public class SqlRepo {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public List getQuery(String sql, Collection e) {
        return jdbcTemplate.queryForList(sql, e.toArray());
    }

    public List getQuery(String sql) {
        return jdbcTemplate.queryForList(sql);
    }

}
