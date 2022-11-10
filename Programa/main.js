const {app, BrowserWindow, Menu, ipcMain} = require('electron');
const Main = require('electron/main');

let login;
let ventanaPrincipal;

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