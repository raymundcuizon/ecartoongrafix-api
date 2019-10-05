const Sequelize = require('sequelize');
const bcryptService = require('../services/bcrypt.service');

const sequelize = require('../../config/database');
const sequelizePaginate = require('sequelize-paginate')


const hooks = {
  beforeCreate(d) {
    d.updated_at = new Date(Date.now()).toISOString()
    d.created_at = new Date(Date.now()).toISOString()
  },
  beforeUpdate(d){
    d.updated_at = new Date(Date.now()).toISOString()
  }
};

const tableName = 'portfolio';

const Portfolio = sequelize.define('Portfolio', {
  id : {
      type :  Sequelize.INTEGER,
      unique: true,
      primaryKey: true,
      autoIncrement: true
  },
  name : {
      type :  Sequelize.STRING,
      unique: true,
      allowNull: false
  },
  slug : {
      type :  Sequelize.STRING,
      unique: true,
      allowNull: false
  },
  description: {
      type: Sequelize.TEXT,
      allowNull: false
  },
  thumbnail: {
      type: Sequelize.INTEGER,
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

// eslint-disable-next-line
sequelizePaginate.paginate(Portfolio)

Portfolio.prototype.toJSON = function () {
  const values = Object.assign({}, this.get());
  return values;
};

module.exports = Portfolio;
