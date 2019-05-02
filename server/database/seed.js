const { Film } = require ('./models')

const seed = async () => {
    let films = [
        await Film.create({
            name: 'Titanic',
            description: 'Affondano'
        }),
        await Film.create({
            name: 'Avengers',
            description: 'IronMan muore'
        }),

    ]
}

module.exports = seed;