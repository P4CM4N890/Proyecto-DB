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
        // const answ = await pool.query("select extract(day from fecha) as day, extract(month from fecha) as month,extract(year from fecha) as year, hora, id_paciente from cita;");

        const paciente = 'select nombre, apellido_paterno, apellido_materno from pacientes where id_paciente = 4;'

        // tam = answ.rows.length;

        id = 4

        const answ2 = await pool.query(paciente);

        console.log(answ2.rows);

        // for(i = 0; i < tam; i++){
            
        //     document.getElementById('con').innerHTML += '<div class="pacienteUno primero"><p>' + answ.rows[i].nombre + '</p></div><div class="pacienteDos"><p>'+ answ.rows[i].apellido_paterno + '</p></div><div class="pacienteUno"><p>' + answ.rows[i].apellido_materno + '</p></div><div class="pacienteDos"><p>' + answ.rows[i].day + '-' + answ.rows[i].month + '-' + answ.rows[i].year + '</p></div><div class="pacienteUno ultimo"><p>' + answ.rows[i].hora + '</p></div>';
        // }

        // pool.end();
    } catch(e){
        console.log(e);
    }
}

paciente = [];

const setPatients = async () => {
    try{
        const insert = 'insert into pacientes (nombre, apellido_paterno, apellido_materno, telefono, edad, genero, direccion) values ($1, $2, $3, $4, $5, $6, $7)';

        const anws = await pool.query(insert, paciente);
        // console.log(anws);
        // pool.end();

    }catch(e){
        console.log(e);
    }
}

function getValues() {
    const form = document.forms['pacienteForm'];
    const registro = {
        'nombres' : form.elements[0].value,
        'apellidoP' : form.elements[1].value,
        'apellidoM' : form.elements[2].value,
        'tel' : form.elements[3].value,
        'edad' : form.elements[4].value,
        'gen' : form.elements[5].value,
        'dir' : form.elements[6].value,
    };
    paciente.push(registro.nombres);
    paciente.push(registro.apellidoP);
    paciente.push(registro.apellidoM);
    paciente.push(registro.tel);
    paciente.push(registro.edad);
    paciente.push(registro.gen);
    paciente.push(registro.dir);

    form.reset();
    form.elements[0].focus();
    
    setPatients();
    paciente = []
}

getCita();