const Capmoney_employee = require('../models/Capmoney_employee');
const status = require('http-status');
const { NOT_FOUND } = require('http-status');

// new employee
exports.Insert = async (req, res) => {
  try {
    const newEmployee = await Capmoney_employee.create(req.body);
    res.json(newEmployee);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Show All
exports.Show = async (req, res) => {
  try {
    const AllEmployees = await Capmoney_employee.findAll();
    res.json(AllEmployees);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

//authenticate
exports.Login = async (req, res) => {
  try {
    const { cpf, password } = req.body;

    const employee = await Capmoney_employee.findOne({ where: { cpf: cpf } });

    if (!employee) {
      res.status(401).json({ error: 'Invalid CPF' });
    }

    if (employee.password !== password) {
      res.status(401).json({ error: 'Invalid password' });
    }

    res.json({ employee });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Update
exports.Update = async (req, res) => {
  try {
    const client = await Capmoney_employee.findOne({
      where: { cpf: req.body.cpf },
    });

    if (client === null) {
      return res.json({
        error: `Cliente não cadastrado! `,
      });
    }

    await client.update(req.body);
    res.json(client);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
