const { Pool } = require('pg');
const {ipcRenderer, remote} = require('electron');

const config = {
    user: 'visitante',
    host: 'localhost',
    password: '1234',
    database: 'consultorio'
};

const pool = new Pool(config);

const getCita = async () => {
    try{
        const answ = await pool.query("select extract(day from fecha) as day, extract(month from fecha) as month,extract(year from fecha) as year, hora, id_cita from cita;");

        const paciente = 'select nombre, apellido_paterno, apellido_materno from pacientes where id_paciente = $1;'

        tam = answ.rows.length;

        for(i = 0; i < tam &&  i < 4; i++){
            const answ2 = await pool.query(paciente, [answ.rows[i].id_cita]);
            
            document.getElementById('con').innerHTML += '<div class="pacienteUno primero"><p>' + answ2.rows[0].nombre + '</p></div><div class="pacienteDos"><p>'+ answ2.rows[0].apellido_paterno + '</p></div><div class="pacienteUno"><p>' + answ2.rows[0].apellido_materno + '</p></div><div class="pacienteDos"><p>' + answ.rows[i].day + '-' + answ.rows[i].month + '-' + answ.rows[i].year + '</p></div><div class="pacienteUno ultimo"><p>' + answ.rows[i].hora + '</p></div>';
        }

        // pool.end();
    } catch(e){
        console.log(e);
    }
}

getCita();