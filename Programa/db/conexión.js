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
        tam = answ.rows.length

        for(i = 0; i < tam; i++){
            
            document.getElementById('test').innerHTML += '<li>' + answ.rows[i].nombre + '</li>';
        }
    } catch(e){
        console.log('Error al obtener los pacientes')
    }
}

getPatients();
