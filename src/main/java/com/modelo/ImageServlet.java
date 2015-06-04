    package com.modelo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ImageServlet", urlPatterns = {"/ImageServlet"})
public class ImageServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        if (request.getParameter("id") == null) return;
        if (Modelo.session.get(Museo.class, Integer.parseInt(request.getParameter("id"))) == null) return;
        response.setContentType("image/jpg");
        Modelo.session.clear();
        Museo mus = (Museo) Modelo.session.get(Museo.class, Integer.parseInt(request.getParameter("id")));
        byte[] content = mus.getImagen();
        if (content == null) return;
        response.getOutputStream().write(content);
        response.getOutputStream().flush();
        response.getOutputStream().close();
    }
}
