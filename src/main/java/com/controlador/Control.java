
package com.controlador;

import com.modelo.Artista;
import com.modelo.Corriente;
import com.modelo.Modelo;
import static com.modelo.Modelo.session;
import com.modelo.Museo;
import com.modelo.Obra;
import com.modelo.ObrasArtistas;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolationException;
import org.hibernate.HibernateException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Control {
    
    public Control() {}
    
    @RequestMapping(value = "artistasCatalogo.html", method = RequestMethod.GET)
    public @ResponseBody String aristasCatalogo(@RequestParam("idArtista") String idArtista) {
        String catalogo = "";
        Iterator ite = Modelo.recibirDatos("OBRAS_ARTISTAS", null).iterator();
        while (ite.hasNext()) {
            ObrasArtistas oa = (ObrasArtistas) ite.next();
            catalogo = (int) oa.getObra().getId() == Integer.parseInt(idArtista) ?
                    "<tr><td>" + oa.getArtista().getNombre() + "</td></tr>" + catalogo : catalogo;
        }
        return catalogo;
    }
    
    @RequestMapping(value = "insertarCatalogo.html", method = RequestMethod.GET)
    public @ResponseBody String insertarCatalogo(@RequestParam("idArtista") String idArtista) {
        String catalogo = "";
        Iterator ite = Modelo.recibirDatos("OBRAS_ARTISTAS", null).iterator();
        while (ite.hasNext()) {
            ObrasArtistas oa = (ObrasArtistas) ite.next();
            catalogo = (int) oa.getObra().getId() == Integer.parseInt(idArtista) ?
                    "<tr><td>" + oa.getArtista().getNombre() + "</td></tr>" + catalogo : catalogo;
        }
        return catalogo;
    }
    
    @RequestMapping(value = "insertArtista.html", method = RequestMethod.POST)
    public ModelAndView insertarArtista(HttpServletRequest httSR) throws IOException {
        try {
            Artista art = new Artista();
            art.setId(0);
            art.setApellidos(httSR.getParameter("apellidos"));
            art.setDefuncion(new Date(httSR.getParameter("defuncion")));
            art.setNacimiento(new Date(httSR.getParameter("nacimiento")));
            art.setNacionalidad(httSR.getParameter("nacionalidad"));
            art.setNombre(httSR.getParameter("nombre"));
            art.setObservaciones(httSR.getParameter("observaciones"));
            Modelo.ingresarDatos(art);
            return artistas(httSR);
        } catch (ConstraintViolationException ex) {
            Modelo.session.getTransaction().rollback();
            return artistas(httSR);
        }
    }
    
    @RequestMapping(value = "insertCorriente.html", method = RequestMethod.POST)
    public ModelAndView insertarCorriente(HttpServletRequest httSR) throws IOException {
        try {
            Corriente cor = new Corriente();
            cor.setId(0);
            cor.setInicio(new Date(httSR.getParameter("inicio")));
            cor.setFin(new Date(httSR.getParameter("fin")));
            cor.setNombre(httSR.getParameter("nombre"));
            cor.setDescripcion(httSR.getParameter("descripcion"));
            Modelo.ingresarDatos(cor);
            return corrientes(httSR);
        } catch (ConstraintViolationException ex) {
            Modelo.session.getTransaction().rollback();
            return corrientes(httSR);
        }
    }
    
    @RequestMapping(value = "insertMuseo.html", method = RequestMethod.POST)
    public ModelAndView insertarMuseo(
            @RequestParam("file") MultipartFile file,
            HttpServletRequest httSR
    ) throws IOException {
        String nombre = httSR.getParameter("nombre");
        String ciudad = httSR.getParameter("ciudad");
        String fotoPath = file.getOriginalFilename();
        try {
            Modelo.ingresarDatos(new Museo(nombre, ciudad, fotoPath, file.getBytes()));
            return museos(httSR);
        } catch (ConstraintViolationException ex) {
            Modelo.session.getTransaction().rollback();
            return museos(httSR);
        }
    }
    
    @RequestMapping(value = "insertObra.html", method = RequestMethod.POST)
    public ModelAndView insertarObra(
            HttpServletRequest httSR
    ) throws IOException {
        try {
            Obra obr = new Obra();
            obr.setId(0);
            obr.setTitulo(httSR.getParameter("titulo"));
            obr.setTipo(httSR.getParameter("tipo"));
            obr.setAnio(Integer.parseInt(httSR.getParameter("anio")));
            obr.setMateriales(httSR.getParameter("materiales"));
            obr.setAlto(Integer.parseInt(httSR.getParameter("alto")));
            obr.setLargo(Integer.parseInt(httSR.getParameter("largo")));
            obr.setAncho(Integer.parseInt(httSR.getParameter("ancho")));
            Modelo.ingresarDatos(obr);
            return obras(httSR);
        } catch (ConstraintViolationException ex) {
            Modelo.session.getTransaction().rollback();
            return obras(httSR);
        }
    }
    
    @RequestMapping(value = "updateArtista.html", method = RequestMethod.POST)
    public ModelAndView actualizarArtista(
            HttpServletRequest httSR
    ) throws IOException {
        try {
            Artista art = (Artista) Modelo.session.get(Artista.class, Integer.parseInt(httSR.getParameter("id")));
            art.setApellidos(httSR.getParameter("apellidos"));
            art.setDefuncion(new Date(httSR.getParameter("defuncion")));
            art.setNacimiento(new Date(httSR.getParameter("nacimiento")));
            art.setNacionalidad(httSR.getParameter("nacionalidad"));
            art.setNombre(httSR.getParameter("nombre"));
            art.setObservaciones(httSR.getParameter("observaciones"));
            Modelo.session.getTransaction().commit();
            return artistas(httSR);
        } catch (ConstraintViolationException ex) {
            Modelo.session.getTransaction().rollback();
            return artistas(httSR);
        }
    }
    
    @RequestMapping(value = "updateCorriente.html", method = RequestMethod.POST)
    public ModelAndView actualizarCorriente(
            HttpServletRequest httSR
    ) throws IOException {
        try {
            Corriente cor = (Corriente) session.get(Corriente.class, Integer.parseInt(httSR.getParameter("id")));
            cor.setDescripcion(httSR.getParameter("descripcion"));
            cor.setNombre(httSR.getParameter("nombre"));
            cor.setInicio(new Date(httSR.getParameter("inicio")));
            cor.setFin(new Date(httSR.getParameter("fin")));
            session.update(cor);
            session.getTransaction().commit();
            return corrientes(httSR);
        } catch (ConstraintViolationException ex) {
            Modelo.session.getTransaction().rollback();
            return corrientes(httSR);
        }
    }
    
    @RequestMapping(value = "updateMuseo.html", method = RequestMethod.POST)
    public ModelAndView actualizarMuseo(
            @RequestParam("file") MultipartFile file,
            HttpServletRequest httSR
    ) throws IOException {
        try {
            Museo mus = (Museo) session.get(Museo.class, Integer.parseInt(httSR.getParameter("id")));
            mus.setCiudad(httSR.getParameter("ciudad"));
            mus.setNombre(httSR.getParameter("nombre"));
            mus.setFoto_path(file.getOriginalFilename());
            mus.setImagen(file.getBytes());
            session.update(mus);
            session.getTransaction().commit();
            return museos(httSR);
        } catch (ConstraintViolationException ex) {
            Modelo.session.getTransaction().rollback();
            ModelAndView mod = new ModelAndView("museos");
            mod.addObject("lista", Modelo.recibirDatos("MUSEOS", httSR.getParameter("index")));
            return museos(httSR);
        }
    }
    
    @RequestMapping(value = "updateObra.html", method = RequestMethod.POST)
    public ModelAndView actualizarObra(
            HttpServletRequest httSR
    ) throws IOException {
        try {
            Obra obr = (Obra) session.get(Obra.class, Integer.parseInt(httSR.getParameter("id")));
            obr.setTitulo(httSR.getParameter("titulo"));
            obr.setTipo(httSR.getParameter("tipo"));
            obr.setAnio(Integer.parseInt(httSR.getParameter("anio")));
            obr.setMateriales(httSR.getParameter("materiales"));
            obr.setAlto(Integer.parseInt(httSR.getParameter("alto")));
            obr.setLargo(Integer.parseInt(httSR.getParameter("largo")));
            obr.setAncho(Integer.parseInt(httSR.getParameter("ancho")));
            session.update(obr);
            session.getTransaction().commit();
            return obras(httSR);
        } catch (ConstraintViolationException ex) {
            Modelo.session.getTransaction().rollback();
            ModelAndView mod = new ModelAndView("obras");
            return obras(httSR);
        }
    }
    
    @RequestMapping(value = "eli.html")
    public ModelAndView eliminar(HttpServletRequest httSR) {
        String tabla = httSR.getParameter("tabla");
        Modelo.eliminar(httSR.getParameter("id"), tabla);
        ModelAndView mod = new ModelAndView(tabla.toLowerCase());
        mod.addObject("lista", Modelo.recibirDatos(tabla, null));
        return mod;
    }
    
    @RequestMapping(value = "loginControl.html", method = RequestMethod.POST)
    public ModelAndView loginControl(HttpServletRequest httSR) {
        String usuario = httSR.getParameter("usuario");
        String contrasenia = httSR.getParameter("contrasenia");
        ModelAndView mod = new ModelAndView();
        try {
            Modelo.login(usuario, contrasenia);
            Modelo.comenzarTransaccion();
            mod.setViewName("museos");
            mod.addObject("usuario", usuario);
            mod.addObject("lista", Modelo.recibirDatos("MUSEOS", null));
            return mod;
        } catch(HibernateException ex) {
            mod.setViewName("museo");
            mod.addObject("usuario", "Invitado");
            return mod;
        }
    }
    
    @RequestMapping(value = "logout.html", method = RequestMethod.GET)
    public ModelAndView logout(HttpServletRequest httSR) {
        try {
            Modelo.logout();
            return new ModelAndView("museo");
        } catch(HibernateException ex) {
            System.out.println(ex.getMessage());
            return new ModelAndView("museos");
        }
    }
    
    @RequestMapping(value = "artistas.html")
    public ModelAndView artistas(HttpServletRequest httSR) {
        ModelAndView mod = new ModelAndView("artistas");
        mod.addObject("lista", Modelo.recibirDatos("ARTISTAS", httSR.getParameter("index")));
        return mod;
    }
    
    @RequestMapping(value = "corrientes.html")
    public ModelAndView corrientes(HttpServletRequest httSR) {
        ModelAndView mod = new ModelAndView("corrientes");
        mod.addObject("lista", Modelo.recibirDatos("CORRIENTES", httSR.getParameter("index")));
        return mod;
    }
    
    @RequestMapping(value = "ejemplares.html")
    public ModelAndView ejemplares(HttpServletRequest httSR) {
        ModelAndView mod = new ModelAndView("ejemplares");
        mod.addObject("lista", Modelo.recibirDatos("EJEMPLARES", httSR.getParameter("index")));
        return mod;
    }
    
    @RequestMapping(value = "museos.html")
    public ModelAndView museos(HttpServletRequest httSR) {
        ModelAndView mod = new ModelAndView("museos");
        mod.addObject("lista", Modelo.recibirDatos("MUSEOS", httSR.getParameter("index")));
        return mod;
    }
    
    @RequestMapping(value = "obras.html")
    public ModelAndView obras(HttpServletRequest httSR) {
        ModelAndView mod = new ModelAndView("obras");
        mod.addObject("lista", Modelo.recibirDatos("OBRAS", httSR.getParameter("index")));
        return mod;
    }
    
}
