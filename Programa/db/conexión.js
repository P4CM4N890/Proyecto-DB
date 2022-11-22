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

idpaciente = []

const getPaciente = async () => {
    try{
        const p = 'select * from pacientes where nombre = $1 and apellido_paterno = $2 and apellido_materno = $3';

        const answ = await pool.query(p, pacienteBu);

        idpaciente[0] = answ.rows[0].id_paciente;

        document.getElementById('nombrePaciente').value = answ.rows[0].nombre;
        document.getElementById('aP').value = answ.rows[0].apellido_paterno;
        document.getElementById('aM').value = answ.rows[0].apellido_materno;
        document.getElementById('telPa').value = answ.rows[0].telefono;
        document.getElementById('edadPa').value = answ.rows[0].edad;
        document.getElementById('genPa').value = answ.rows[0].genero;
        document.getElementById('dirPa').value = answ.rows[0].direccion;

    } catch(e) {
        console.log(e);
    }
}

pacienteBu = [];

function getPat() {
    const form = document.forms['pacienteB'];
    const registro = {
        'nombres' : form.elements[0].value,
        'apellidoP' : form.elements[1].value,
        'apellidoM' : form.elements[2].value,

    };
    pacienteBu.push(registro.nombres);
    pacienteBu.push(registro.apellidoP);
    pacienteBu.push(registro.apellidoM);


    form.reset();
    form.elements[0].focus();

    getPaciente();
    pacienteBu = [];
    
}

function actualizar() {
    const form = document.forms['pacienteB'];
    const registro = {
        'nombres' : form.elements[0].value,
        'apellidoP' : form.elements[1].value,
        'apellidoM' : form.elements[2].value,
        'tel' : form.elements[3].value,
        'edad' : form.elements[4].value,
        'gen' : form.elements[5].value,
        'dir' : form.elements[6].value,
    };
    idpaciente.push(registro.nombres);
    idpaciente.push(registro.apellidoP);
    idpaciente.push(registro.apellidoM);
    idpaciente.push(registro.tel);
    idpaciente.push(registro.edad);
    idpaciente.push(registro.gen);
    idpaciente.push(registro.dir);

    form.reset();
    form.elements[0].focus();
    
    actualizarP();
    idpaciente = []
}

const actualizarP = async () => {
    try{
        const ud = 'update pacientes set nombre = $2, apellido_paterno = $3, apellido_materno = $4, telefono = $5, edad = $6, genero = $7, direccion = $8 where id_paciente = $1;';

        const answ = await pool.query(ud, idpaciente);

        console.log(idpaciente);
    } catch(e) {
        console.log(e);
    }
}

const eliminar = async () => {
    try {
        const form = document.forms['pacienteB'];
        const del = 'delete from pacientes where id_paciente = $1;';

        const answ = await pool.query(del, [idpaciente[0]]);

        form.reset();
        form.elements[0].focus();
        idpaciente = []
        
    } catch(e) {
        console.log(e);
    }
}

getPatients();