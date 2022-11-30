package com.example.vetnelo.models;

public class Sucursal {
    private String cod_sucursal;
    private String ubicacion;
    private String nombre;

    public Sucursal(){
        
    }

    public Sucursal(String cod_sucursal, String ubicacion, String nombre){
        this.cod_sucursal = cod_sucursal;
        this.ubicacion = ubicacion;
        this.nombre = nombre;
    }

    public String getCod_sucursal() {
        return cod_sucursal;
    }
    public void setCod_sucursal(String cod_sucursal) {
        this.cod_sucursal = cod_sucursal;
    }
    public String getUbicacion() {
        return ubicacion;
    }
    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    

}
