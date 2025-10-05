const express = require('express');

// Constantes para la configuración
const PORT = 3000;
const HOST = '0.0.0.0';

// Crear la instancia de la aplicación
const app = express();

// Definir la ruta principal
app.get('/', (req, res) => {
  res.send('<h1>¡Servidor Node.js con Express funcionando desde Docker!</h1>');
});

// Iniciar el servidor
app.listen(PORT, HOST, () => {
  console.log(`Servidor corriendo en http://${HOST}:${PORT}`);
});