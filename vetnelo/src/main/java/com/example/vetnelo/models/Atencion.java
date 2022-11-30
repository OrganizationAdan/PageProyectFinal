package com.example.vetnelo.models;

public class Atencion {
    private String nombre_mascota;
    private String servicios;
    private String nombre;
    private String fecha;
    private String foto;
    

    public Atencion() {
    }
    
    public Atencion(String nombre_mascota, String servicios, String nombre, String fecha, String foto) {
        this.nombre_mascota = nombre_mascota;
        this.servicios = servicios;
        this.nombre = nombre;
        this.fecha = fecha;
        this.foto = foto;
    }
    public String getNombre_mascota() {
        return nombre_mascota;
    }
    public void setNombre_mascota(String nombre_mascota) {
        this.nombre_mascota = nombre_mascota;
    }
    public String getServicios() {
        return servicios;
    }
    public void setServicios(String servicios) {
        this.servicios = servicios;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getFecha() {
        return fecha;
    }
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    public String getFoto() {
        return foto;
    }
    public void setFoto(String foto) {
        this.foto = foto;
    }
    
}
