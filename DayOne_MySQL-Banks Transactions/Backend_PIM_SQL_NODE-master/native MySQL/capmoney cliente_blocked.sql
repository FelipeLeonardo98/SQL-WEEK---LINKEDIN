-- Config clients blockeds
show tables;
desc capmoney_clientBlocked;
/* DELIMITER $
CREATE TRIGGER Trg_insert_desativado AFTER DELETE
ON usuario
FOR EACH ROW
BEGIN
    insert into usuario_desativado VALUES
    (old.id, old.nome, old.permissao);
END $
 
DELIMITER ;*/
START TRANSACTION;
DELIMITER $
CREATE TRIGGER trg_client_blocked 
	AFTER DELETE ON capmoney_client
	FOR EACH ROW
		BEGIN
			INSERT INTO capmoney_clientBlocked
			(id_client,name, cpf, bornAt, email, phone, password,address,category ,agency, account, openAt,createdAt,updatedAt) 
            VALUES
			(old.id, old.name,  old.cpf,  old.bornAt,  old.email,  old.phone,  old.password, old.address,  old.category, old.agency, old.account, old.createdAt, now(), now() );
END $
select * from capmoney_clientBlocked;
select * from capmoney_client;
-- i'll gonna delete client id 3, for test and cause he's a test register (delete in API route)
-- deleted
SELECT * FROM capmoney_clientBlocked;
-- DONE
-- delete client 17 (test) (in API node.js)
ROLLBACK;
COMMIT;