const Blockchain_registerTransaction = require('../models/Blockchain_registerTransaction');
const { Op } = require('sequelize');
const status = require('http-status');
const { NOT_FOUND } = require('http-status');

// all transaction
exports.AllTransactions = async (req, res) => {
    try {
        const allTransactions = await Blockchain_registerTransaction.findAll();
        res.json(allTransactions);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};

// search transaction by CPF (from and destiny)
exports.SearchTransaction = async (req, res) => {
    try {
        const search = req.body.cpf;
        const responseTransaction = await Blockchain_registerTransaction.findAll({
            where:
            {
                [Op.or]: [{ cpf_origin: search }, { cpf_destiny: search }]
            }
        });

        res.send(responseTransaction);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};