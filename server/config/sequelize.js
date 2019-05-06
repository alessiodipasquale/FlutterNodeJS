const Sequelize = require('sequelize');
const parseDbUri = require('parse-db-uri');

const dbParams = parseDbUri(process.env.MYSQL_URI);

const sequelize = new Sequelize(dbParams.database, dbParams.user, dbParams.password, {
    host: dbParams.resource,
    dialect: dbParams.protocol,

    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    },

    operatorsAliases: false,
    logging: false
});

module.exports = sequelize;
