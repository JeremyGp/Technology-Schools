package com.example.demo.config;
import com.example.demo.usuario.Usuario;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AuthInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession(false);

        // Rutas públicas que no requieren autenticación
        String uri = request.getRequestURI();
        if (uri.contains("/login") || uri.contains("/registrar") ||
                uri.contains("/index") || uri.contains("/nosotros") ||
                uri.contains("/contacto") || uri.contains("/eventos") ||
                uri.contains("/matriculas") ||
                uri.contains("/css/") || uri.contains("/js/") || uri.contains("/images/")) {
            return true;
        }

        // Verificar si hay sesión activa
        if (session == null || session.getAttribute("usuarioLogueado") == null) {
            response.sendRedirect("/principal/login");
            return false;
        }

        return true;
    }
}