package com.example.demo.usuario;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class UsuarioServiceImpl implements UsuarioService {
    
    private final UsuarioDAO clienteDAO;

    public UsuarioServiceImpl(UsuarioDAO clienteDAO) {
        this.clienteDAO = clienteDAO;
    }

    @Override
    public List<Usuario> listaAlumnos() {
        return clienteDAO.listaAlumnos();
    }

    @Override
    public void crearUsuario(Usuario usuario) {
        clienteDAO.crearUsuario(usuario);
    }

    @Override
    public Usuario loginUsuario(Usuario usuario) { 
        clienteDAO.loginUsuario(usuario);
        return usuario;
    }

    @Override
    public Usuario buscarPorCodigo(String codigo) {
        return clienteDAO.buscarPorCodigo(codigo);
    }

}
