package com.example.demo.usuario;

import java.util.List;

public interface UsuarioService {
    
    public List<Usuario> listaAlumnos();
    void crearUsuario(Usuario usuario);
    Usuario loginUsuario(Usuario usuario);
    Usuario buscarPorCodigo(String email);
}
