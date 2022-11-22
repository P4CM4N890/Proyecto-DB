const { Pool } = require('pg');
const {ipcRenderer, remote} = require('electron');

const config = {
    user: 'visitante',
    host: 'localhost',
    password: '1234',
    database: 'consultorio'
};

const pool = new Pool(config);

const getPatients = async () => {
    try{
        const answ = await pool.query("select * from pacientes;");
        tam = answ.rows.length;

        for(i = 0; i < tam; i++){
            
            document.getElementById('con').innerHTML += '<div class="pacienteUno primero"><p>' + answ.rows[i].nombre + '</p></div><div class="pacienteDos"><p>'+ answ.rows[i].apellido_paterno + '</p></div><div class="pacienteUno"><p>' + answ.rows[i].apellido_materno + '</p></div><div class="pacienteDos"><p>' + answ.rows[i].telefono + '</p></div><div class="pacienteUno"><p>' + answ.rows[i].edad + '</p></div><div class="pacienteDos"><p>' + answ.rows[i].genero + '</p></div><div class="pacienteUno ultimo"><p>' + answ.rows[i].direccion + '</p></div>';
        }

        pool.end();
    } catch(e){
        console.log(e);
    }
}

paciente = [];

const setPatients = async () => {
    try{
        const insert = 'insert into pacientes (nombre, apellido_paterno, apellido_materno, telefono, edad, genero, direccion) values ($1, $2, $3, $4, $5, $6, $7)';

        const anws = await pool.query(insert, paciente);
        console.log(anws);
        pool.end();

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

getPatients();