function fechaHoy () {
    const fecha = Date.now();
    fechaActual = new Date(fecha);

    hoy = fechaActual.toLocaleDateString();

    document.querySelector('#fechaInfo').innerHTML = 'HOY: ' + hoy;
    
}

fechaHoy();