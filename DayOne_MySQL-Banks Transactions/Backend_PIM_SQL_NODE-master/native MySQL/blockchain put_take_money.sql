-- PROCEDURE OF EXTRACT ('saldo' and 'depósito') in Blockchain Blockchain_extract
use db_pim;
show tables;
desc blockchain_extract;

START TRANSACTION;

DROP PROCEDURE IF EXISTS sp_put_take_money;
DELIMITER $$
CREATE PROCEDURE sp_put_take_money
(
	IN p_action CHAR
(1)
   ,IN p_toCPF varchar
(15) 
  ,IN p_value DECIMAL
(8,2)  
)
BEGIN
	-- getting primarykey
	DECLARE v_user int;
SELECT id
from blockchain_user
where cpf = p_toCPF
into v_user;

IF p_action = UPPER('d')  THEN
-- efetuar depósito (put)
UPDATE blockchain_user
				SET balance = balance + p_value
			WHERE cpf = p_toCPF;
-- creating log
INSERT INTO blockchain_extract
values
	(default, 'depósito', p_value, v_user, now(), now() );

SELECT CONCAT('Depósito para CPF:' , p_toCPF , '  realizado com sucesso' ) as 'Success';

ELSEIF p_action = UPPER
('s') THEN
-- verificando se a quantidade é maior que o valor atual do saldo
IF p_value > (select balance
from blockchain_user
WHERE cpf = p_toCPF) THEN
SELECT 'O valor solicitado para saque é maior que o valor do saldo atual,
							entre com um  valor menor para efetuar o saque.' as 'WARNING';
ELSE
-- efetuar saque
UPDATE blockchain_user
						SET balance = balance - p_value
					WHERE cpf = p_toCPF;
-- creating log
INSERT INTO blockchain_extract
values
	(default, 'saque', p_value, v_user, now(), now() );

SELECT CONCAT('Saque realizado com sucesso para o CPF: ', p_toCPF );
END
IF;
		
	 ELSE
		 IF p_action NOT IN ( UPPER('D'),UPPER('S') ) THEN

SELECT 'Opção inválida, entre com "D" para DEPÓSITO ou "S" para SAQUE.' as 'WARNING';
END
IF;
    END
IF;
		
END ;
END $$
DELIMITER ;
select *
from blockchain_user;
-- Id 2 'tavares' tem 951 reais, ele vai sacar 200 ficando com 751 - CPF: 60876307080
call sp_put_take_money
('s','60876307080',200);
-- vamos testar
select *
from blockchain_user
where cpf = '60876307080';
-- diminuiu
select *
from blockchain_extract;
-- agora vamos fazer a Sabrina, id 1, saldo R$ 0 sacar 10, cpf: 45021705008
call sp_put_take_money
('s','45021705008',10);
select *
from blockchain_user
where cpf = '45021705008';
-- continua com o mesmo valor - BLOQUEOU
-- vamos fazer ela depositar 100
call sp_put_take_money
('d','45021705008',100);
select *
from blockchain_user
where cpf = '45021705008';
select *
from blockchain_extract;
-- A lot of actions
call sp_put_take_money
('s','85822415008',52); -- Yuri França CPF: 85822415008
call sp_put_take_money
('s','45998111060',113);-- Leandro Ferreira CPF: 45998111060
call sp_put_take_money
('d','76219735013',230);
-- Juliana Paes CPF: 76219735013
ROLLBACK;
COMMIT;

-- Test this way: call sp_put_take_money ('d' OU 's', 'CPF', valorMoney);



-- Test this way: call sp_put_take_money ('d' OU 's', 'CPF', valorMoney);

call sp_put_take_money
('s','85822415008',52); -- Yuri França CPF: 85822415008
call sp_put_take_money
('d','85822415008',213); -- Yuri França CPF: 85822415008