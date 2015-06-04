
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Museo</title>
                <link rel = "stylesheet" href = "css/sheet.css"/>
		<link rel = "stylesheet" href = "//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"/>
		<meta charset = "UTF-8"/>
	</head>    
	<body >
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
                    </ul>
                </li>
            </ul>
        </div>

        <div class="jumbo">
            <h1>Bienvenido!</h1>
            <p>...</p>
            <p><a class="boton">ver más!</a>
            </p>
        </div>

        <!--script type = "text/javascript">
            print("hshja");
        </script-->

        <div style = 'margin: 0 auto; width: 60%'>
            <script type = "text/javascript">
                for (var i = 1; i <= 3; i ++) {
                    document.write(
                        "<img src = 'ima" + i +".jpg'/>" +
                        "<div>" +
                            "<h3>Feature Label</h3>" +
                            "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>" +
                            "<p>" +
                                "<a href='#' class='boton'>Buy Now!</a> <a href='#' class='boton'>More Info</a>" +
                            "</p>" +
                        "</div>"
                    );
                }
            </script>
        </div>      


	</body>
</html>