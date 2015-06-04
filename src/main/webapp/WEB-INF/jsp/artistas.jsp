
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.modelo.Museo"%>
<%@page import="com.modelo.Modelo"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.modelo.Artista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head> 
        <title>Museo</title>
        
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        
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
                <li><a href="#">Bievenido: ${usuario}</a></li>
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
            <h1>Artistas</h1>
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
                            <th><p>Apellidos</p></th>
                            <th><p>Nacionalidad</p></th>
                            <th><p>Observaciones</p></th>
                            <th><p>Fecha de Nacimiento</p></th>
                            <th><p>Fecha de Defuncion</p></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Iterator ite = ((List) request.getAttribute("lista")).iterator();
                            int i = 1;
                            while (ite.hasNext()) {
                                Artista art = (Artista) ite.next();
                                out.print(
                                        "<tr id = 'id" + i + "' onclick = \"selectArtista(" +
                                            "'id" + i + "'," + 
                                            art.getId() + "," +
                                            "'" + art.getNombre() + "'," +
                                            "'" + art.getApellidos() + "'," +
                                            "'" + art.getNacionalidad() + "'," +
                                            "'" + art.getObservaciones() + "'," +
                                            "'" + new SimpleDateFormat("dd/M/yyyy").format(art.getNacimiento()) + "'," +
                                            "'" + new SimpleDateFormat("dd/M/yyyy").format(art.getDefuncion()) + "'" +
                                        ")\">"
                                        + "<td>" + art.getId() + "</td>"
                                        + "<td>" + art.getNombre() + "</td>"
                                        + "<td>" + art.getApellidos() + "</td>"
                                        + "<td>" + art.getNacionalidad() + "</td>"
                                        + "<td>" + art.getObservaciones() + "</td>"
                                        + "<td>" + new SimpleDateFormat("dd/M/yyyy").format(art.getNacimiento()) + "</td>"
                                        + "<td>" + new SimpleDateFormat("dd/M/yyyy").format(art.getDefuncion()) + "</td>"
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
                <a class="boton" onclick = "eliminar('ARTISTAS')">Eliminar</a>
                <a href = '#panelActualizar' class="boton" onclick = "actualizarArtista()">Actualizar</a>
                <a href = '#panelInsertar' class="boton">Insertar</a>
                <a href = 'artistasReporte.pdf' class="boton">Crear Reporte</a>
            </p>
        </div>
        
        <script>
            $(document).ready(function () {
                    $(".datepicker").datepicker();
            });
        </script>
        
        <div id="panelInsertar" class="modalmask">
            <div class="modalbox movedown">
                <a href="#close" title="Close" class="close">X</a>
                <h1>Insertar</h1>
                <form action = "insertArtista.html" method="post">
            <pre>Nombre:                <input type = "text" name = "nombre"/><br/></pre>
            <pre>Apellidoa:             <input type = "text" name = "apellidos"/><br/></pre>
            <pre>Nacionalidad           <input type = "text" name = "nacionalidad"/><br/></pre>
            <pre>Observaciones          <input type = "text" name = "observaciones"/><br/></pre>
            <pre>Fecha de Nacimiento    <input class = "datepicker" type = "text" name = "nacimiento"/><br/></pre>
            <pre>Fecha de Defunción     <input class = "datepicker" type = "text" name = "defuncion"/><br/></pre>
            <input type = "submit" value = "insertar"/><br/>
                </form>
            </div>
        </div>
        
        <div id="panelActualizar" class="modalmask">
            <div class="modalbox rotate">
                <a href="#close" title="Close" class="close">X</a>
                <h1>Actualizar</h1>
                <form action = "updateArtista.html" method="post">
            <input id = 'idModelo' type = "hidden" name = "id"/><br/>
            <pre>Nombre:                <input id = 'nombreModelo'type = "text" name = "nombre"/><br/></pre>
            <pre>Apellidos:             <input id = 'apellidosModelo' type = "text" name = "apellidos"/><br/></pre>
            <pre>Nacionalidad           <input id = 'nacionalidadModelo' type = "text" name = "nacionalidad"/><br/></pre>
            <pre>Observaciones          <input id = 'observacionesModelo' type = "text" name = "observaciones"/><br/></pre>
            <pre>Fecha de Nacimiento    <input class = 'datepicker' id = 'nacimientoModelo' type = "text" name = "nacimiento"/><br/></pre>
            <pre>Fecha de Defunción     <input class = 'datepicker' id = 'defuncionModelo' type = "text" name = "defuncion"/><br/></pre>
            <input type = "submit" value = "Actualizar"/><br/>
                </form>
            </div>
        </div>
        <script src = "jScript/controlTabla.js"></script>
    </body>
</html>0