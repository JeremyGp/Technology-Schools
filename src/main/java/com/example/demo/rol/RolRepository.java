package com.example.demo.rol;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public class RolRepository implements RolDAO{
    
    private final JdbcTemplate jdbcTemplate;

    public RolRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Rol> rowMapper = (rs, rowNum) -> {
        Rol r= new Rol();
            r.setId(rs.getInt("id"));
            r.setNombre(rs.getString("nombre"));
        return r;
    };

    @Override
    public List<Rol> listaRoles() {
        String sql = "SELECT r.id as rol_id, r.nombre as rol_nombre " +
                     "FROM Rol r";
        return jdbcTemplate.query(sql, rowMapper);
    }

}
