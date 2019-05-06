const User = require('../models/User');
const { authErrorString } = require('../config/values');


const login = async (req, res) => {

    console.log(req.body);

    const email = req.body.email;

    const clearTextPassword = req.body.password;


    try {
        const token = await User.generateAuthToken(email, clearTextPassword);
        res.send({ token });
    } catch (err) {
        res.status(401).send(authErrorString);
    }
};

module.exports = login;