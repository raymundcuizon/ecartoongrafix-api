const Sequelize = require('sequelize');
const bcryptService = require('../services/bcrypt.service');

const sequelize = require('../../config/database');
const sequelizePaginate = require('sequelize-paginate');

const hooks = {
  beforeCreate(d) {
    // d.updated_at = new Date(Date.now()).toISOString()
    d.created_at = new Date(Date.now()).toISOString()
  },
  beforeUpdate(d){
    // d.updated_at = new Date(Date.now()).toISOString()
  }
};

const tableName = 'contact_us';

// email_address *
// final_graphic_print *
// final_graphic_web *
// final_graphic_apparel *
// final_graphic_other *
// target_audience *
// positioning *

const ContactUs = sequelize.define('contact_us', {
  id : {
      type :  Sequelize.INTEGER,
      unique: true,
      primaryKey: true,
      autoIncrement: true
  },
  contact_name: {
      type: Sequelize.STRING
  },
  company_name: {
      type: Sequelize.STRING
  },
  phone_number: {
      type: Sequelize.STRING
  },
  website: {
      type: Sequelize.STRING
  },
  project_name: {
      type: Sequelize.STRING
  },
  license: {
      type: Sequelize.STRING
  },
  illustration_usage: {
      type: Sequelize.STRING
  },
  illustration_usage_other: {
      type: Sequelize.STRING
  },
  client_type: {
      type: Sequelize.STRING
  },
  deadline: {
      type: Sequelize.STRING
  },
  deadline_other: {
      type: Sequelize.STRING
  },
  project_about: {
      type: Sequelize.TEXT
  },
  cps_background: {
      type: Sequelize.TEXT
  },
  budget: {
      type: Sequelize.FLOAT
  },
  project_usage: {
      type: Sequelize.TEXT
  },
  colors: {
      type: Sequelize.TEXT
  },
  look_feel: {
      type: Sequelize.TEXT
  },
  font_lettering: {
      type: Sequelize.TEXT
  },
  etc: {
      type: Sequelize.TEXT
  },
  email_address : {
      type: Sequelize.STRING
  },
  final_graphic_print : {
      type: Sequelize.STRING
  },
  final_graphic_web : {
      type: Sequelize.STRING
  },
  final_graphic_apparel : {
      type: Sequelize.STRING
  },
  final_graphic_other : {
      type: Sequelize.STRING
  },
  final_graphic_other_details : {
      type: Sequelize.STRING
  },
  target_audience : {
      type: Sequelize.TEXT
  },
  positioning : {
      type: Sequelize.STRING
  },
  reference_photos: {
      type: Sequelize.STRING
  },
  status: {
      type: Sequelize.INTEGER
  },
  created_at : {
      type :  Sequelize.DATE
  },
}, { hooks, tableName });

sequelizePaginate.paginate(ContactUs)

// eslint-disable-next-line
ContactUs.prototype.toJSON = function () {
  const values = Object.assign({}, this.get());
  return values;
};

module.exports = ContactUs;
