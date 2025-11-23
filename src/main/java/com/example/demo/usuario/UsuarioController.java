package com.example.demo.usuario;

import java.time.LocalDate;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.rol.RolService;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/usuario")
public class UsuarioController {
    private final UsuarioService usuarioService;
    private final RolService rolService;


    public UsuarioController(UsuarioService usuarioService, RolService rolService) {
        this.usuarioService = usuarioService;
        this.rolService = rolService;
    }

    @GetMapping("/lista")
    public String mostrarLista(Model model) {
        model.addAttribute("usuarios", usuarioService.listaAlumnos());
        model.addAttribute("roles", rolService.listaRoles());
        return "gestion";
    }

    @GetMapping("/registrar")
    public String mostrarFormulario(Model model){
        model.addAttribute("usuario", new Usuario());
        return "registrar";
    }

    @PostMapping("/registrar")
    public String crearUsuario(@ModelAttribute("usuario") Usuario usuario, Model model){
        // Validar que las contraseñas coincidan
        if (!usuario.getContrasena().equals(usuario.getConfirmarContrasena())) {
            model.addAttribute("error", "Las contraseñas no coinciden");
            return "registrar"; // vuelve al formulario con el error
        }

        // Validar longitud mínima
        if (usuario.getContrasena().length() < 6) {
            model.addAttribute("error", "La contraseña debe tener al menos 6 caracteres");
            return "registrar";
        }
        usuario.setFechaCreacion(LocalDate.now()); //Establece fecha de creacion actual
        usuarioService.crearUsuario(usuario); //Guarda el usuario en la base de datos
        return "redirect:/principal/login"; //Redirige al login despues de registrarse
    }
    
    @GetMapping("/login")
    public String mostrarLogin(Model model){
        model.addAttribute("usuario", new Usuario());
        return "login";
    }

    @PostMapping("/login")
    public String loginUsuario(@ModelAttribute("usuario") Usuario usuario, Model model, HttpSession session){
        Usuario usuarioDB = usuarioService.buscarPorCodigo(usuario.getCodigo()); //Busca el usuario por email
        //validar si el usuario existe
        if (usuarioDB == null) {
            model.addAttribute("error", "No existe un usuario con ese codigo");
            return "login";
        }
        //valida si la contraseña es correcta
        if (!usuarioDB.getContrasena().equals(usuario.getContrasena())) {
            model.addAttribute("error", "Contraseña incorrecta");
            return "login";
        }

        session.setAttribute("usuarioLogueado", usuarioDB); //Guarda el usuario en la sesion
        
        return "redirect:/principal/index"; //Redirige al la pagina principal despues de iniciar sesion
    }

    @PostMapping("/logout")
    public String logoutUsuario(HttpSession session){
        session.invalidate(); //Invalida la sesion actual
        return "redirect:/principal/index";
    }
}
