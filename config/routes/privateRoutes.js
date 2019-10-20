const privateRoutes = {
  'GET /users': 'UserController.getAll',

  'POST /faq': 'FaqController.create',
  'DELETE /faq/:id': 'FaqController.destroy',
  'PATCH /faq/:id': 'FaqController.update',
  'PATCH /faq/visibility/:id': 'FaqController.visibility',

  'POST /process': 'ProcessController.create',
  'PATCH /process/:id': 'ProcessController.update',
  'POST /process/step': 'ProcessController.createStep',
  'PATCH /process/visibility/:id': 'ProcessController.visibility',
  'PATCH /process/step/visibility/:id': 'ProcessController.visibilityStep',

  'POST /portfolio': 'PortfolioController.create',
  'PATCH /portfolio/:id': 'PortfolioController.update',
  'POST /portfolio/artwork': 'PortfolioController.createArtwork',
  'PATCH /portfolio/artwork/:id': 'PortfolioController.updateArtwork',
  'PATCH /portfolio/visibility/:id': 'PortfolioController.visibility',
  'PATCH /portfolio/visibility/artwork/:id': 'PortfolioController.visibilityArtwork',

  'GET /portfolio': 'PortfolioController.getlist',
  'GET /portfolio/artwork/:slug': 'PortfolioController.getArtworks',

  'GET /inquiries': 'InquiryController.getlist',
  'PATCH /inquiries/mark-as-read/:id': 'InquiryController.markAsRead',
  'GET /inquiry/:id': 'InquiryController.get',

  'PATCH /about': 'AboutController.update',
  'PATCH /service': 'ServicesController.update',

};

module.exports = privateRoutes;
