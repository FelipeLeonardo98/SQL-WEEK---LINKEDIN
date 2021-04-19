//obtendo acesso ao sequelize
const Sequelize = require('sequelize');
const sequelize = require('../database/database');


// criando a table 'Capmoney_clientBlocked'
const Capmoney_clientBlocked = sequelize.define(
    'capmoney_clientBlocked',
    {
        id: {
            type: Sequelize.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
        },
        id_client: {
            type: Sequelize.INTEGER,
            allowNull: false,
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
        category: {
            type: Sequelize.ENUM('C'),
            allowNull: false,
            defaultValue: 'C',
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
        openAt: {
            type: Sequelize.DATE,
            allowNull: false,

        },

    },
    {
        freezeTableName: true,
    }
);

module.exports = Capmoney_clientBlocked;
