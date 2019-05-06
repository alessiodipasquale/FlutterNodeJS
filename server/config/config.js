const dotenv = require('dotenv');
const path = require('path');

const env = process.env.NODE_ENV || 'development';

const config = (options) => {
    if (env === 'development' || env === 'test')
        dotenv.config({ path: path.join(__dirname, '../development.env') });
    else
        dotenv.config({ path: path.join(__dirname, '../.env') });
    
    if (options.debug)
        process.env.DEBUG = '*';
};

module.exports = config;
