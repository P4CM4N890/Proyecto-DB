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

        for(i = 0; i < tam; i++){
            const answ2 = await pool.query(paciente, [answ.rows[i].id_cita]);
            
            document.getElementById('con').innerHTML += '<div class="pacienteUno primero"><p>' + answ2.rows[0].nombre + '</p></div><div class="pacienteDos"><p>'+ answ2.rows[0].apellido_paterno + '</p></div><div class="pacienteUno"><p>' + answ2.rows[0].apellido_materno + '</p></div><div class="pacienteDos"><p>' + answ.rows[i].day + '-' + answ.rows[i].month + '-' + answ.rows[i].year + '</p></div><div class="pacienteUno ultimo"><p>' + answ.rows[i].hora + '</p></div>';
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

        const insert = 'insert into cita values ($1, $2, $3)';

        const anws = await pool.query(insert, [answ2.rows[0].id_paciente, paciente[3], paciente[4]]);
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
        'fecha' : form.elements[3].value,
        'hora' : form.elements[4].value,
    };
    paciente.push(registro.nombres);
    paciente.push(registro.apellidoP);
    paciente.push(registro.apellidoM);
    paciente.push(registro.fecha);
    paciente.push(registro.hora);

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

        const s = 'select extract(day from fecha) as day, extract(month from fecha) as month,extract(year from fecha) as year, hora, id_cita from cita where id_cita = $1;'

        const answ2 = await pool.query(s, [answ.rows[0].id_paciente]);

        idpaciente[0] = answ.rows[0].id_paciente;

        document.getElementById('nombrePaciente').value = answ.rows[0].nombre;
        document.getElementById('aP').value = answ.rows[0].apellido_paterno;
        document.getElementById('aM').value = answ.rows[0].apellido_materno;
        document.getElementById('fechaCita').value = answ2.rows[0].year + '-' + answ2.rows[0].month + '-' + answ2.rows[0].day;
        document.getElementById('horaCita').value = answ2.rows[0].hora;

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
        'fecha' : form.elements[3].value,
        'hora' : form.elements[4].value,
    };
    idpaciente.push(registro.fecha);
    idpaciente.push(registro.hora);

    form.reset();
    form.elements[0].focus();
    
    actualizarP();
    idpaciente = []
}

const actualizarP = async () => {
    try{
        const ud = 'update cita set fecha = $2, hora = $3 where id_cita = $1;';

        const answ = await pool.query(ud, idpaciente);

        console.log(idpaciente);
    } catch(e) {
        console.log(e);
    }
}

const eliminar = async () => {
    try {
        const form = document.forms['pacienteForm'];
        const del = 'delete from cita where id_cita = $1;';

        const answ = await pool.query(del, [idpaciente[0]]);

        form.reset();
        form.elements[0].focus();
        idpaciente = []
        
    } catch(e) {
        console.log(e);
    }
}

getCita();