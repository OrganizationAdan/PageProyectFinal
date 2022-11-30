package com.example.vetnelo.services;
import java.util.ArrayList;
import java.util.List;
import java.io.Console;
import java.sql.*;

import com.example.vetnelo.models.Atencion;
import com.example.vetnelo.models.Equipo;
import com.example.vetnelo.models.Perros;
import com.example.vetnelo.models.Registro;
import com.example.vetnelo.models.Sucursal;

public class vetneloDB {
    Connection _cn;

    //abre la base de datos
    public vetneloDB(){
        _cn = new Conexion().openDb();
    }

    public List<Sucursal> obtenerSucursales(){
        try {
            System.out.println("entro");
            Statement stmt = _cn.createStatement();
            String query ="select * from sucursal";
            List<Sucursal> sucursales = new ArrayList<>();
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                Sucursal sucursal = new Sucursal(
                result.getString("cod_sucursal"),
                result.getString("ubicacion"),
                result.getString("nombre")

                );
                sucursales.add(sucursal);
                
            }
            result.close();
            stmt.close();

            return sucursales;
        } catch (Exception e) {
            System.out.println(e);
            // TODO: handle exception
        }
        return null;

    }

    public List<Sucursal> obtenerSucursal(String id){
        try {
            System.out.println("entro");
            Statement stmt = _cn.createStatement();
            String query ="select * from sucursal where cod_sucursal ='"+id+"'";
            List<Sucursal> sucursales = new ArrayList<>();
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                Sucursal sucursal = new Sucursal(
                result.getString("cod_sucursal"),
                result.getString("ubicacion"),
                result.getString("nombre")

                );
                sucursales.add(sucursal);
                
            }
            result.close();
            stmt.close();

            return sucursales;
        } catch (Exception e) {
            System.out.println(e);
            // TODO: handle exception
        }
        return null;

    }

    public int ingresarSucursal(Sucursal sucursal){
        try {
            System.out.println(sucursal.getCod_sucursal());
            Statement stmt = _cn.createStatement();
            String query ="insert into sucursal values('"+ sucursal.getCod_sucursal()+"','"+sucursal.getUbicacion()+"','"+sucursal.getNombre()+"');";
            stmt.executeQuery(query);
            stmt.close();
            System.out.println("DATOS INGRESADOS!!!!!!!!!!!! UWU");
            return 0;
        } catch (Exception e) {
            System.out.println(e);
            // TODO: handle exception
        }
        return 1;

    }

    
    public int borrarSucursal(String codigo){
        try {
            System.out.println(codigo);
            Statement stmt = _cn.createStatement();
            String query ="delete sucursal where cod_sucursal ='"+codigo+"'";
            stmt.executeQuery(query);
            stmt.close();
            return 0;
        } catch (Exception e) {
            System.out.println(e);
            // TODO: handle exception
        }
        return 1;

    }

    public int editarSucursal(Sucursal sucursal, String id){
        try {
            System.out.println(sucursal.getCod_sucursal());
            Statement stmt = _cn.createStatement();
            String query ="update sucursal set ubicacion ='"+sucursal.getUbicacion()+"', nombre='"+sucursal.getNombre()+"', cod_sucursal= '"+sucursal.getCod_sucursal()+"' where cod_sucursal ='"+id+"'";
            stmt.executeQuery(query);
            stmt.close();
            System.out.println("DATOS INGRESADOS!!!!!!!!!!!! UWU");
            return 0;
        } catch (Exception e) {
            System.out.println(e);
            // TODO: handle exception
        }
        return 1;

    }

    public String ingresarRegistro(Registro registro){
        try {
            System.out.println(registro.getCorreo());
            Statement stmt = _cn.createStatement();
            String query ="insert into registro values('"+ registro.getCorreo()+"','"+registro.getUsuario()+"','"+registro.getContrasenia()+"');   select correo from registro where correo ='"+registro.getCorreo()+"' and contrasenia ='"+registro.getContrasenia()+"'";
            ResultSet rs= stmt.executeQuery(query);
            String id = "";
            rs.next();
            id=rs.getString("correo");
            stmt.close();
            return id;
        } catch (Exception e) {
            System.out.println(e);
            // TODO: handle exception
        }
        return null;

    }

    public String verificar(String correo, String contrasenia){
            try{
            Statement stmt = _cn.createStatement();
            String query ="select correo from registro where correo ='"+correo+"' and contrasenia ='"+contrasenia+"'";
            ResultSet rs= stmt.executeQuery(query);
            String id = "";
            rs.next();
            id=rs.getString("correo");
            rs.close();
            stmt.close();
        if(!id.isEmpty()){
            return id;
        }else {
            return null;
        }}catch(Exception e){
            System.out.println(e);
            return null;
        }
        
    }

    public List<Registro> obtenerPerfil(String id){
        try {
            System.out.println("entro");
            Statement stmt = _cn.createStatement();
            String query ="select * from registro where correo ='"+id+"'";
            List<Registro> perfil = new ArrayList<>();
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                Registro obj = new Registro(
                result.getString("correo"),
                result.getString("usuario"),
                result.getString("contrasenia")
                );
                perfil.add(obj);
                
            }
            result.close();
            stmt.close();

            return perfil;
        } catch (Exception e) {
            System.out.println(e);
            // TODO: handle exception
        }
        return null;

    }

    public void borrarUsuario(String id){
        try {
            Statement stmt = _cn.createStatement();
            String query ="delete registro where correo ='"+id+"'";
            stmt.executeQuery(query);
            stmt.close();
        } catch (Exception e) {
            System.out.println(e);
            // TODO: handle exception
        }
    }

    public void editarUsuario(Registro usuario, String id){
        try {
            Statement stmt = _cn.createStatement();
            String query ="update registro set correo = '"+usuario.getCorreo()+"', usuario ='"+usuario.getUsuario()+"', contrasenia='"+usuario.getContrasenia()+"' where correo= '"+id+"'";
            stmt.executeQuery(query);
            stmt.close();
        } catch (Exception e) {
            System.out.println(e);
            // TODO: handle exception
        }

    }

    public List<Atencion> obtenerAtenciones(){
        try {
            Statement stmt = _cn.createStatement();
            String query ="select * from tabal_s order by fecha desc";
            List<Atencion> Atenciones = new ArrayList<>();
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                Atencion obj = new Atencion(
                result.getString("nombre_mascota"),
                result.getString("servicios"),
                result.getString("nombre"),
                result.getString("fecha"),
                result.getString("foto")
                );
                Atenciones.add(obj);
                
            }
            result.close();
            stmt.close();

            return Atenciones;
        } catch (Exception e) {
            System.out.println(e);
            // TODO: handle exception
        }
        return null;

    }

    public List<Equipo> obtenerEquipo(){
        try {
            Statement stmt = _cn.createStatement();
            String query ="select * from equipo";
            List<Equipo> equipo = new ArrayList<>();
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                Equipo obj = new Equipo(
                result.getInt("equipo_id"),
                result.getString("e_nombre"),
                result.getString("e_alias"),
                result.getString("e_desc"),
                result.getString("e_foto")
                );
                equipo.add(obj);
                
            }
            result.close();
            stmt.close();

            return equipo;
        } catch (Exception e) {
            System.out.println(e);
            // TODO: handle exception
        }
        return null;

    }


    public List<Perros> obtenerPerros(){
        try {
            Statement stmt = _cn.createStatement();
            String query ="select * from perros";
            List<Perros> perros = new ArrayList<>();
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                Perros obj = new Perros(
                result.getInt("id"),
                result.getString("raza"),
                result.getString("foto"),
                result.getString("descripcion")
                );
                perros.add(obj);
                
            }
            result.close();
            stmt.close();

            return perros;
        } catch (Exception e) {
            System.out.println(e);
            // TODO: handle exception
        }
        return null;

    }
}

