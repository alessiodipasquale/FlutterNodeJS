const sequelize = require('./sequelize');
const seed = require('../database/seed');

const database = {
    initialize: async (options) => {
        try {
            await sequelize.authenticate();
            console.log('Connection to database has been established successfully.');

            require('../database/models');
            console.log('Models initialized succesfully');

            /*require('./../database/associations');
            console.log('Associations initialized succesfully');*/

            if (options.reset)
                console.log('Resetting database forcedly...');
            await sequelize.sync({ force: options.reset, alter: true });
            if (options.reset || options.seed) {
                console.log('Initializing data...');
                await seed();
                console.log('Data initialized successfully');
            }
            console.log('Database initialized successfully');
        } catch (err) {
            console.log(err);
            log.error(err);
            if (options.reset)
                process.exit(1);
        }
    }
};

module.exports = database;
