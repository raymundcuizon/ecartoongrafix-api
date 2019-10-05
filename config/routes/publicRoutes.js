const publicRoutes = {
  'POST /user': 'UserController.register',
  'POST /register': 'UserController.register', // alias for POST /user
  'POST /login': 'UserController.login',
  'POST /validate': 'UserController.validate',

  // Faq
  'GET /faq': 'FaqController.getlist',

  'GET /process': 'ProcessController.getlist',
  'GET /process/:slug': 'ProcessController.getSingle',

  'GET /portfolio': 'PortfolioController.getlist',
  'GET /portfolio/artwork/:slug': 'PortfolioController.getArtworks',

  'GET /about': 'AboutController.getlist',
  'GET /service': 'ServicesController.getlist',

  'POST /inquiry': 'InquiryController.create',

};

module.exports = publicRoutes;
