const Blockchain_User = require('../models/Blockchain_user');

// All Blockchain Users
exports.Show = async (req, res) => {
  try {
    const allUsers = await Blockchain_User.findAll();
    res.json(allUsers);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// one Blockchain Users
exports.Search = async (req, res) => {
  const cpf = req.body.cpf;
  try {
    const user = await Blockchain_User.findOne({ where: { cpf: cpf } });
    res.json(user);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
