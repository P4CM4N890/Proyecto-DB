const { Pool } = require('pg');

const config = {
    user: 'visitante',
    host: 'localhost',
    password: '1234',
    database: 'consultorio'
};

const pool = new Pool(config);

const getPatients = async () => {
    const answ = await pool.query("select * from paciente;");
    console.log(answ.rows);
}

getPatients();