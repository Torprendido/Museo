
package com.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "PROF.OBRAS")
@Table(name = "OBRAS", schema = "PROF")
public class Obra implements Serializable {
    
    @Id
    @Column(name = "ID")
    private Integer id;
    
    @Column(name = "TITULO")
    private String titulo;
    
    @Column(name = "TIPO")
    private String tipo;
    
    @Column(name = "ANIO")
    private Integer anio;
    
    @Column(name = "MATERIALES")
    private String materiales;
    
    @Column(name = "ALTO")
    private Integer alto;
    
    @Column(name = "LARGO")
    private Integer largo;
    
    @Column(name = "ANCHO")
    private Integer ancho;
    
    public Obra() {
        
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Integer getAnio() {
        return anio;
    }

    public void setAnio(Integer anio) {
        this.anio = anio;
    }

    public String getMateriales() {
        return materiales;
    }

    public void setMateriales(String materiales) {
        this.materiales = materiales;
    }

    public Integer getAlto() {
        return alto;
    }

    public void setAlto(Integer alto) {
        this.alto = alto;
    }

    public Integer getLargo() {
        return largo;
    }

    public void setLargo(Integer largo) {
        this.largo = largo;
    }

    public Integer getAncho() {
        return ancho;
    }

    public void setAncho(Integer ancho) {
        this.ancho = ancho;
    }
    
    
    
}
