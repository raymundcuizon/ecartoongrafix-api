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
  client_type: {
      type: Sequelize.STRING
  },
  final_graphic: {
      type: Sequelize.STRING
  },
  deadline: {
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
  targe_audience: {
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
