const yargs = require('yargs');

yargs
    .option('reset', {
        alias: 'r',
        default: false,
        type: 'boolean'
    });

module.exports = yargs.argv;