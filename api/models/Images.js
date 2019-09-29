const Sequelize = require('sequelize');
const bcryptService = require('../services/bcrypt.service');

const sequelize = require('../../config/database');

const hooks = {
  // beforeCreate(d) {
  //   d.updated_at = new Date(Date.now()).toISOString()
  //   d.created_at = new Date(Date.now()).toISOString()
  // },
  // beforeUpdate(d){
  //   d.updated_at = new Date(Date.now()).toISOString()
  // }
};

const tableName = 'images';

const Images = sequelize.define('Images', {
  id : {
      type :  Sequelize.INTEGER,
      unique: true,
      primaryKey: true,
      autoIncrement: true
  },
  title : {
      type :  Sequelize.STRING,
      unique: true,
      allowNull: true,
   },
  description : {
      type :  Sequelize.TEXT,
      allowNull: true
  },
  filename : {
      type :  Sequelize.STRING,
      allowNull: false
  },
  folder_name : {
      type :  Sequelize.STRING,
      allowNull: false
  },
  category : {
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
  }
}, { hooks, tableName });

// eslint-disable-next-line
Images.prototype.toJSON = function () {
  const values = Object.assign({}, this.get());
  return values;
};

module.exports = Images;
