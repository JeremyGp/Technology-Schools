package com.example.demo.asistencia;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class AsistenciaServiceImpl implements AsistenciaService {
    private final AsistenciaDAO asistenciaDAO;

    public AsistenciaServiceImpl(AsistenciaDAO asistenciaDAO) {
        this.asistenciaDAO = asistenciaDAO;
    }

    @Override
    public List<Asistencia> listarAsistenciasPorUsuario(int usuarioId) {
        return asistenciaDAO.listarAsistenciasPorUsuario(usuarioId);
    }

    @Override
    public void registrarAsistenciaDocente(int alumnoId, String estado) {
        Asistencia asistencia = new Asistencia();
        asistencia.setUsuarioId(alumnoId);
        asistencia.setCategoriaId(1); // lógica por defecto, cambiar si procede
        asistencia.setEstado(estado);
        asistencia.setFecha(new Date(System.currentTimeMillis())); // java.sql.Date
        asistenciaDAO.registrarAsistencia(asistencia);
    }
}
