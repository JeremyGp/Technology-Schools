package com.example.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/principal")
public class MiControlador {
    

    @GetMapping("/contacto")
    public String contacto(Model model) {
        return "contacto";
    }


    @GetMapping("/gestion")
    public String gestion(Model model) {
        return "redirect:/usuario/lista";
    }

    @GetMapping("/eventos")
    public String eventos(Model model) {
        return "eventos";
    }

    @GetMapping("/nosotros")
    public String nosotros(Model model) {
        return "nosotros";
    }
    
    @GetMapping("/metricas")
    public String metricas(Model model) {
        return "metricas";
    }

    @GetMapping("/asistencias")
    public String asistencias(Model model) {
        return "asistencias";
    }
    
    @GetMapping("/docentes")
    public String docentes(Model model) {
        return "docentes";
    }

    @GetMapping("/index")
    public String index(Model model) {
        return "index";
    }

    @GetMapping("/carrito")
    public String carrito(Model model) {
        return "carrito";
    }

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("usuario", new com.example.demo.usuario.Usuario());
        return "login";
    }

    @GetMapping("/registrar")
    public String registrar(Model model) {
        model.addAttribute("usuario", new com.example.demo.usuario.Usuario());
        return "registrar";
    }

}
