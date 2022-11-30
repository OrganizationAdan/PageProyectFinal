package com.example.vetnelo.controller;
import java.net.http.HttpClient.Redirect;
import java.sql.SQLException;
import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.example.vetnelo.models.Atencion;
import com.example.vetnelo.models.Equipo;
import com.example.vetnelo.models.Perros;
import com.example.vetnelo.models.Registro;
import com.example.vetnelo.models.Sucursal;
import com.example.vetnelo.services.vetneloDB;

@RestController
public class vetneloController {
    
    //ver los registros
    @GetMapping("/sucursal")
    public List<Sucursal> obtenerSucursal(){
        return new vetneloDB().obtenerSucursales();
    }

    @GetMapping("/sucursal/{id}")
    public List<Sucursal> obtenerSucursal(@PathVariable("id") String id){
        return new vetneloDB().obtenerSucursal(id);
    }

    @RequestMapping("/")
public ModelAndView index () {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("prueba.html");
    return modelAndView;
}
    //crear un registro
    @PostMapping("/sucursal")
    public RedirectView recibirSucursal(@RequestBody Sucursal sucursal){
        try {
        System.out.println(sucursal.getCod_sucursal());
        new vetneloDB().ingresarSucursal(sucursal);
        return null;
    } catch (Exception e) {
        // TODO: handle exception
        System.out.println(e);

    }
    return null;
    }



    //borrar un registro
    @DeleteMapping("/sucursal/{id}")
    public void borrarSucursal(@PathVariable("id") String id){
        try {
            new vetneloDB().borrarSucursal(id);
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e);
        }
    }


    @PutMapping("/sucursal/{id}")
    public void editarSucursal(@RequestBody Sucursal sucursal,@PathVariable("id") String id){
        System.out.println(id);
        new vetneloDB().editarSucursal(sucursal, id);
    }

    @PostMapping("/registro")
    public String registrar(@RequestBody Registro registro){
        return new vetneloDB().ingresarRegistro(registro);
    }

    @PostMapping("/verificar")
    public String verificar(@RequestBody Registro registro) {
        String check = new vetneloDB().verificar(registro.getCorreo(),registro.getContrasenia());
        System.out.println(check);
        return check;
    }

    @GetMapping("/usuario/{id}")
    public List<Registro> obtenerPerfil(@PathVariable("id") String id){
        return new vetneloDB().obtenerPerfil(id);
    }

    @DeleteMapping("usuario/borrar/{id}")
    public void borrarUsuario(@PathVariable("id") String id){
        new vetneloDB().borrarUsuario(id);
    }

    @PutMapping("usuario/editar/{id}")
    public void actualizarUsuario(@RequestBody Registro usuario,@PathVariable("id") String id ){
        new vetneloDB().editarUsuario(usuario, id);
    }

    @GetMapping("/atenciones")
    public List<Atencion> obtenerAtenciones(){
        return new vetneloDB().obtenerAtenciones();
    }

    @GetMapping("/equipo")
    public List<Equipo> obtenerEquipo(){
        return new vetneloDB().obtenerEquipo();
    }

    @GetMapping("/perros")
    public List<Perros> obtenerPerros(){
        return new vetneloDB().obtenerPerros();
    }
}
