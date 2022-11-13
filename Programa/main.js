const {app, BrowserWindow, Menu, ipcMain} = require('electron');
const Main = require('electron/main');

let login;
let ventanaPrincipal;
let paciente;
let cita;

function createLogin() {
    login = new BrowserWindow({
        width: 700,
        height: 450,
        resizable: false,
        webPreferences: {
            nodeIntegration: true,
            contextIsolation: false,
        }
    });

    login.loadFile('index.html');
    
    login.on('closed', () => {
        login = null;
    });
}

function createVentanaPrincipal() {
    ventanaPrincipal = new BrowserWindow({
        // parent: login,
        width: 900,
        height: 600,
        title: 'Menú',
        webPreferences: {
            nodeIntegration: true,
            contextIsolation: false,
        }
    });

    ventanaPrincipal.loadFile('html/ventanaPrincipal.html');
    
    ventanaPrincipal.on('closed', function() {
        ventanaPrincipal = null;
    })
}

function createPaciente() {
    paciente = new BrowserWindow({
        // parent: login,
        width: 900,
        height: 600,
        title: 'Agreagr Paciente',
        webPreferences: {
            nodeIntegration: true,
            contextIsolation: false,
        }
    });

    paciente.loadFile('html/paciente.html');
    
    paciente.on('closed', function() {
        paciente = null;
    })
}

function createCita() {
    cita = new BrowserWindow({
        // parent: login,
        width: 700,
        height: 450,
        title: 'Agendar Cita',
        webPreferences: {
            nodeIntegration: true,
            contextIsolation: false,
        }
    });

    cita.loadFile('html/cita.html');
    
    cita.on('closed', function() {
        cita = null;
    })
}

app.whenReady().then(createLogin);

app.on('window-all-closed', function() {
    if(process.platform !== 'darwin'){
        app.quit();
    }
});

ipcMain.on('Prueba', function() {
    login.webContents.send('Prueba');
});

ipcMain.on('openVentanaPrincipal', (event, arg) => {
    createVentanaPrincipal();
    login.close();
})

ipcMain.on('openVentanaPaciente', (event, arg) => {
    createPaciente();
    ventanaPrincipal.close();
})

ipcMain.on('regresaVentanaPrincipal', (event, arg) => {
    createVentanaPrincipal();
    paciente.close();
})

ipcMain.on('openVentanaCita', (event, arg) => {
    createCita();
    ventanaPrincipal.close();
})

ipcMain.on('returnVentanaPrincipal', (event, arg) => {
    createVentanaPrincipal();
    cita.close();
})