const privateRoutes = {
  'GET /users': 'UserController.getAll',

  'POST /faq' : 'FaqController.create',

  'POST /process' : 'ProcessController.create',
  'POST /process/step' : 'ProcessController.createStep',

  'POST /portfolio' : 'PortfolioController.create',
  'POST /portfolio/artwork' : 'PortfolioController.createArtwork',

  'GET  /portfolio' : 'PortfolioController.getlist',
  'GET  /portfolio/artwork/:slug' : 'PortfolioController.getArtworks',

};

module.exports = privateRoutes;
