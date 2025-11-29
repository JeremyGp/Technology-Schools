package com.example.demo.usuario;

import java.time.LocalDate;

import com.example.demo.rol.Rol;

public class Usuario {
    private int id;
    private String nombre;
    private String email;
    private String codigo;
    private String contrasena;
    private Rol rol;
    private LocalDate fechaCreacion;

    private String estadoAsistencia; // no va a la BD


    private transient String confirmarContrasena; //campo temporal para confirmar contraseña

    public Usuario(int id, String nombre, String email, String codigo, String contrasena, LocalDate fechaCreacion, Rol rol) {
        this.id = id;
        this.nombre = nombre;
        this.email = email;
        this.codigo = codigo;
        this.contrasena = contrasena;
        this.fechaCreacion = fechaCreacion;
        this.rol = rol;
    }


    public Usuario() {
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getEmail(){
        return email;
    }
    public void setEmail(String email) {
        this.email=email;
    }

    public String getCodigo() {
        return codigo;
    }
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    public String getContrasena() {
        return contrasena;
    }
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    public LocalDate getFechaCreacion() {
        return fechaCreacion;
    }
    public void setFechaCreacion(LocalDate fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    public Rol getRol() {
        return rol;
    }
    public void setRol(Rol rol) {
        this.rol = rol;
    }

    public String getConfirmarContrasena() {
        return confirmarContrasena;
    }

    public void setConfirmarContrasena(String confirmarContrasena) {
        this.confirmarContrasena = confirmarContrasena;
    }   

    public String getEstadoAsistencia() { 
        return estadoAsistencia; 
    }

    public void setEstadoAsistencia(String estado) { 
        this.estadoAsistencia = estado; 
    }

}
