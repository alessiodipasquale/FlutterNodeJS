const passportJwt = require('passport-jwt');

const ExtractJwt = passportJwt.ExtractJwt;
const JwtStrategy = passportJwt.Strategy;

const jwtOptions = {
    jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
    secretOrKey: process.env.JWT_SECRET,
};

const passportJwtStrategy = new JwtStrategy(jwtOptions, (jwtPayload, next) => {
    next(null, jwtPayload);
});

module.exports = passportJwtStrategy;