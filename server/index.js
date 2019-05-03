const http = require('http');
const path = require('path');
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const args = require('./config/yargs');
const passport = require('passport');
const router = require('./config/router');
const database = require('./config/database');
const sequelize = require('./config/sequelize');

const hostname = 'localhost';
const port = 3000;
const distPath = path.join(__dirname, 'dist');

const app = express();

let server = http.createServer(app);
app.use(bodyParser.json());
app.use(cors());

app.use('/', express.static(distPath));
router.initialize(app, passport);

database.initialize(args)
.then(() => 
  server.listen(port, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
  })
);

  