package com.example.demo.asistencia;

import java.util.List;

public interface AsistenciaDAO {
    List<Asistencia> listarAsistenciasPorUsuario(int usuarioId);
    void registrarAsistencia(Asistencia asistencia);
    Asistencia buscarPorId(int id);
}
