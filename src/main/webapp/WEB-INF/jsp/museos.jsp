
<%@page import="java.util.List"%>
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
        <meta charset = "UTF-8"/>
    </head>
    <body>
        <div id =  "navizq">
            <h2>Museo web de Arte Calljero</h2>
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
                <li><a href="#">Bievenido: <% Modelo.config.getProperty("hibernate.connection.username"); %></a></li>
                <li>
                    <a href = "#" >Inventario de Obras de Arte<i class="fa fa-linux"></i><span class="caret"></span></a>
                    <ul>
                        <li><a href="artistas.html">Artistas</a></li>
                        <li><a href="corrientes.html">Corrientes</a></li>
                        <li><a href="museos.html">Museos</a></li>
                        <li><a href="obras.html">Obras</a></li>
                    </ul>
                </li>
                <li>
                    <form action = "museos.html">
                        <a><i class="fa fa-search-plus"></i><input action="#" type="text" name = 'index'></a>
                    </form>
                </li>
            </ul>
        </div>

        <div class="jumbo">
            <h1>Museos</h1>
            <p>...</p>
            <p><a class="boton">ver más!</a></p>
        </div>

        <div id = "table-wrapper">
            <div id = "table-scroll">
                <table>
                    <thead>
                        <tr>
                            <th><p>ID</p></th>
                            <th><p>Nombre</p></th>
                            <th><p>Ciudad</p></th>
                            <th><p>Conservador</p></th>
                            <th><p>Ruta de la Foto</p></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Iterator ite = ((List) request.getAttribute("lista")).iterator();
                            int i = 1;
                            while (ite.hasNext()) {
                                Museo per = (Museo) ite.next();
                                out.print(
                                        "<tr id = 'id" + i + "' onclick = \"selectMuseo(" +
                                            "'id" + i + "'," + 
                                            per.getId() + "," +
                                            "'" + per.getNombre() + "'," +
                                            "'" + per.getCiudad()+ "'," +
                                            "'" + per.getConservador() + "'," +
                                            "'" + per.getFoto_path()+ "'" +
                                        ")\">"
                                        + "<td>" + per.getId() + "</td>"
                                        + "<td>" + per.getNombre() + "</td>"
                                        + "<td>" + per.getCiudad() + "</td>"
                                        + "<td>" + per.getConservador() + "</td>"
                                        + "<td>" + per.getFoto_path() + "</td>"
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
                <a class="boton" onclick = "eliminar('MUSEOS')">Eliminar</a>
                <a href = '#panelActualizar' class="boton" onclick = "actualizarMuseo()">Actualizar</a>
                <a href = '#panelInsertar' class="boton">Insertar</a>
                <a href = '#panelVisualizar' class="boton" onclick = "visualizarChois()">Visualizar Imagen</a>
                <a href = 'museosReporte.pdf' class="boton">Crear Reporte</a>
            </p>
        </div>

        <div id="panelInsertar" class="modalmask">
            <div class="modalbox movedown">
                <a href="#close" title="Close" class="close">X</a>
                <h1>Insertar</h1>
                <form action = "insertMuseo.html" method="post" enctype="multipart/form-data">
            <pre>Nombre del Museo:      <input type = "text" name = "nombre"/><br/></pre>
            <pre>Ciudad:                <input type = "text" name = "ciudad"/><br/></pre>
            <pre>Ruta de la imagen:     <input type = "file" name = "file"/><br/></pre>
            <input type = "submit" value = "insertar"/><br/>
                </form>
            </div>
        </div>
        
        <div id="panelActualizar" class="modalmask">
            <div class="modalbox rotate">
                <a href="#close" title="Close" class="close">X</a>
                <h1>Actualizar</h1>
                <form action = "updateMuseo.html" method="post" enctype="multipart/form-data">
            <input id = 'idModelo' type = "hidden" name = "id"/><br/>
            <pre>Nombre del Museo:      <input id = 'nombreModelo' type = "text" name = "nombre"/><br/></pre>
            <pre>Ciudad:                <input id = 'ciudadModelo' type = "text" name = "ciudad"/><br/></pre>
            <pre>Ruta de la imagen:     <input type = "file" name = "file"/><br/></pre>
            <input type = "submit" value = "Actualizar"/><br/>
                </form>
            </div>
        </div>
        
        <div id="panelVisualizar" class="modalmask">
            <div class="modalbox resize">
                <a href="#close" title="Close" class="close">X</a>
                <img id = "visualizar" src = "ImageServlet" width = 175 height = 175/>
            </div>
        </div>
        <script src = "jScript/controlTabla.js"></script>
    </body>
</html>
