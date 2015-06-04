package com.modelo;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity(name =  "PROF.OBRAS_ARTISTAS")
@Table(name = "OBRAS_ARTISTAS", schema = "PROF")
public class ObrasArtistas implements Serializable {
    
    @Id
    @ManyToOne
    @JoinColumn(name = "OBRA_ID")
    private Obra obra;
    
    @ManyToOne
    @JoinColumn(name = "ARTISTA_ID")
    private Artista artista;
    
    public ObrasArtistas() {}

    public Obra getObra() {
        return obra;
    }

    public void setObra(Obra obra) {
        this.obra = obra;
    }

    public Artista getArtista() {
        return artista;
    }

    public void setArtista(Artista artista) {
        this.artista = artista;
    }
    
}
