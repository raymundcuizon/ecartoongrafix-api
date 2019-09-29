const privateRoutes = {
  'GET /users': 'UserController.getAll',

  'POST /faq' : 'FaqController.create',

  'POST /process' : 'ProcessController.create',
  'POST /process/step' : 'ProcessController.createStep'


};

module.exports = privateRoutes;
