
<%@page import="com.modelo.Artista"%>
<%@page import="java.util.List"%>
<%@page import="com.modelo.Obra"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.modelo.Corriente"%>
<%@page import="com.modelo.Museo"%>
<%@page import="com.modelo.Modelo"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head> 
        <title>Museo</title>
        <link rel = "stylesheet" href = "css/sheet.css"/>
        <link rel = "stylesheet" href = "css/panel.css"/>
        <link rel = "stylesheet" href = "css/tablas.css"/>
        <link rel = "stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        
        <meta charset = "UTF-8"/>
    </head>
    <body>
        <div id =  "navizq">
            <h2>Museo web de Arte Callejero</h2>
            <p>Hip flow con Flauta</p>
        </div>

        <div id =  "navder">
            <h2>Museo web de Arte Callejero</h2>
            <p>
                Hip flow con Flauta
            </p>
        </div>
        <div style = "width: 100%; position: fixed; background-color: green;">
            <ul>
                <li><a href="#">Inicio<i class="fa fa-picture-o"></i></a></li>
                <li><a href="#">Acerca de...<i class = "fa fa-quote-right"></i></a></li>
                <li>
                    <a href = "#" >Usuario<i class = "fa fa-user"></i><span class="caret"></span></a>
                    <ul>
                        <li><a href="login.html">Login</a></li>
                        <li><a href="logout.html">Logut</a></li>
                    </ul>
                </li>
                <li><a href="#">Bievenido: <%out.print(Modelo.config.getProperty("hibernate.connection.username"));%></a></li>
                <li>
                    <a href = "#" >Inventario de Obras de Arte<i class="fa fa-linux"></i><span class="caret"></span></a>
                    <ul>
                        <li><a href="artistas.html">Artistas</a></li>
                        <li><a href="corrientes.html">Corrientes</a></li>
                        <li><a href="museos.html">Museos</a></li>
                        <li><a href="obras.html">Obras</a></li>
                    </ul>
                </li>
                
            </ul>
        </div>

        <div class="jumbo">
            <h1>Obras</h1>
            <p>...</p>
            <p><a class="boton">ver más!</a></p>
        </div>

        <div id = "table-wrapper">
            <div id = "table-scroll">
                <table>
                    <thead>
                        <tr>
                            <th><p>ID</p></th>
                            <th><p>Título</p></th>
                            <th><p>Tipo</p></th>
                            <th><p>Año</p></th>
                            <th><p>Materiales</p></th>
                            <th><p>Alto</p></th>
                            <th><p>Largo</p></th>
                            <th><p>Ancho</p></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Iterator ite = ((List) request.getAttribute("lista")).iterator();
                            int i = 1;
                            while (ite.hasNext()) {
                                Obra obr = (Obra) ite.next();
                                out.print(
                                        "<tr id = 'id" + i + "' onclick = \"selectObra(" +
                                            "'id" + i + "'," + 
                                            obr.getId() + "," +
                                            "'" + obr.getTitulo() + "'," +
                                            "'" + obr.getTipo()+ "'," +
                                            obr.getAnio() + "," +
                                            "'" + obr.getMateriales() + "'," +
                                            obr.getAlto() + "," +
                                            obr.getLargo() + "," +
                                            obr.getAncho() +
                                        ")\">"
                                        + "<td>" + obr.getId() + "</td>"
                                        + "<td>" + obr.getTitulo() + "</td>"
                                        + "<td>" + obr.getTipo() + "</td>"
                                        + "<td>" + obr.getAnio() + "</td>"
                                        + "<td>" + obr.getMateriales() + "</td>"
                                        + "<td>" + obr.getAlto() + "</td>"
                                        + "<td>" + obr.getLargo()+ "</td>"
                                        + "<td>" + obr.getAncho()+ "</td>"
                                        + "</tr>"
                                );
                                i ++;
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <div style = "margin: 0 auto; width: 50%;">
            <p>
                <a class="boton" onclick = "eliminar('OBRAS')">Eliminar</a>
                <a href = '#panelActualizar' class="boton" onclick = "actualizarObra()">Actualizar</a>
                <a href = '#panelInsertar' class="boton">Insertar</a>
                <a href = 'obrasReporte.pdf' class="boton">Crear Reporte</a>
                <a href = '#panelCatalogo' class="boton" onclick = "catalogo()">ver catalogo de Artistas</a>
                <a href = '#panelIInsertarCatalogo' class="boton" onclick = "insertarCatalogo()">ver catalogo de Artistas</a>
            </p>
        </div>
                    
        <div id="panelInsertar" class="modalmask">
            <div class="modalbox movedown">
                <a href="#close" title="Close" class="close">X</a>
                <h1>Insertar</h1>
                <form action = "insertObra.html" method="post">
            <pre>Título:        <input type = "text" name = "titulo"/><br/></pre>
            <pre>Tipo:          <input type = "text" name = "tipo"/><br/></pre>
            <pre>Año:           <input type = "text" name = "anio"/><br/></pre>
            <pre>Materiales:    <input type = "text" name = "materiales"/><br/></pre>
            <pre>Alto:          <input type = "text" name = "alto"/><br/></pre>
            <pre>Largo:         <input type = "text" name = "largo"/><br/></pre>
            <pre>Ancho:         <input type = "text" name = "ancho"/><br/></pre>
                    <input type = "submit" value = "insertar"/><br/>
                </form>
            </div>
        </div>
        
        <div id="panelActualizar" class="modalmask">
            <div class="modalbox rotate">
                <a href="#close" title="Close" class="close">X</a>
                <h1>Actualizar</h1>
                <form action = "updateObra.html" method="post">
            <input id = 'idModelo' type = "hidden" name = "id"/><br/>
            <pre>Título:        <input id = 'tituloModelo' type = "text" name = "titulo"/><br/></pre>
            <pre>Tipo:          <input id = 'tipoModelo' type = "text" name = "tipo"/><br/></pre>
            <pre>Año:           <input id = 'anioModelo' type = "text" name = "anio"/><br/></pre>
            <pre>Materiales:    <input id = 'materialesModelo' type = "text" name = "materiales"/><br/></pre>
            <pre>Alto:          <input id = 'altoModelo' type = "text" name = "alto"/><br/></pre>
            <pre>Largo:         <input id = 'largoModelo' type = "text" name = "largo"/><br/></pre>
            <pre>Ancho:         <input id = 'anchoModelo' type = "text" name = "ancho"/><br/></pre>
            <input type = "submit" value = "Actualizar"/><br/>
                </form>
            </div>
        </div>
        
        <div id="panelVisualizar" class="modalmask">
            <div class="modalbox resize">
                <a href="#close" title="Close" class="close">X</a>
                <img id = "visualizar" src = "ImageServlet"/>
            </div>
        </div>
                    
        <div id="panelCatalogo" class="modalmask">
            <div class="modalbox resize">
                <a href="#close" title="Close" class="close">X</a>
                <table>
                    <thead>
                        <tr>
                            <th><p>Nombre Artista</p></th>
                        </tr>
                    </thead>
                    <tbody id = catal>
                        <script type="text/javascript">
                        function catalogo() {
                            $.ajax({
                                url: 'artistasCatalogo.html',
                                data: {idArtista: idModelo},
                                success: function(data) {
                                    $('#catal').html(data);
                                }
                            });
                        }
                        </script>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="panelInsertarCatalogo" class="modalmask">
            <div class="modalbox resize">
                <a href="#close" title="Close" class="close">X</a>
                <table>
                    <thead>
                        <tr>
                            <th><p>Nombre Artista</p></th>
                        </tr>
                    </thead>
                    <tbody>
                        <script type="text/javascript">
                        function insertarCatalogo() {
                            $.ajax({
                                url: 'insertarCatalago.html',
                                data: {idArtista: idModelo},
                                success: function(data) {
                                    alert('insertado con exito');
                                }
                            });
                        }
                        </script>
                    </tbody>
                </table>
            </div>
        </div>
        <script src = "jScript/controlTabla.js"></script>
    </body>
</html>
