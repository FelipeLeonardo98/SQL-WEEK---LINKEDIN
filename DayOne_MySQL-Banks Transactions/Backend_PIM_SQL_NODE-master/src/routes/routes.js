// arquivo de configuração de routes (roteamento)
const express = require('express');
const router = express.Router();

const Blockchain_User = require('../controllers/Blockchain_userController');
const Blockchain_Extract = require('../controllers/Blockchain_extractController');
const Blockchain_registerTransaction = require('../controllers/Blockchain_registerTransaction');
const Capmoney_Client = require('../controllers/Capmoney_clientController');
const Capmoney_Employee = require('../controllers/Capmoney_employeeController');
const Capmoney_ClientBlocked = require('../controllers/Capmoney_clientBlockedController');
const Capmoney_client = require('../models/Capmoney_client');

// routes about Blockchain
router.get('/allusers', Blockchain_User.Show);
router.post('/clientsearch', Blockchain_User.Search);
router.post('/extract', Blockchain_Extract.Extract);
router.get('/allextracts', Blockchain_Extract.AllExtracts);
router.get('/alltransactions', Blockchain_registerTransaction.AllTransactions);
router.post(
  '/searchtransaction',
  Blockchain_registerTransaction.SearchTransaction
);

//Routes about Capmoney Clients
router.post('/verifyclient', Capmoney_Client.Verication);
router.get('/clients', Capmoney_Client.Show);
router.post('/searchclient', Capmoney_Client.Index);
router.post('/authenticate', Capmoney_Client.Login);
router.post('/editclient', Capmoney_Client.Edit);
router.post('/delete', Capmoney_Client.Destroy);
// for tests
router.post('/newClient', Capmoney_Client.Insert);

// Routes about Capmoney Employees
router.post('/newemployee', Capmoney_Employee.Insert);
router.get('/allemployees', Capmoney_Employee.Show);
router.post('/authenticateemployee', Capmoney_Employee.Login);
router.put('/updateemployee', Capmoney_Employee.Update);

// Routes abour Capmoney Clients Blokeds
router.get('/allblockeds', Capmoney_ClientBlocked.Show);
router.post('/searchblocked', Capmoney_ClientBlocked.Index);

module.exports = router;
