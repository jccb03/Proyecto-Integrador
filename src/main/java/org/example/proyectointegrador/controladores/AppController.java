package org.example.proyectointegrador.controladores;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.proyectointegrador.Servicios.AppServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@RestController
@RequestMapping(path = "/app")
public class AppController {

    @Autowired
    AppServices appServices;
    @RequestMapping(value = "/test",method = RequestMethod.GET)
    List test(HttpServletRequest request, HttpServletResponse response){
        List<Map<String, Object>>  list = appServices.test();
        return list;
    }
}
