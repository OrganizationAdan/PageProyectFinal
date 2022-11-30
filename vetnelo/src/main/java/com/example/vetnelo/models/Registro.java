package com.example.vetnelo.models;

public class Registro {
    private String correo;
    private String usuario;
    private String contrasenia;

    public  Registro(){
        
    }

    public Registro(String correo, String usuario, String contrasenia) {
        this.correo = correo;
        this.usuario = usuario;
        this.contrasenia = contrasenia;
    }
    public String getCorreo() {
        return correo;
    }
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    public String getUsuario() {
        return usuario;
    }
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    public String getContrasenia() {
        return contrasenia;
    }
    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }


}
