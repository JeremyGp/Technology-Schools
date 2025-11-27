package com.example.demo.usuario;

import java.time.LocalDate;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.demo.rol.Rol;
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
            return "registrar";
        }

        // Validar longitud mínima
        if (usuario.getContrasena().length() < 6) {
            model.addAttribute("error", "La contraseña debe tener al menos 6 caracteres");
            return "registrar";
        }

        // Asignar rol por defecto (Alumno)
        Rol rolAlumno = new Rol(1, "Alumno");
        usuario.setRol(rolAlumno);

        usuario.setFechaCreacion(LocalDate.now());
        usuarioService.crearUsuario(usuario);
        return "redirect:/principal/login";
    }

    @GetMapping("/login")
    public String mostrarLogin(Model model){
        return "login";
    }

    @PostMapping("/login")
    public String loginUsuario(@RequestParam("codigo") String codigo,
                               @RequestParam("contrasena") String contrasena,
                               Model model,
                               HttpSession session) {

        System.out.println("=== DEBUG LOGIN ===");
        System.out.println("Código recibido: " + codigo);
        System.out.println("Contraseña recibida: " + contrasena);

        // Buscar usuario por código
        Usuario usuarioDB = usuarioService.buscarPorCodigo(codigo);

        System.out.println("Usuario encontrado: " + (usuarioDB != null ? usuarioDB.getNombre() : "null"));

        // Validar si el usuario existe
        if (usuarioDB == null) {
            model.addAttribute("error", "No existe un usuario con ese código");
            return "login";
        }

        System.out.println("Contraseña en BD: " + usuarioDB.getContrasena());
        System.out.println("Contraseña ingresada: " + contrasena);

        // Validar si la contraseña es correcta
        if (!usuarioDB.getContrasena().equals(contrasena)) {
            model.addAttribute("error", "Contraseña incorrecta");
            return "login";
        }

        System.out.println("Login exitoso para: " + usuarioDB.getNombre());
        System.out.println("Rol: " + usuarioDB.getRol().getNombre() + " (ID: " + usuarioDB.getRol().getId() + ")");

        // Guardar el usuario completo en la sesión
        session.setAttribute("usuarioLogueado", usuarioDB);

        // Redirigir según el rol
        if (usuarioDB.getRol().getId() == 1) {
            System.out.println("Redirigiendo a index (Alumno)");
            return "redirect:/principal/index";
        } else if (usuarioDB.getRol().getId() == 2) {
            System.out.println("Redirigiendo a index (Docente)");
            return "redirect:/principal/index";
        }

        return "redirect:/principal/index";
    }

    @GetMapping("/logout")  //Cambié de @PostMapping a @GetMapping
    public String logoutUsuario(HttpSession session){
        System.out.println("=== LOGOUT EJECUTADO ===");
        if (session != null) {
            Usuario usuario = (Usuario) session.getAttribute("usuarioLogueado");
            if (usuario != null) {
                System.out.println("Cerrando sesión de: " + usuario.getNombre());
            }
            session.invalidate();
        }
        System.out.println("Sesión cerrada exitosamente");
        return "redirect:/principal/index";
    }
}