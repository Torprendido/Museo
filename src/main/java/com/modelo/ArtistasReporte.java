
package com.modelo;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.util.JRLoader;
import org.hibernate.internal.SessionFactoryImpl;

@WebServlet(name = "artistasReporte.pdf", urlPatterns = {"/artistasReporte.pdf"})
public class ArtistasReporte extends HttpServlet {

    private final String reportSource = "/report/artistasReporte.jasper";
    
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        response.setContentType("application/pdf");
        try {
            final ServletContext context = getServletContext();
            final SessionFactoryImpl factImp = (SessionFactoryImpl) Modelo.session.getSessionFactory();
            final JasperReport jasperReport = (JasperReport) JRLoader.loadObject(
                   context.getResourceAsStream(reportSource)
            );
            final byte[] reporte = JasperRunManager.runReportToPdf(
                    jasperReport,
                    new HashMap(),
                    factImp.getConnectionProvider().getConnection()
            );
            response.getOutputStream().write(reporte);
            response.getOutputStream().flush();
            response.getOutputStream().close();
        } catch (JRException | SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

}
