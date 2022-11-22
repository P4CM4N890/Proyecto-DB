const ipc = window.require('electron').ipcRenderer;

function goto() {
    ipc.send('openVentanaPrincipal');
}

function logout() {
    ipc.send('logOut');
}

function gotoModalP() {
    ipc.send('openModalP');
    console.log('hola');
}