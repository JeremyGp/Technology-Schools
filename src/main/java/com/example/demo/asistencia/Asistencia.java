package com.example.demo.asistencia;

import java.sql.Date;

public class Asistencia {
    private int id;
    private String estado;
    private int usuarioId;
    private int categoriaId;
    private Date fecha;

    // ===== CONSTRUCTORES =====
    public Asistencia() {}

    public Asistencia(int id, String estado, int usuarioId, int categoriaId, Date fecha) {
        this.id = id;
        this.estado = estado;
        this.usuarioId = usuarioId;
        this.categoriaId = categoriaId;
        this.fecha = fecha;
    }

    // ===== GETTERS & SETTERS =====

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public int getCategoriaId() {
        return categoriaId;
    }

    public void setCategoriaId(int categoriaId) {
        this.categoriaId = categoriaId;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
}
