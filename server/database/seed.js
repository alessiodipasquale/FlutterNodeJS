const { Film, User } = require ('./models')

const seed = async () => {
    let users = [
        User.create({
            name: 'Alessio',
            surname: 'Di Pasquale',
            birthDate: new Date(2000, 12, 2),
            email: 'alessio.dipasquale.dev@gmail.com',
            password: 'admin1',
            isAdmin: true
        }),
        User.create({
            name: 'Samuele',
            surname: 'Simone',
            birthDate: new Date(2001, 3, 10),
            email: 'samuele.simone.dev@gmail.com',
            password: 'admin2',
            isAdmin: true
        })];

    let films = [
        await Film.create({
            name: 'Titanic',
            description: 'Affondano'
        }),
        await Film.create({
            name: 'Avengers',
            description: 'IronMan muore'
        }),

    ];
}

module.exports = seed;