package com.example.demo.usuario;

import java.util.List;

public interface UsuarioDAO {
    
    public List<Usuario> listaAlumnos();
    void crearUsuario(Usuario usuario);
    Usuario loginUsuario(Usuario usuario);
    Usuario buscarPorCodigo(String codigo);

    // NECESARIO PARA ASISTENCIAS DOCENTES
    List<Usuario> listaAlumnosConAsistenciaHoy();
}
