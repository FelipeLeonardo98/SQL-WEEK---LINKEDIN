desc blockchain_user;
desc blockchain_extract;

show procedure status;
drop procedure sp_put_take_money;

 INSERT INTO blockchain_extract values
					 	(default,'saque', 10.00, 1, now(), now() );
                        
                        select * from blockchain_extract;
                        