
package com.modelo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "PROF.CORRIENTES")
@Table(name = "CORRIENTES", schema = "PROF")
public class Corriente implements Serializable {
    
    @Id
    @Column(name = "ID") private Integer id;
    @Column(name = "NOMBRE") private String nombre;
    @Column(name = "DESCRIPCION") private String descripcion;
    @Column(name = "INICIO") private Date inicio;
    @Column(name = "FIN", nullable = true) private Date fin;
    
    public Corriente() {
        
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getInicio() {
        return inicio;
    }

    public void setInicio(Date inicio) {
        this.inicio = inicio;
    }

    public Date getFin() {
        return fin;
    }

    public void setFin(Date fin) {
        this.fin = fin;
    }
    
    
    
}
