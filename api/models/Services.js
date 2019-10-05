const Sequelize = require('sequelize');
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

const tableName = 'services';

const Services = sequelize.define('Services', {
  id : {
      type :  Sequelize.INTEGER,
      unique: true,
      primaryKey: true,
      autoIncrement: true
  },
  description: {
    type: Sequelize.STRING,
    allowNull: false
  },
  created_at : {
      type :  Sequelize.DATE
  },
  updated_at : {
      type :  Sequelize.DATE
  },
}, { hooks, tableName });

// eslint-disable-next-line
Services.prototype.toJSON = function () {
  const values = Object.assign({}, this.get());
  return values;
};

module.exports = Services;
