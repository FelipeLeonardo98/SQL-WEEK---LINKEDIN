// Getting essentials
const http = require('http');
const express = require('express');
const status = require('http-status');
const sequelize = require('./src/database/database');
const app = express();
const routes = require('./src/routes/routes.js');
const cors = require('cors');

// enable JSON
app.use(express.json());

// setting group's routes
app.use('/api', routes);

// Adding cors (to use API's)
app.use(cors());



//
app.get('/api', function (req, res, next) {
  res.json({ msg: 'This is CORS-enabled for all origins!' });
});

app.get('/', function (req, res, next) {
  res.json({
    Bem_Vindo: 'BEM VINDO A API BLOCKCHAIN/CAPMONEY - PIM UNIP',
    Link_frontend: 'https://capmoney.herokuapp.com',
    Link_gitHub:
      'https://github.com/lsferreira934/Backend_PIM_SQL_NODE',

    Todas_as_rotas_dispoiveis: {
      ROUTES_BLOCKCHAIN: {
        nota_1: 'Retorna todos usuários',
        get_users: 'https://backendpim.herokuapp.com/api/allusers',
        nota_2: 'Consultar extrato - por CPF',
        post_extract: 'https://backendpim.herokuapp.com/api/extract',
        nota_3: 'Retornar todos extratos',
        get_allextracts: 'https://backendpim.herokuapp.com/api/allextracts',
        nota_4: 'Retornar toda transações',
        get_alltransactions: 'https://backendpim.herokuapp.com/api/alltransactions',
        nota_5: 'Consultar transação de usuário - por CPF',
        post_transaction: 'https://backendpim.herokuapp.com/api/searchtransaction',
        nota_6: 'Consultar user Blockchain - por CPF',
        post_user: 'https://backendpim.herokuapp.com/api/clientsearch'
      },
      ROUTES_CAPMONEY_CLIENTS: {
        nota_1: 'Verificação/Cadastro de client',
        post_cadastro: 'https://backendpim.herokuapp.com/api/verifyclient',
        nota_2: 'Retorno de todos clientes',
        get_allclients: 'https://backendpim.herokuapp.com/api/clients',
        nota_3: 'Pesquisa de cliente - por CPF',
        post_searchclient: 'https://backendpim.herokuapp.com/api/searchclient',
        nota_4: 'Login de cliente',
        post_login: 'https://backendpim.herokuapp.com/api/authenticate',
        nota_5: 'Edição de cliente',
        put_client: 'https://backendpim.herokuapp.com/api/editclient',
        nota_6: 'Exclusão de cliente - por CPF',
        post_delete: 'https://backendpim.herokuapp.com/api/delete',
        nota_7: 'Rota somente de teste, cadastro de client',
        post_teste: 'https://backendpim.herokuapp.com/api/newClient',

      },
      ROUTES_CAPMONEY_EMPLOYEES: {
        nota_1: 'Cadastro de novo funcionário',
        post_cadastro: 'https://backendpim.herokuapp.com/api/newemployee',
        nota_2: 'Retorno de todos funcionários',
        get_allemployees: 'https://backendpim.herokuapp.com/api/allemployees',
        nota_3: 'Login de funcionário',
        post_login: 'https://backendpim.herokuapp.com/api/authenticateemployee',
        nota_4: 'Atualização de funcionário',
        put_employee: 'https://backendpim.herokuapp.com/api/updateemployee',

      },
      ROUTES_CAPMONEY_CLIENTS_BLOCKEDS: {
        nota_1: 'Retorna todos clientes bloqueados',
        get_allblocks: 'https://backendpim.herokuapp.com/api/allblockeds',
        nota_2: 'Pesquisa de cliente bloqueado - por CPF',
        post_blocked: 'https://backendpim.herokuapp.com/api/searchblocked',


      },
    },
  });
});




// Error's server, parser.json
app.use((req, res, next) => {
  res.status.apply(status.INTERNAL_SERVER_ERROR).json({ error });
});

// verify table at db_usuario and starting node server
sequelize.sync({ force: false }).then(() => {
  const port = process.env.PORT || 3003;
  app.set('port', port);
  const server = http.createServer(app);
  server.listen(port);
});
