package com.example.demo.usuario;

import org.springframework.jdbc.core.RowMapper;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.demo.rol.Rol;


@Repository
public class UsuarioRepository implements UsuarioDAO {
    private final JdbcTemplate jdbcTemplate;

    public UsuarioRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Usuario> UsuariorowMapper = (rs, rowNum) -> {
        Rol rol= new Rol(
            rs.getInt("rol_id"),
            rs.getString("rol_nombre")
        );
        Usuario u = new Usuario(
            rs.getInt("id"),
            rs.getString("nombre"),
            rs.getString("email"),
            rs.getString("codigo"),
            rs.getString("contrasena"),
            rs.getDate("fechaCreacion") != null ? rs.getDate("fechaCreacion").toLocalDate() : null, 
            rol
        );
        return u;
    };

    @Override
    public List<Usuario> listaAlumnos() {
        String sql = "SELECT u.id as id, u.nombre as nombre, u.email as email, u.codigo as codigo, u.contrasena as contrasena, u.fechaCreacion as fechaCreacion, r.id as rol_id, r.nombre as rol_nombre " +
                     "FROM Usuario u " +
                     "JOIN Rol r ON u.rol_id = r.id ";
        return jdbcTemplate.query(sql, UsuariorowMapper);
    }

    @Override
    public void crearUsuario(Usuario usuario) {
        String sql = "INSERT INTO Usuario (nombre, email, codigo, contrasena, fechaCreacion, rol_id) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                usuario.getNombre(),
                usuario.getEmail(),
                usuario.getCodigo(),
                usuario.getContrasena(),
                java.sql.Date.valueOf(usuario.getFechaCreacion()),
                usuario.getRol().getId()  //Ahora usa el rol del usuario
        );
    }

    @Override
    public Usuario loginUsuario(Usuario usuario) { 
        String sql = "SELECT u.id as id, u.nombre as nombre, u.email as email, u.codigo as codigo, u.contrasena as contrasena, u.fechaCreacion as fechaCreacion, r.id as rol_id, r.nombre as rol_nombre " +
                    "FROM Usuario u " +
                    "JOIN Rol r ON u.rol_id = r.id " +
                    "WHERE u.codigo = ? AND u.contrasena = ?";
        List<Usuario> usuarios = jdbcTemplate.query(sql, UsuariorowMapper, usuario.getCodigo(), usuario.getContrasena());
        return usuarios.isEmpty() ? null : usuarios.get(0);
    }

    @Override
    public Usuario buscarPorCodigo(String codigo) {
        String sql = "SELECT u.id as id, u.nombre as nombre, u.email as email, u.codigo as codigo, u.contrasena as contrasena, u.fechaCreacion as fechaCreacion, r.id as rol_id, r.nombre as rol_nombre " +
                     "FROM Usuario u " +
                     "JOIN Rol r ON u.rol_id = r.id " +
                     "WHERE u.codigo = ?";
        List<Usuario> usuarios = jdbcTemplate.query(sql, UsuariorowMapper, codigo);
        return usuarios.isEmpty() ? null : usuarios.get(0); 
    }
}
