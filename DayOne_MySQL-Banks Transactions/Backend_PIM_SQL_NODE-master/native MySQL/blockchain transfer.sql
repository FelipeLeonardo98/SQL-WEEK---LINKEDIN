-- Transfer - Blockchain_registerTransaction
desc blockchain_registerTransaction;

START TRANSACTION;
DROP PROCEDURE IF EXISTS sp_transfer;

DELIMITER $$
CREATE PROCEDURE sp_transfer (
	     IN fromClient VARCHAR(50)
		,IN fromCPF		VARCHAR(15)
		,IN fromAgency  VARCHAR(30) 
		,IN p_value		DECIMAL(8,2)
		,IN toClient	VARCHAR(30)
		,IN TOcpf     	VARCHAR(15)
)
BEGIN
-- verify p_value more than balance fromCPF
	IF p_value > (select balance from blockchain_user where cpf = fromCPF) THEN
		SELECT 'OPS! Valor intencionado é maior do que o valor do saldo atual na conta!' as 'STOP!';
	ELSE
		-- Do transfer
			-- subtract from origin
				UPDATE blockchain_user
					SET balance = balance - p_value
				WHERE cpf = fromCPF;

			-- add to destiny
				UPDATE blockchain_user
					SET balance = balance + p_value
				WHERE cpf = ToCPF;
		-- make insert into Blockchain_registerTransaction
        INSERT INTO blockchain_registerTransaction VALUES
			(default, fromClient, fromCPF, fromAgency, p_value, toClient, toCPF, now(), now());
		SELECT CONCAT('Transferência entre Sr(a): ', fromClient , ' para CPF: ', toCPF , ' com valor de: R$', p_value , 'realizada com sucesso!') ;
	END IF;
END $$
DELIMITER ;
-- TEST
SELECT name, cpf, agency, balance from blockchain_user;
-- Tavares, CPF: 60876307080, Agency: RICO tem R$ 751, irá transferir R$ 250 para: Sabrina que possui R$ 66
	-- Tavares ficará com R$ 501 e Sabrina com R$ 316
call sp_transfer('Tavares','60876307080','RICO',250,'Sabrina Monteiro','45021705008');
SELECT name, cpf, agency, balance from blockchain_user;
-- CERTO
select * from blockchain_registerTransaction;
ROLLBACK;
COMMIT;