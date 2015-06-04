package com.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "PROF.MUSEOS")
@Table(name = "MUSEOS", schema = "PROF")
public class Museo implements Serializable {
    
    @Id
    @Column(name = "ID")
    private int id;
    
    @Column(name = "NOMBRE")
    private String nombre;
    
    @Column(name = "CIUDAD")
    private String ciudad;
    
    @Column(name = "FOTO_PATH")
    private String foto_path;
    
    @Column(name = "IMAGEN")
    private byte[] imagen;
    
    @Column(name = "CONSERVADOR")
    private String conservador;

    public Museo(String nombre, String ciudad, String fotoPath, byte[] imagen) {
        this.nombre = nombre;
        this.ciudad = ciudad;
        this.foto_path = fotoPath;
        this.imagen = imagen;
    }
    
    public Museo() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getConservador() {
        return conservador;
    }

    public void setConservador(String conservador) {
        this.conservador = conservador;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getFoto_path() {
        return foto_path;
    }

    public void setFoto_path(String foto_path) {
        this.foto_path = foto_path;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }
    
    
}
