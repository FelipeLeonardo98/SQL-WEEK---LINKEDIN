-- movimentations - sp_put_take_money
select *
from blockchain_user;
call sp_put_take_money
('s','45998111060',122); -- Leandro Ferreira CPF: 45998111060
call sp_put_take_money
('d','10070094039',22); -- Roberta Schmidt CPF: 10070094039
call sp_put_take_money
('s','45021705008',34);
-- Sabrina Monteiro CPF: 45021705008
select *
from vw_users_extract
order by Datetime desc;

-- movimentations - sp_transfer
call sp_transfer
('Tavares','60876307080','RICO',177,'Roberta Schmidt','10070094039');

call sp_transfer
('Yuri França','85822415008','RICO',218,'Moisés Costa','91956772081');
call sp_transfer
('Leandro Ferreira','45998111060','EasyInvest',56,'Juliana Paes','76219735013');
call sp_transfer
('Sabrina Monteiro','45021705008','Clear',217,'Juliana Paes','76219735013');
call sp_transfer
('Moisés Costa','91956772081','Individual',90,'Roberta Schmidt','10070094039');
call sp_transfer
('Leandro Ferreira','45998111060','EasyInvest',16,'Yuri França','85822415008');
call sp_transfer
('Leandro Ferreira','45998111060','EasyInvest',16,'Sabrina Monteiro','45021705008');
call sp_transfer
('Moisés Costa','91956772081','Individual',100,'Leandro Ferreira','45998111060');


-- test
select *
from blockchain_registerTransaction
where cpf_origin = '45998111060' OR cpf_destiny = '45998111060';

-- 24/11
call sp_put_take_money
('d','10070094039',220); -- Roberta Schmidt CPF: 10070094039
call sp_put_take_money
('d','45021705008',340); -- Sabrina Monteiro CPF: 45021705008
call sp_put_take_money
('d','91956772081',540); -- Moisés da Costa CPF: 91956772081
call sp_put_take_money
('s','10070094039',17); -- Roberta Schmidt CPF: 10070094039

call sp_transfer
('Moisés Costa','91956772081','Individual',140,'Tavares','60876307080');

-- 25/11
call sp_transfer
('Yuri França','85822415008','RICO',18,'Moisés Costa','91956772081');
call sp_transfer
('Leandro Ferreira','45998111060','EasyInvest',497,'Juliana Paes','76219735013');
call sp_put_take_money
('s','45021705008',143.93); -- Sabrina Monteiro CPF: 45021705008