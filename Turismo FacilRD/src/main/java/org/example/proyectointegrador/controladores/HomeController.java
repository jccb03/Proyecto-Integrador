package org.example.proyectointegrador.controladores;

import jakarta.servlet.http.HttpSession;
import org.example.proyectointegrador.Servicios.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
public class HomeController {

    @Autowired
    private TourService tourService;

    @GetMapping("/home")
    public String home(Model model, HttpSession session) {
        Map<String, Object> usuario = (Map<String, Object>) session.getAttribute("usuario");
        if (usuario != null) {
            List<Map<String, Object>> tours = tourService.getTodosTours();
            usuario.put("tourTodos", tours);
            model.addAllAttributes(usuario);
        } else {
            model.addAttribute("tourTodos", tourService.getTodosTours());
        }
        return "home"; // Este debe coincidir con el nombre del archivo home.html
    }
}