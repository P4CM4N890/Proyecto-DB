const { Pool } = require('pg');

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
        console.log(answ.rows);
    } catch(e){
        console.log('Error al obtener los pacientes')
    }
}

getPatients();