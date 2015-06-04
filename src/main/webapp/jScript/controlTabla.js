var nombreModelo = '';
var ciudadModelo = '';
var apellidosModelo = '';
var nacionalidadModelo = '';
var observacionesModelo = '';
var nacimientoModelo = '';
var defuncionModelo = '';
var descripcionModelo = '';
var inicioModelo = '';
var finModelo = '';
var tituloModelo  = '';
var tipoModelo = '';
var anioModelo = '';
var materialesModelo = '';
var altoModelo = '';
var largoModelo = '';
var anchoModelo = '';
var viejoEstilo = 'border-top: 3px solid #ccccff; border-bottom: 3px solid #ccccff; background-color: #ccccff; color: black;';
var nuevoEstilo = 'border-top: 5px solid yellow; border-bottom: 5px solid yellow; background-color: #660066; color: white;';

var id = 'id1';
var idModelo = -1;

function selectArtista(
    id,
    idModelo,
    nombreModelo,
    apellidosModelo,
    nacionalidadModelo,
    observacionesModelo,
    nacimientoModelo,
    defuncionModelo
) {
    this.idModelo = idModelo;
    this.nombreModelo = nombreModelo;
    this.apellidosModelo = apellidosModelo;
    this.nacionalidadModelo = nacionalidadModelo;
    this.observacionesModelo = observacionesModelo;
    this.nacimientoModelo = nacimientoModelo;
    this.defuncionModelo = defuncionModelo;
    document.getElementById(this.id).style = viejoEstilo;
    document.getElementById(id).style = nuevoEstilo;
    this.id = id;
}

function selectCorriente(
    id,
    idModelo,
    nombreModelo,
    descripcionModelo,
    inicioModelo,
    finModelo
) {
    this.idModelo = idModelo;
    this.nombreModelo = nombreModelo;
    this.descripcionModelo = descripcionModelo;
    this.inicioModelo = inicioModelo;
    this.finModelo = finModelo;
    document.getElementById(this.id).style = viejoEstilo;
    document.getElementById(id).style = nuevoEstilo;
    this.id = id;
}

function selectMuseo(
        id, 
        idModelo,
        nombreModelo,
        ciudadModelo,
        conservadorModelo
) {
    this.idModelo = idModelo;
    this.nombreModelo = nombreModelo;
    this.ciudadModelo = ciudadModelo;
    this.conservadorModelo = conservadorModelo;
    document.getElementById(this.id).style = viejoEstilo;
    document.getElementById(id).style = nuevoEstilo;
    this.id = id;
}

function selectObra(
        id, 
        idModelo,
        tituloModelo,
        tipoModelo,
        anioModelo,
        materialesModelo,
        altoModelo,
        largoModelo,
        anchoModelo
) {
    this.idModelo = idModelo;
    this.tituloModelo = tituloModelo;
    this.tipoModelo = tipoModelo;
    this.anioModelo = anioModelo;
    this.materialesModelo = materialesModelo;
    this.altoModelo = altoModelo;
    this.largoModelo = largoModelo;
    this.anchoModelo = anchoModelo;
    document.getElementById(this.id).style = viejoEstilo;
    document.getElementById(id).style = nuevoEstilo;
    this.id = id;
}   

function eliminar(tabla) {
    if (idModelo > -1) {
        answer = confirm('Deseas Eliminar el registro con el ID ' + idModelo + ' ?');
        if (answer == 1) {
            window.location.href = "eli.html?id=" + idModelo + "&tabla=" + tabla;
        }
    }
}

function actualizarArtista() {
    document.getElementById('idModelo').value = idModelo;
    document.getElementById('nombreModelo').value = nombreModelo;
    document.getElementById('apellidosModelo').value = apellidosModelo;
    document.getElementById('nacionalidadModelo').value = nacionalidadModelo;
    document.getElementById('observacionesModelo').value = observacionesModelo;
    document.getElementById('nacimientoModelo').value = nacimientoModelo;
    document.getElementById('defuncionModelo').value = defuncionModelo;
}

function actualizarCorriente() {
    document.getElementById('idModelo').value = idModelo;
    document.getElementById('nombreModelo').value = nombreModelo;
    document.getElementById('descripcionModelo').value = descripcionModelo;
    document.getElementById('inicioModelo').value = inicioModelo;
    document.getElementById('finModelo').value = finModelo;
}

function actualizarMuseo() {
    document.getElementById('idModelo').value = idModelo;
    document.getElementById('nombreModelo').value = nombreModelo;
    document.getElementById('ciudadModelo').value = ciudadModelo;
}

function actualizarObra() {
    document.getElementById('idModelo').value = idModelo;
    document.getElementById('tituloModelo').value = tituloModelo;
    document.getElementById('tipoModelo').value = tipoModelo;
    document.getElementById('anioModelo').value = anioModelo;
    document.getElementById('materialesModelo').value = materialesModelo;
    document.getElementById('altoModelo').value = altoModelo;
    document.getElementById('largoModelo').value = largoModelo;
    document.getElementById('anchoModelo').value = anchoModelo;
}

function visualizarChois() {
    document.getElementById("visualizar").src = "ImageServlet?id=" + idModelo;
}

