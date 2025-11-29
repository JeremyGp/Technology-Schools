package com.example.demo.asistencia;

import java.util.List;

public interface AsistenciaService {
    List<Asistencia> listarAsistenciasPorUsuario(int usuarioId);
    void registrarAsistenciaDocente(int alumnoId, String estado);
}
