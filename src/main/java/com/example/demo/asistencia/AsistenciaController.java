package com.example.demo.asistencia;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.usuario.Usuario;
import com.example.demo.usuario.UsuarioService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/asistencia")
public class AsistenciaController {

    private final UsuarioService usuarioService;
    private final AsistenciaService asistenciaService;

    public AsistenciaController(UsuarioService usuarioService,
                                AsistenciaService asistenciaService) {
        this.usuarioService = usuarioService;
        this.asistenciaService = asistenciaService;
    }

    @GetMapping("/vista")
    public String asistencias(HttpSession session, Model model) {

        Usuario usuarioLogueado = (Usuario) session.getAttribute("usuarioLogueado");

        if (usuarioLogueado == null) {
            return "redirect:/principal/login";
        }

        // Alumno
        if (usuarioLogueado.getRol().getId() == 1) {
            List<Asistencia> asistencias = asistenciaService.listarAsistenciasPorUsuario(usuarioLogueado.getId());
            model.addAttribute("asistencias", asistencias);
            return "asistencias";
        }

        // Docente
        if (usuarioLogueado.getRol().getId() == 2) {
            List<Usuario> alumnos = usuarioService.listaAlumnosConAsistenciaHoy();
            model.addAttribute("alumnos", alumnos);
            return "docentes";
        }

        return "redirect:/principal/index";
    }

    @PostMapping("/guardar")
    public String guardarAsistencias(HttpServletRequest request) {

        // Nota: usamos "idAlumno" (sin []) — el JSP debe usar name="idAlumno"
        String[] idsAlumnos = request.getParameterValues("idAlumno");

        if (idsAlumnos == null || idsAlumnos.length == 0) {
            System.out.println("[AsistenciaController] No llegaron IDs de alumnos. Formulario vacío?");
            return "redirect:/asistencia/vista";
        }

        for (String id : idsAlumnos) {
            try {
                int alumnoId = Integer.parseInt(id.trim());
                String estado = request.getParameter("estado_" + alumnoId);
                if (estado == null) {
                    System.out.println("[AsistenciaController] Estado nulo para alumno " + alumnoId + " — salto");
                    continue;
                }
                System.out.println("[AsistenciaController] Guardando -> ID: " + alumnoId + " Estado: " + estado);
                asistenciaService.registrarAsistenciaDocente(alumnoId, estado);
            } catch (NumberFormatException ex) {
                System.out.println("[AsistenciaController] ID no numérico: " + id);
            } catch (Exception ex) {
                System.out.println("[AsistenciaController] Error guardando asistencia para id=" + id + " -> " + ex.getMessage());
                ex.printStackTrace();
            }
        }

        return "redirect:/asistencia/vista";
    }
}
