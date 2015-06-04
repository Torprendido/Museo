var imagenes = ['jScript/28286.jpg', 'jScript/379757.jpg' , 'jScript/456123.jpg', 'jScript/48846.jpg', 'jScript/49493.jpg'];
var i = 2;
var j = 1;

function transicion() {
	i = i + 1;
	if (i == imagenes.length*3) {
		i = 0;
	}if (i % 3 == 0) {
		difuminar(imagenes[Math.floor(i/3)], 1);
		setTimeout('transicion()', 5000);
	} else {
		difuminar(imagenes[Math.floor(i/3)], 0.5);
		setTimeout('transicion()', 300);
	}
}

function difuminar(imagen, n) {
	document.getElementById('transicion').style = 'opacity: ' + n + '; background: url(' + imagen + ') no-repeat; background-size: 100% 100%;';
}

window.onload = function() {
	transicion();
}