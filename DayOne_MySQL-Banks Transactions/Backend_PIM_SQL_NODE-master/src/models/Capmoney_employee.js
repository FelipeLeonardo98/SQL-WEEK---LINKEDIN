//obtendo acesso ao sequelize
const Sequelize = require('sequelize');
const sequelize = require('../database/database');

// criando a table 'pedido'
const Capmoney_employee = sequelize.define(
  'capmoney_employee',
  {
    id:
    {
      type: Sequelize.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    name:
    {
      type: Sequelize.STRING(50),
      allowNull: false,
    },
    cpf:
    {
      type: Sequelize.STRING(15),
      allowNull: false,
      unique: true,
    },
    bornAt:
    {
      type: Sequelize.DATEONLY,
      allowNull: false,
    },
    email:
    {
      type: Sequelize.STRING(50),
      allowNull: false,
      validate: {
        isEmail: true,
      },
    },
    phone:
    {
      type: Sequelize.STRING(15),
      allowNull: false,
    },
    password:
    {
      type: Sequelize.STRING(100),
      allowNull: false,
    },
    address:
    {
      type: Sequelize.STRING(200),
      allowNull: false,
    },
    category:
    {
      type: Sequelize.ENUM('G', 'A'),
      defaultValue: 'A',
      allowNull: false,
    }
  },
  {
    freezeTableName: true,
  }
);

module.exports = Capmoney_employee;

