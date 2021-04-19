const sequelize = require('../database/database');
const Sequelize = require('sequelize');

//table 'Blockchain_registerTransaction
const Blockchain_registerTransaction = sequelize.define('blockchain_registerTransaction', {
    id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true
    },
    name_origin: {
        type: Sequelize.STRING(50),
        allowNull: false,
    },
    cpf_origin: {
        type: Sequelize.STRING(15),
        allowNull: false,
    },
    agency: {
        type: Sequelize.STRING(30),
        allowNull: true,
        defaultValue: 'Individual',
    },
    value: {
        type: Sequelize.FLOAT(8, 2),
        allowNull: false,
        defaultValue: 0
    },
    name_destiny: {
        type: Sequelize.STRING(50),
        allowNull: false,
    },
    cpf_destiny: {
        type: Sequelize.STRING(15),
        allowNull: false,
    },
},
    {
        freezeTableName: true,
    }
);

module.exports = Blockchain_registerTransaction;