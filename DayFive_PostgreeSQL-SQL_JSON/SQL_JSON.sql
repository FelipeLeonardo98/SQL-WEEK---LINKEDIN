use db_teste;
create table tb_book(
ID SERIAL,
name VARCHAR(50) not null,
price decimal(4,2) not null check (PRICE > 0),
constraint PK_book primary KEY(ID)
);

-- Verify columns
SELECT
	column_name,
	data_type,
	table_catalog,
	table_name
FROM
	information_schema.columns
	WHERE table_name = 'tb_book';
	
-- Inserting datas through JSON Array
INSERT INTO tb_book SELECT * from json_populate_recordset(null::tb_book,'[ 
{
   "id": 1,
	"name":"A sútil arte de ligar o f*da-se",
	"price": 22.90
   
},
{
   	"id": 2,
	"name":"Seja foda!",
	"price": 22.90
},
{
   "id": 3,
	"name":"O poder do hábito",
	"price": 19.0
  
} ]'); 

select * FROM tb_book; -- Normal select 
SELECT ROW_TO_JSON (tb_book) FROM tb_book; -- "Select JSON"


INSERT into tb_book  SELECT * from json_populate_recordset(null::tb_book,'[ 
{"id": 4, "name":"O lado bom da vida", "price": 25.90} ]');

update tb_book  set price = 10 where id = 4; -- works normally
SELECT ROW_TO_JSON (tb_book) FROM tb_book; -- "Select JSON"


