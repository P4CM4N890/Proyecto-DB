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
        const answ = await pool.query("select * from diagnostico;");

        const paciente = 'select nombre, apellido_paterno, apellido_materno from pacientes where id_paciente = $1;'

        tam = answ.rows.length;

        for(i = 0; i < tam; i++){
            const answ2 = await pool.query(paciente, [answ.rows[i].id_diagnostico]);
            
            document.getElementById('con').innerHTML += '<div class="pacienteUno primero"><p>' + answ2.rows[0].nombre + '</p></div><div class="pacienteDos"><p>'+ answ2.rows[0].apellido_paterno + '</p></div><div class="pacienteUno"><p>' + answ2.rows[0].apellido_materno + '</p></div><div class="pacienteDos ultimo"><p>' + answ.rows[i].nom_enfermedad + '</p></div>';
        }

        // pool.end();
    } catch(e){
        console.log(e);
    }
}

paciente = [];

const setPatients = async () => {
    try{
        const sc = 'select id_paciente from pacientes where nombre = $1 and apellido_paterno = $2 and apellido_materno = $3;'

        const answ2 = await pool.query(sc, [paciente[0], paciente[1], paciente[2]]);

        const insert = 'insert into diagnostico values ($1, $3, $2, $4)';

        const anws = await pool.query(insert, [answ2.rows[0].id_paciente, paciente[3], paciente[4], paciente[5]]);
        // console.log(anws);
        // pool.end();
        paciente = []

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
        'enfermedad' : form.elements[3].value,
        'sintomas' : form.elements[4].value,
        'etapa' : form.elements[5].value,
    };
    paciente.push(registro.nombres);
    paciente.push(registro.apellidoP);
    paciente.push(registro.apellidoM);
    paciente.push(registro.enfermedad);
    paciente.push(registro.sintomas);
    paciente.push(registro.etapa);

    form.reset();
    form.elements[0].focus();

    console.log(paciente[3]);
    
    setPatients();
}

idpaciente = []

const getCs = async () => {
    try{
        const p = 'select * from pacientes where nombre = $1 and apellido_paterno = $2 and apellido_materno = $3';

        const answ = await pool.query(p, pacienteBu);

        const s = 'select * from diagnostico where id_diagnostico = $1;'

        const answ2 = await pool.query(s, [answ.rows[0].id_paciente]);

        idpaciente[0] = answ.rows[0].id_paciente;

        document.getElementById('nombrePaciente').value = answ.rows[0].nombre;
        document.getElementById('aP').value = answ.rows[0].apellido_paterno;
        document.getElementById('aM').value = answ.rows[0].apellido_materno;
        document.getElementById('enfermedad').value = answ2.rows[0].nom_enfermedad;
        document.getElementById('sintomas').value = answ2.rows[0].sintoma;
        document.getElementById('etapa').value = answ2.rows[0].etapa_enfermedad;

    } catch(e) {
        console.log(e);
    }
}

pacienteBu = [];

function getPat() {
    const form = document.forms['pacienteForm'];
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

    getCs();
    pacienteBu = [];
    
}

function actualizar() {
    const form = document.forms['pacienteForm'];
    const registro = {
        'nombres' : form.elements[0].value,
        'apellidoP' : form.elements[1].value,
        'apellidoM' : form.elements[2].value,
        'enfermedad' : form.elements[3].value,
        'sintomas' : form.elements[4].value,
        'etapa' : form.elements[5].value,
    };

    idpaciente.push(registro.enfermedad);
    idpaciente.push(registro.sintomas);
    idpaciente.push(registro.etapa);

    form.reset();
    form.elements[0].focus();
    
    actualizarP();
    idpaciente = []
}

const actualizarP = async () => {
    try{
        const ud = 'update diagnostico set nom_enfermedad = $2, sintoma = $3, etapa_enfermedad = $4 where id_diagnostico = $1;';

        const answ = await pool.query(ud, idpaciente);

        console.log(idpaciente);
    } catch(e) {
        console.log(e);
    }
}

const eliminar = async () => {
    try {
        const form = document.forms['pacienteForm'];
        const del = 'delete from diagnostico where id_diagnostico = $1;';

        const answ = await pool.query(del, [idpaciente[0]]);

        form.reset();
        form.elements[0].focus();
        idpaciente = []
        
    } catch(e) {
        console.log(e);
    }
}

getCita();