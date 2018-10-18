const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const config = require('../config.json');
const tokenList = {};

router.get('/', (req, res) => res.send('It works!'));

router.post('/auth/login', (req, res) => {
    const { email, pass } = req.body;
    if (email === 'penniath@acme.com' && pass === 'penniath') {
        const payload = { email };
        const response = createJwtResponse(payload);

        return res.status(200).json(response);
    }
    return res.status(401).json({});
});

router.post('/auth/token', (req, res) => {
    const refresh = req.query['refreshToken'];
    if (refresh && refresh in tokenList) {
        const parsed = jwt.decode(refresh);
        const payload = { email: parsed.email };
        const response = createJwtResponse(payload);
        
        return res.status(200).json(response);        
    }

    return res.status(401).json({});
});

const createJwtResponse = (payload) => {
    const token = jwt.sign(payload, config.secret, { expiresIn: config.tokenLife });
    const refreshToken = jwt.sign(payload, config.refreshTokenSecret, { expiresIn: config.refreshTokenLife });
    const response = { token, refreshToken };
    tokenList[refreshToken] = response;

    return response;
};

module.exports = router;
