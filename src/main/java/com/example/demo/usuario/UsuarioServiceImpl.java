package com.example.demo.usuario;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class UsuarioServiceImpl implements UsuarioService {
    
    private final UsuarioDAO usuarioDAO;

    public UsuarioServiceImpl(UsuarioDAO clienteDAO) {
        this.usuarioDAO = clienteDAO;
    }

    @Override
    public List<Usuario> listaAlumnos() {
        return usuarioDAO.listaAlumnos();
    }

    @Override
    public void crearUsuario(Usuario usuario) {
        usuarioDAO.crearUsuario(usuario);
    }

    @Override
    public Usuario loginUsuario(Usuario usuario) { 
        usuarioDAO.loginUsuario(usuario);
        return usuario;
    }

    @Override
    public Usuario buscarPorCodigo(String codigo) {
        return usuarioDAO.buscarPorCodigo(codigo);
    }

    @Override
    public List<Usuario> listaAlumnosConAsistenciaHoy() {
        return usuarioDAO.listaAlumnosConAsistenciaHoy();
    }


}
