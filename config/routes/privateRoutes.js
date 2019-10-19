const privateRoutes = {
  'GET /users': 'UserController.getAll',

  'POST /faq': 'FaqController.create',
  'DELETE /faq/:id': 'FaqController.destroy',
  'PATCH /faq/:id': 'FaqController.update',
  'PATCH /faq/visibility/:id': 'FaqController.visibility',

  'POST /process': 'ProcessController.create',
  'POST /process/step': 'ProcessController.createStep',

  'POST /portfolio': 'PortfolioController.create',
  'PATCH /portfolio/:id': 'PortfolioController.update',
  'POST /portfolio/artwork': 'PortfolioController.createArtwork',
  'PATCH /portfolio/artwork/:id': 'PortfolioController.updateArtwork',

  'GET /portfolio': 'PortfolioController.getlist',
  'GET /portfolio/artwork/:slug': 'PortfolioController.getArtworks',

  'GET /inquiries': 'InquiryController.getlist',
  'GET /inquiry/:id': 'InquiryController.get',

  'PATCH /about': 'AboutController.update',
  'PATCH /service': 'ServicesController.update',

};

module.exports = privateRoutes;
