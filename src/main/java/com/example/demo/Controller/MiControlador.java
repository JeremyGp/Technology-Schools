package com.example.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.usuario.Usuario;
import jakarta.servlet.http.HttpSession;

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
    public String asistencias(HttpSession session, Model model) {
        Usuario usuarioLogueado = (Usuario) session.getAttribute("usuarioLogueado");

        // Si no hay sesión, redirigir al login
        if (usuarioLogueado == null) {
            return "redirect:/principal/login";
        }

        // Verificar el rol del usuario
        // rol_id = 1 → Alumno
        // rol_id = 2 → Profesor/Docente
        if (usuarioLogueado.getRol().getId() == 1) {
            // Es alumno → mostrar vista de asistencias de alumnos
            return "asistencias";
        } else if (usuarioLogueado.getRol().getId() == 2) {
            // Es docente → mostrar vista de asistencias de docentes
            return "docentes";
        } else {
            // Rol desconocido, redirigir al inicio
            return "redirect:/principal/index";
        }
    }
    
    @GetMapping("/docentes")
    public String docentes(HttpSession session, Model model) {
        Usuario usuarioLogueado = (Usuario) session.getAttribute("usuarioLogueado");

        if (usuarioLogueado == null) {
            return "redirect:/principal/login";
        }

        // Solo los docentes pueden acceder directamente
        if (usuarioLogueado.getRol().getId() == 2) {
            return "docentes";
        } else {
            // Si es alumno, redirigir a su vista
            return "redirect:/principal/asistencias";
        }
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
