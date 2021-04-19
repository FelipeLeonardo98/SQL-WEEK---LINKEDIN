const Capmoney_Client = require('../models/Capmoney_client');
const Blockchain_User = require('../models/Blockchain_user');

// New Client with verification - FOR PRODUCTION
exports.Verication = async (req, res) => {
  try {
    const { cpf } = req.body;
    const verifyClient = await Blockchain_User.findOne({ where: { cpf: cpf } });

    if (!verifyClient) {
      res
        .status(400)
        .json(
          `CPF ${cpf} não encontrado na base de dados Blockchain. Por favor, verifique com sua empresa de Blockchain`
        );
    } else {
      const newClient = await Capmoney_Client.create(req.body);
      res.json({ client: newClient });
    }
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// New Client - FOR TESTS
exports.Insert = async (req, res) => {
  try {
    const newClient = await Capmoney_Client.create(req.body);
    res.json({ client: newClient });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

//Show all clients
exports.Show = async (req, res) => {
  try {
    const Allclients = await Capmoney_Client.findAll();
    res.json(Allclients);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// find one
exports.Index = async (req, res) => {
  try {
    const { cpf } = req.body;
    const responseClient = await Capmoney_Client.findOne({
      where: { cpf: cpf },
    });

    if (!responseClient) {
      res
        .status(400)
        .json(`Desculpe, cliente com CPF ${cpf} não foi encontrado`);
    }

    res.json({ client: responseClient });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

//authenticate
exports.Login = async (req, res) => {
  try {
    const { cpf, password } = req.body;

    const client = await Capmoney_Client.findOne({ where: { cpf: cpf } });

    if (!client) {
      res.status(401).json({ error: 'Invalid CPF' });
    }

    if (client.password !== password) {
      res.status(401).json({ error: 'Invalid password' });
    }

    client.password = undefined;

    res.json({ client });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.Edit = async (req, res) => {
  try {
    const client = await Capmoney_Client.findOne({ where: { cpf: req.body.cpf } });

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


exports.Destroy = async (req, res) => {
  try {
    const client = await Capmoney_Client.findOne({ where: { cpf: req.body.cpf } });

    if (client === null) {
      return res.json({
        error: `Cliente não cadastrado! `,
      });
    }

    await client.destroy(req.body.cpf);
    res.json(`Cliente ${client.name} excluído com sucesso`);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};