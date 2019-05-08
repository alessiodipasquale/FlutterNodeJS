const http = require('http');
const path = require('path');
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const args = require('./config/yargs');
const passport = require('passport');
const config = require('./config/config');

config(args);

const router = require('./config/router');
const database = require('./config/database');
const sequelize = require('./config/sequelize');
const passportJwtStrategy = require('./auth/strategies/passportJwt');





const hostname = process.env.HOSTNAME;
const port = process.env.PORT;
const distPath = path.join(__dirname, 'dist');

const app = express();

let server = http.createServer(app);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded())
app.use(cors());

app.use('/', express.static(distPath));


passport.use(passportJwtStrategy);

router.initialize(app, passport);

database.initialize(args)
.then(() => 
  server.listen(port, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
  })
);

  