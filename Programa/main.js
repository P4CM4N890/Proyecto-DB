const {app, BrowserWindow, Menu, ipcMain} = require('electron');
const Main = require('electron/main');

let login;
let ventanaPrincipal;
let ventanaModalP;

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
        height: 660, // 640 en caso de no tener el menú
        title: 'Menú',
        resizable: false,
        webPreferences: {
            nodeIntegration: true,
            contextIsolation: false,
        },
    });

    ventanaPrincipal.loadFile('html/ventanaPrincipal.html');
    // ventanaPrincipal.setMenu(null);
    
    ventanaPrincipal.on('closed', function() {
        ventanaPrincipal = null;
    })
}

function createModalP() {
    ventanaModalP = new BrowserWindow({
        parent: ventanaPrincipal,
        width: 500,
        height: 400,
        title: 'Agregar',
        modal: true,
        resizable: false,
        webPreferences: {
            nodeIntegration: true,
            contextIsolation: false,
        },
    });
    ventanaModalP.loadFile('html/agregarPaciente.html');

    ventanaModalP.on('closed', function(){
        ventanaModalP = null;
        ventanaPrincipal.reload();
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

ipcMain.on('openModalP', (event, arg) => {
    createModalP();
})