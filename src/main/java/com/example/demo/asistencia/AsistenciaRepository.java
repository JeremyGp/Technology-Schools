package com.example.demo.asistencia;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public class AsistenciaRepository implements AsistenciaDAO {
    private final JdbcTemplate jdbcTemplate;

    public AsistenciaRepository (JdbcTemplate jdbcTemplate){
        this.jdbcTemplate=jdbcTemplate;
    }

    private final RowMapper<Asistencia> asistenciaRowMapper = (rs, rowNum) -> {
        Asistencia asistencia = new Asistencia();
        asistencia.setId(rs.getInt("id"));
        asistencia.setEstado(rs.getString("estado"));
        asistencia.setUsuarioId(rs.getInt("usuario_id"));
        asistencia.setCategoriaId(rs.getInt("categoria_id"));
        // rs.getDate puede devolver java.sql.Date
        Date fechaSql = rs.getDate("fecha");
        asistencia.setFecha(fechaSql);
        return asistencia;
    };

    @Override
    public List<Asistencia> listarAsistenciasPorUsuario(int usuarioId) {
        String sql = "SELECT * FROM Asistencia WHERE usuario_id = ? ORDER BY fecha DESC";
        return jdbcTemplate.query(sql, asistenciaRowMapper, usuarioId);
    }

    @Override
    public void registrarAsistencia(Asistencia asistencia) {
        // Parametros ya preparados
        Integer usuarioId = asistencia.getUsuarioId();
        java.sql.Date fecha = asistencia.getFecha();
        String estado = asistencia.getEstado();
        Integer categoriaId = asistencia.getCategoriaId();

        try {
            //comprueba si ya existe asistencia para ese usuario y la fecha
            String sqlCheck = "SELECT COUNT(*) FROM Asistencia WHERE usuario_id = ? AND fecha = ?";
            Integer count = jdbcTemplate.queryForObject(sqlCheck, Integer.class, usuarioId, fecha);

            if (count != null && count > 0) {
                //si existe: hace un update
                String sqlUpdate = "UPDATE Asistencia SET estado = ?, categoria_id = ? WHERE usuario_id = ? AND fecha = ?";
                int updated = jdbcTemplate.update(sqlUpdate, estado, categoriaId, usuarioId, fecha);
                System.out.println("[AsistenciaRepository] UPDATE executed, rows=" + updated + " for usuario=" + usuarioId + " fecha=" + fecha);
            } else {
                //si no existe: hacer insert
                String sqlInsert = "INSERT INTO Asistencia (estado, usuario_id, categoria_id, fecha) VALUES (?, ?, ?, ?)";
                int inserted = jdbcTemplate.update(sqlInsert, estado, usuarioId, categoriaId, fecha);
                System.out.println("[AsistenciaRepository] INSERT executed, rows=" + inserted + " for usuario=" + usuarioId + " fecha=" + fecha);
            }
        } catch (Exception ex) {
            // log para depuración: imprime la excepción en consola
            System.out.println("[AsistenciaRepository] Error en registrarAsistencia: " + ex.getMessage());
            ex.printStackTrace();
            throw ex; // re-lanzar para que el service/controller puedan manejarlo si es necesario
        }
    }


    @Override
    public Asistencia buscarPorId(int id) {
        String sql = "SELECT * FROM Asistencia WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, asistenciaRowMapper, id);
    }
}
