const Sequelize = require('sequelize');
const parseDbUri = require('parse-db-uri');

const dbParams = parseDbUri(MYSQL_URI="mysql://filmsnetwork:filmsnetworkpwd@localhost:3306/filmsnetwork");

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
