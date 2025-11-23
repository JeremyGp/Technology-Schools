package com.example.demo.rol;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/rol")
public class RolController {
    
    private final RolService rolService;

    public RolController(RolService rolService) {
        this.rolService = rolService;
    }

    @GetMapping("/lista")
    public String mostrarFormulario(Model model) {
        model.addAttribute("rol", new Rol());
        model.addAttribute("listaRoles", rolService.listaRoles());
        return "gestion";
	}

}
