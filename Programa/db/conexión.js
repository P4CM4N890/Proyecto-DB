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
        const answ = await pool.query("select * from paciente;");
        tam = answ.rows.length;

        for(i = 0; i < tam; i++){
            
            document.getElementById('con').innerHTML += '<div class="pacienteUno primero"><p>' + answ.rows[i].nombre + '</p></div><div class="pacienteDos"><p>'+ answ.rows[i].apellido_paterno + '</p></div><div class="pacienteUno"><p>' + answ.rows[i].apellido_materno + '</p></div><div class="pacienteDos"><p>' + answ.rows[i].telefono + '</p></div><div class="pacienteUno"><p>' + answ.rows[i].edad + '</p></div><div class="pacienteDos"><p>' + answ.rows[i].genero + '</p></div><div class="pacienteUno ultimo"><p>' + answ.rows[i].direccion + '</p></div>';
        }

        pool.end();
    } catch(e){
        console.log(e);
    }
}

const setPatients = async () => {
    try{
        const insert = 'insert into paciente (id_paciente, nombre, apellido_paterno, apellido_materno, telefono, edad, genero, direccion) values ($1, $2, $3, $4, $5, $6, $7, $8)';
        
        const values = [5, 'Gerardo', 'Hernandez', 'De la Oca', '6677195775', '56', 'm', 'Calle Enrique Segobiano #3568'];

        const anws = await pool.query(insert, values);
        console.log(anws);
        pool.end();

    }catch(e){
        console.log(e);
    }
}

getPatients();