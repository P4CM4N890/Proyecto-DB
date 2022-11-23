const { Pool } = require('pg');
const {ipcRenderer, remote} = require('electron');

const config = {
    user: 'visitante',
    host: 'localhost',
    password: '1234',
    database: 'consultorio'
};

const pool = new Pool(config);

const getMedicina = async () => {
    try{
        const answ = await pool.query("select * from inventario;");
        tam = answ.rows.length;

        for(i = 0; i < tam; i++){
            
            document.getElementById('con').innerHTML += '<div class="pacienteUno primero"><p>' + answ.rows[i].nom_medicina + '</p></div><div class="pacienteDos ultimo"><p>'+ answ.rows[i].cantidad + '</p></div>';
        }

        // pool.end();
    } catch(e){
        console.log(e);
    }
}

medicamento = [];

const setMed = async () => {
    try{
        const insert = 'insert into inventario (id_inventario, nom_medicina, cantidad) values ($1, $2, $3)';

        const cons = 'select max(id_inventario) from inventario;'

        const answA = await pool.query(cons);

        console.log(medicamento);

        const anws = await pool.query(insert, [(answA.rows[0].max + 1), medicamento[0], medicamento[1]]);

        // pool.end();
        medicamento = [];
    }catch(e){
        console.log(e);
    }
}

function getValues() {
    const form = document.forms['medicinaFormAdd'];
    const registro = {
        'nombre' : form.elements[0].value,
        'cantidad' : form.elements[1].value,
    };
    medicamento.push(registro.nombre);
    medicamento.push(registro.cantidad);

    form.reset();
    form.elements[0].focus();

    setMed();
}

mediBu = [];
idpaciente = []

const getMedic = async () => {
    try {
        const p = 'select * from inventario where nom_medicina = $1';

        const answ = await pool.query(p, mediBu);

        idpaciente[0] = answ.rows[0].id_inventario;

        document.getElementById('nombreMed').value = answ.rows[0].nom_medicina;
        document.getElementById('cantidadMed').value = answ.rows[0].cantidad;

    } catch(e) {
        console.log(e);
    }
}

function getMedi() {
    const form = document.forms['medicamentoB'];
    const registro = {
        'nombre' : form.elements[0].value,

    };
    mediBu.push(registro.nombre);

    form.reset();
    form.elements[0].focus();

    getMedic();

    mediBu = [];
    
}

function actualizar() {
    const form = document.forms['medicamentoB'];
    const registro = {
        'nombre' : form.elements[0].value,
        'cantidad' : form.elements[1].value,
    };
    idpaciente.push(registro.nombre);
    idpaciente.push(registro.cantidad);

    form.reset();
    form.elements[0].focus();
    
    actualizarP();
    idpaciente = []
}

const actualizarP = async () => {
    try{
        const ud = 'update inventario set nom_medicina = $2, cantidad = $3 where id_inventario = $1;';

        const answ = await pool.query(ud, idpaciente);

    } catch(e) {
        console.log(e);
    }
}

const eliminar = async () => {
    try {
        const form = document.forms['medicamentoB'];
        const del = 'delete from inventario where id_inventario = $1;';

        const answ = await pool.query(del, [idpaciente[0]]);

        form.reset();
        form.elements[0].focus();
        idpaciente = []
        
    } catch(e) {
        console.log(e);
    }
}

getMedicina();