package com.example.vetnelo.models;

public class Equipo {
    private int equipo_id;
    private String e_nombre;
    private String e_alias;
    private String e_desc;
    private String e_foto;

    

    public Equipo() {
    }
    
    public Equipo(int equipo_id, String e_nombre, String e_alias, String e_desc, String e_foto) {
        this.equipo_id = equipo_id;
        this.e_nombre = e_nombre;
        this.e_alias = e_alias;
        this.e_desc = e_desc;
        this.e_foto = e_foto;
    }
    public int getEquipo_id() {
        return equipo_id;
    }
    public void setEquipo_id(int equipo_id) {
        this.equipo_id = equipo_id;
    }
    public String getE_nombre() {
        return e_nombre;
    }
    public void setE_nombre(String e_nombre) {
        this.e_nombre = e_nombre;
    }
    public String getE_alias() {
        return e_alias;
    }
    public void setE_alias(String e_alias) {
        this.e_alias = e_alias;
    }
    public String getE_desc() {
        return e_desc;
    }
    public void setE_desc(String e_desc) {
        this.e_desc = e_desc;
    }
    public String getE_foto() {
        return e_foto;
    }
    public void setE_foto(String e_foto) {
        this.e_foto = e_foto;
    }
    
}
