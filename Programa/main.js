const {app, BrowserWindow, Menu, ipcMain} = require('electron');
const Main = require('electron/main');

let login;

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

app.whenReady().then(createLogin);

app.on('window-all-closed', function() {
    if(process.platform !== 'darwin'){
        app.quit();
    }
});

ipcMain.on('Prueba', function() {
    login.webContents.send('Prueba');
});