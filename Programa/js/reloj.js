setInterval(() => {
    // Hora del sistema
    const horaActual = new Date();

    hora = Math.abs(horaActual.getHours() - 12);
    minutos = horaActual.getMinutes();

    if(horaActual.getHours() > 11){
        if(horaActual.getMinutes() < 10){
            document.querySelector('#horaInfo').innerHTML = hora + ':0' + minutos + ' PM';
        }else{
            document.querySelector('#horaInfo').innerHTML = hora + ':' + minutos + ' PM';
        }
    }else{
        if(horaActual.getMinutes() < 10){
            document.querySelector('#horaInfo').innerHTML = hora + ':0' + minutos + ' AM';
        }else{
            document.querySelector('#horaInfo').innerHTML = hora + ':' + minutos + ' AM';
        }
    }

    // Fecha del sistema
    const fecha = Date.now();
    fechaActual = new Date(fecha);

    hoy = fechaActual.toLocaleDateString();

    document.querySelector('#fechaInfo').innerHTML = 'HOY: ' + hoy;
});