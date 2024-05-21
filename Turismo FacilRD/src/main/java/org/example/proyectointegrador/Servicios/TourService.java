package org.example.proyectointegrador.Servicios;

import org.example.proyectointegrador.Repositorios.TourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class TourService {

    @Autowired
    private TourRepository tourRepository;

    public List<Map<String, Object>> getTodosTours() {
        return tourRepository.findTodosTours();
    }
}
