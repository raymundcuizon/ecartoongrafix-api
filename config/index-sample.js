const privateRoutes = require('./routes/privateRoutes');
const publicRoutes = require('./routes/publicRoutes');

const config = {
  migrate: false,
  privateRoutes,
  publicRoutes,
  port: process.env.PORT || '2017',
  host: 'localhost',
  api_url : 'http://api.ecartoongrafix/media'
};

module.exports = config;
