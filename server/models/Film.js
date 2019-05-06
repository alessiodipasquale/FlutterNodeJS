const Sequelize = require('sequelize');
const sequelize = require('../config/sequelize');

const Film = sequelize.define('Film', {
    name: {type: Sequelize.STRING, allowNull: false},
    description: {type: Sequelize.STRING, allowNull: false}
});

module.exports = Film;