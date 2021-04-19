const Capmoney_clientBlocked = require('../models/Capmoney_clientBlocked');


//Show all clients blockeds
exports.Show = async (req, res) => {
  try {
    const Allblockeds = await Capmoney_clientBlocked.findAll();
    res.json(Allblockeds);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// find one
exports.Index = async (req, res) => {
  try {
    const { cpf } = req.body;
    const responseBlocked = await Capmoney_clientBlocked.findOne({
      where: { cpf: cpf },
    });

    if (!responseBlocked) {
      res
        .status(400)
        .json(`Desculpe, cliente com CPF ${cpf} não foi encontrado`);
    }

    res.json({ responseBlocked });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

