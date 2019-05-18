const { Film, User } = require ('./models')

const seed = async () => {
    let users = [
        User.create({
            name: 'username1',
            surname: 'surname1',
            birthDate: new Date(2000, 12, 2),
            email: 'email1@gmail.com',
            password: 'admin1',
            isAdmin: true
        }),
        User.create({
            name: 'username2',
            surname: 'surname2',
            birthDate: new Date(2001, 3, 10),
            email: 'email2@gmail.com',
            password: 'admin2',
            isAdmin: true
        })];

    let films = [
        await Film.create({
            name: 'Titanic',
            description: 'They sink.'
        }),
        await Film.create({
            name: 'Avengers',
            description: 'IronMan death.'
        }),

    ];
}

module.exports = seed;