const Sequelize = require('sequelize');
const bcryptService = require('../services/bcrypt.service');

const sequelize = require('../../config/database');
const sequelizePaginate = require('sequelize-paginate');

const hooks = {
  beforeCreate(d) {
    d.updated_at = new Date(Date.now()).toISOString()
    d.created_at = new Date(Date.now()).toISOString()
  },
  beforeUpdate(d){
    d.updated_at = new Date(Date.now()).toISOString()
  }
};

const tableName = 'faq';

const Faq = sequelize.define('Faq', {
  id : {
      type :  Sequelize.INTEGER,
      unique: true,
      primaryKey: true,
      autoIncrement: true
  },
  title : {
      type :  Sequelize.STRING,
      unique: true,
      allowNull: false,
     //  validate: {
     //     len: {
     //         args: 30,
     //         msg: "Name must be atleast 3 characters in length"
     //     }
     // }
   },
  question : {
      type :  Sequelize.STRING,
      allowNull: false
  },
  answer: {
    type: Sequelize.STRING,
    allowNull: false
  },
  status: {
    type: Sequelize.BOOLEAN,
    allowNull: false,
    defaultValue: true
  },
  created_at : {
      type :  Sequelize.DATE
  },
  updated_at : {
      type :  Sequelize.DATE
  },
}, { hooks, tableName });

sequelizePaginate.paginate(Faq)

// eslint-disable-next-line
Faq.prototype.toJSON = function () {
  const values = Object.assign({}, this.get());
  return values;
};

module.exports = Faq;
