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
            
            document.getElementById('con').innerHTML += '<div class="pacienteUno primero"><p>' + answ.rows[i].nom_inv + '</p></div><div class="pacienteDos ultimo"><p>'+ answ.rows[i].cantidad + '</p></div>';
        }

        // pool.end();
    } catch(e){
        console.log(e);
    }
}

getMedicina();