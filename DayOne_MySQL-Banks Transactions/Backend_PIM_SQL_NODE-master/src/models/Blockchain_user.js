//obtendo acesso ao sequelize
const Sequelize = require('sequelize');
const sequelize = require('../database/database');
//const { Association } = require('sequelize');

// criando a table 'Blockchain.User'
const Blockchain_User = sequelize.define(
  'blockchain_user',
  {
    id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    name: {
      type: Sequelize.STRING(50),
      allowNull: false,
    },
    cpf: {
      type: Sequelize.STRING(15),
      allowNull: false,
      unique: true,
    },
    bornAt: {
      type: Sequelize.DATEONLY,
      allowNull: false,
    },
    email: {
      type: Sequelize.STRING(50),
      allowNull: false,
      validate: {
        isEmail: true,
      },
    },
    phone: {
      type: Sequelize.STRING(15),
      allowNull: false,
    },
    password: {
      type: Sequelize.STRING(100),
      allowNull: false,
    },
    address: {
      type: Sequelize.STRING(200),
      allowNull: false,
    },
    agency: {
      type: Sequelize.STRING(30),
      allowNull: true,
      defaultValue: 'Individual',
    },
    account: {
      type: Sequelize.STRING(5),
      allowNull: true,
      defaultValue: 'N/P',
    },
    balance: {
      type: Sequelize.FLOAT(8, 2),
      allowNull: true,
      defaultValue: 0
    },
  },
  {
    freezeTableName: true,
  }
);

module.exports = Blockchain_User;

