
package com.modelo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "PROF.ARTISTAS")
@Table(name = "ARTISTAS", schema = "PROF")
public class Artista implements Serializable {
    
    @Id
    @Column(name = "ID")
    private Integer id;
    
    @Column(name = "NOMBRE")
    private String nombre;
    
    @Column(name = "APELLIDOS")
    private String apellidos;
    
    @Column(name = "NACIMIENTO")
    private Date nacimiento;
    
    @Column(name = "DEFUNCION")
    private Date defuncion;
    
    @Column(name = "NACIONALIDAD")
    private String nacionalidad;
    
    @Column(name = "OBSERVACIONES")
    private String observaciones;
    
    public Artista() {
        
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public Date getNacimiento() {
        return nacimiento;
    }

    public void setNacimiento(Date nacimiento) {
        this.nacimiento = nacimiento;
    }

    public Date getDefuncion() {
        return defuncion;
    }

    public void setDefuncion(Date defuncion) {
        this.defuncion = defuncion;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
    
    
    
}
