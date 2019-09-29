const publicRoutes = {
  'POST /user': 'UserController.register',
  'POST /register': 'UserController.register', // alias for POST /user
  'POST /login': 'UserController.login',
  'POST /validate': 'UserController.validate',

  // Faq
  'GET  /faq' : 'FaqController.getlist',

  'GET  /process' : 'ProcessController.getlist',


};

module.exports = publicRoutes;
