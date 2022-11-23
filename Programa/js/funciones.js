const ipc = window.require('electron').ipcRenderer;

function goto() {
    ipc.send('openVentanaPrincipal');
}

function logout() {
    ipc.send('logOut');
}

function buscarP() {
    ipc.send('searchP');
}

function gotoModalP() {
    ipc.send('openModalP');
}

function gotoModalM() {
    ipc.send('openModalM');
}

function buscarM() {
    ipc.send('searchM');
}