


const login = async (req, res) => {
    res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World\n');
    /*
    const email = req.body.email;
    const clearTextPassword = req.body.password;

    try {
        const token = await User.generateAuthToken(email, clearTextPassword);
        res.send({ token });
    } catch (err) {
        res.status(401).send(authErrorString);
    }*/
};

module.exports = login;