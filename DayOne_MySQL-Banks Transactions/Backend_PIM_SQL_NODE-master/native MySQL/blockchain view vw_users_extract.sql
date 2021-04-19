-- Extract complete
desc blockchain_extract;
CREATE VIEW vw_users_extract
AS
    SELECT
        U.name as 'User',
        U.cpf as 'CPF',
        E.description as 'Description',
        E.value as 'Value',
        E.updatedAt as 'Datetime'
    FROM blockchain_extract as E JOIN blockchain_user as U
        ON E.fk_user = U.id;

select *
from vw_users_extract;