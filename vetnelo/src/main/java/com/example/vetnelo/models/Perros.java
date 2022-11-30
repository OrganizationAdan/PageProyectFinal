package com.example.vetnelo.models;

public class Perros {
    private int id;
    private String raza;
    private String foto;
    private String descripcion;

    public Perros() {
    }
    public Perros(int id, String raza, String foto, String descripcion) {
        this.id = id;
        this.raza = raza;
        this.foto = foto;
        this.descripcion = descripcion;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getRaza() {
        return raza;
    }
    public void setRaza(String raza) {
        this.raza = raza;
    }
    public String getFoto() {
        return foto;
    }
    public void setFoto(String foto) {
        this.foto = foto;
    }
    public String getDescripcion() {
        return descripcion;
    }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    
}
