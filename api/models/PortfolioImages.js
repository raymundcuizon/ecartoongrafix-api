const Sequelize = require('sequelize');
const bcryptService = require('../services/bcrypt.service');

const sequelize = require('../../config/database');

const hooks = {
  beforeCreate(d) {
    d.updated_at = new Date(Date.now()).toISOString()
    d.created_at = new Date(Date.now()).toISOString()
  },
  beforeUpdate(d){
    d.updated_at = new Date(Date.now()).toISOString()
  }
};

const tableName = 'portfolio_images';

const PortfolioImages = sequelize.define('PortfolioImages', {
  id : {
      type :  Sequelize.INTEGER,
      unique: true,
      primaryKey: true,
      autoIncrement: true
  },
  portfolio_id : {
      type :  Sequelize.INTEGER,
      allowNull: false
  },
  image_id : {
      type :  Sequelize.INTEGER,
      allowNull: false
   },
  status: {
      type: Sequelize.BOOLEAN,
      allowNull: false,
      defaultValue: true
  },
  deleted: {
      type: Sequelize.BOOLEAN,
      allowNull: false,
      defaultValue: false
  },
  created_at : {
      type :  Sequelize.DATE
  },
  updated_at : {
      type :  Sequelize.DATE
  },
}, { hooks, tableName });

// eslint-disable-next-line
PortfolioImages.prototype.toJSON = function () {
  const values = Object.assign({}, this.get());
  return values;
};

module.exports = PortfolioImages;
