// getting dependences
const Sequelize = require('sequelize');
const sequelize = require('../database/database');
//const Blockchain_User = require('./Blockchain_user');

const Blockchain_extract = sequelize.define('blockchain_extract', {
    id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
    },
    description: {
        type: Sequelize.STRING(10),
        allowNull: false,
    },
    value: {
        type: Sequelize.FLOAT,
        allowNull: false,
    },
    fk_user: {
        type: Sequelize.INTEGER,
        references: { model: 'blockchain_user', key: 'id' },
        allowNull: false,
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
    }
},
    {
        freezeTableName: true,
    }
);

module.exports = Blockchain_extract;