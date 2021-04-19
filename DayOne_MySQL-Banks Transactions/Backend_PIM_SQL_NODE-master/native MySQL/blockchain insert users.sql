-- inserting users in blockchain_user for generate registers
insert into blockchain_user
VALUES
    (default, 'Sabrina Monteiro', '45021705008', '1988/04/12', 'monteiro@azure.com', '11-9781-3232', 'pass', 'Rua Monteiro Lobato', 'Clear', '11721', default, now(), now());

-- Others tests
insert into blockchain_user
VALUES
    (default, 'Tavares', '60876307080', '1995/09/26', 'tavares@azure.com', '11-9883-3231', 'pass', 'Av. Mendes', 'RICO', '105171', 951.00, now(), now());

insert into blockchain_user
VALUES
    (default, 'Juliana Paes', '76219735013', '1997-10-13', 'paes@gcp.com', '(13)9881-8888', 'pass', 'Wall Street, n 81, USA', 'RICO', '118180', default, now(), now());

select *
from blockchain_user;

insert into blockchain_user
VALUES
    (default, 'Roberta Schmidt', '10070094039', '1989/11/09', 'schimidt@unip.com', '13-9791-3130', 'senhaaqui', 'Av. dos Trabalhadores, n° 101, Aviação-PG', 'EasyInvest', '121121', 100.00, now(), now()),
    (default, 'Moisés Costa', '91956772081', '1990/07/07', 'moises@azure.com', '11-9731-0000', 'password', 'Av Unip, Vl. Mathias, n° 31 - Santos', default , default , default, now(), now()),
    (default, 'Yuri França', '85822415008', '1999/05/28', 'franca@adobe.com', '13-9887-97311', 'passordhere', 'Principal,Gonzaga,Santos', 'RICO', '72315', 670.99, now(), now()),
    (default, 'Leandro Ferreira', '45998111060', '1991/04/13', 'leandro@heroku.com', '13-3496-5202', 'senha', 'Av Unip, Vl. Mathias, n° 331 - Santos', 'EasyInvest', '121122', 800.00, now(), now());

-- Verify
Select *
from blockchain_user;