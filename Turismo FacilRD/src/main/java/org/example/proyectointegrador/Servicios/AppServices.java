package org.example.proyectointegrador.Servicios;

import org.example.proyectointegrador.Repositorios.SqlRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class AppServices {

    @Autowired
    SqlRepo sqlRepo;

   public   List<Map<String, Object>> test(){
       return sqlRepo.getQuery("select * from public.table");
    }
}
