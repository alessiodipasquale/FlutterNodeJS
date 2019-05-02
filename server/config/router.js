const login = require('../routes/login');
//const register = require('../routes/register');

const router = {
    initialize: (app, passport) => {
        app.get('/login', login );
       // app.post('/register', register);
/*
        app.post('/login', login);
        app.post('/register', register);

        app.get('/appLatestVersion', appLatestVersion);
        app.get('/robocapp', robocapp);
        app.get('/calendar', calendar);
        app.get('/ranking/:phaseId', ranking);*/
    }
};

module.exports = router;