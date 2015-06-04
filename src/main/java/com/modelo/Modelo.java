package com.modelo;

import java.util.List;
import javax.validation.ConstraintViolationException;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Modelo {

    private static SessionFactory factory;
    public static Session session;
    public static Configuration config;
    
    public Modelo() {}

    public static void comenzarTransaccion() {
        session.beginTransaction();
    }
    
    public static void logout() {
        factory.close();
    }

    public static void ingresarDatos(Object mus) throws ConstraintViolationException {
        session.save(mus);
        session.getTransaction().commit();
    }

    public static void eliminar(String id, String tabla) {
        session.createQuery("delete PROF." + tabla + " where id = " + id).executeUpdate();
    }
    
    public static void login(String usuario, String contrasenia) throws HibernateException {
        config = new Configuration();
        config.configure("hibernate.cfg.xml");
        config.setProperty("hibernate.connection.username", usuario);
        config.setProperty("hibernate.connection.password", contrasenia);
        factory = config.buildSessionFactory();
        session = factory.openSession();
    }
    
    public static List recibirDatos(String tabla, String index) {
        session.clear();
        if (index != null) return session.createQuery("from PROF." + tabla + " where nombre like '%" + index + "%'").list();
        else return session.createQuery("from PROF." + tabla).list();
    }
}
