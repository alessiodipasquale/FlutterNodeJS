const _ = require('lodash');

const User = require('../models/User');

const register = async (req, res) => {
    const user = req.body;
    try {
        const dbInstance = await User.create(user);

        const responseDbInstance = _.omit(dbInstance.dataValues, ['password', 'createdAt', 'updatedAt']);
        res.send(responseDbInstance);
    } catch (err) {
        if (err.original && err.original.errno === 1062) {
            res.status(400).send({ code: err.original.code });
        } else
            res.sendStatus(400);
    }
};

module.exports = register;
