-- SQL SERVER: DML (Database: AdventureWorks2019)
use AdventureWorks2019;

-- For see all object with filter: P = 'Stored Procedure', U = 'Table' , TR = 'Trigger' ...
	Select name From sys.objects Where type = 'u';

-- SPRINT: Your Manager asked for: 
	 /*Employees: [
		ID, 
		Full Name,
		PhoneNumber,
		TypeOfContact,
		FullAdress]  
	 */


-- Let's look the relations that each table has with others /tables (Change the table's name)
-- VERY IMPORTANT! I USED A LOTS TIMES

/* SELECT 
	OBJECT_NAME(Referenced_Object_ID) as 'STRONG ENTITY',
	Name as 'Foreignkey',
	OBJECT_NAME(Parent_Object_ID) as 'WEAK ENTITY'
FROM SYS.FOREIGN_KEYS
WHERE Parent_Object_ID = OBJECT_ID('table_name_you_want') OR Referenced_Object_ID = OBJECT_ID('table_name_you_want'); */


-- Checking table's datas
SELECT * FROM Person.Address;  -- AddressLine1, City, StateProvinceID, PostalCode
SELECT * FROM Person.StateProvince; -- StateProvinceCode, CountryRegionCode, Name
SELECT * FROM Person.BusinessEntityAddress; -- AdressID, AddressTypeID
SELECT * FROM Person.AddressType; -- AddressTypeID, Name
SELECT * FROM Person.BusinessEntity;
SELECT * FROM Person.Person; -- BussinessEntityID, First Name, Middle Name, Last Name
SELECT * FROM Person.PersonPhone; -- PhoneNumber, PhoneNumberTypeID
SELECT * FROM Person.PhoneNumberType; -- PhoneNumberTypeID, Name

-- Let's CUTE in two parts

-- Good way:	

-- Part 1: People Informations
/* PE = Person.Person, PP = PersonPhone, PNT = PhoneNumberType */
CREATE VIEW vw_PeopleInformations AS
	SELECT 
		PE.BusinessEntityID as 'EntityID',
		CONCAT (PE.FirstName, ' ', PE.MiddleName, ' ' , PE.LastName) as 'Full Name',
		PP.PhoneNumber,
		PNT.Name as 'Number from'
	FROM 
		Person.Person as PE INNER JOIN Person.PersonPhone as PP 
				ON PE.BusinessEntityID = PP.BusinessEntityID
		INNER JOIN Person.PhoneNumberType as PNT 
				ON PP.PhoneNumberTypeID = PNT.PhoneNumberTypeID;

-- Part 2: Address Informations
/*ADT = AddressTpe (name), BEA = BusinessEntityAddress (AdressID), SP = StateProvince (StateProvinceCode, CountryRegionCode, Name), PA = (AddressLine1, City, PostalCode)  */

CREATE VIEW vw_AddressInformations AS
	SELECT
		BEA.BusinessEntityID,
		BEA.AddressID,
		PA.AddressLine1 as 'Street',
		ADT.name as 'Type',
		PA.City,
		PA.PostalCode,
		SP.StateProvinceCode,
		SP.CountryRegionCode,
		SP.name as 'State Name'
	FROM 
		Person.AddressType as ADT INNER JOIN Person.BusinessEntityAddress as BEA
				ON ADT.AddressTypeID = BEA.AddressTypeID
		INNER JOIN Person.Address as PA
				ON BEA.AddressID = PA.AddressID
		INNER JOIN Person.StateProvince as SP
				ON PA.StateProvinceID = SP.StateProvinceID; 

-- This can go to the following Departaments: Data Analytics, Business Intelligence or whatever ETL's departament
CREATE VIEW vw_etl_fullPersonalInformations AS
SELECT
		vw_PI.[Full Name],
	    vw_PI.[EntityID],
		vw_PI.[PhoneNumber],
		vw_PI.[Number from],
		vw_AI.[AddressID],
		vw_AI.[Street],
		vw_AI.[PostalCode],
		vw_AI.[Type],
		vw_AI.[City],
		vw_AI.[State Name],
		vw_AI.[StateProvinceCode],
		vw_AI.[CountryRegionCode]
FROM 
		vw_PeopleInformations as vw_PI INNER JOIN vw_AddressInformations as vw_AI
				ON vw_PI.[EntityID] = vw_AI.[BusinessEntityID];

SELECT * FROM vw_etl_fullPersonalInformations
		ORDER BY [Full Name];

  -- SPRINT 2: ETL of usefull insights about [State, City and Province]

-- Quantity of Cities, Amount People by CountryRegionCode
SELECT
	[CountryRegionCode],
	count([City]) as 'Quantity of Cities' ,
	COUNT([Full Name]) as 'Amount People'
FROM vw_etl_fullPersonalInformations
	GROUP BY [CountryRegionCode]
	ORDER BY  [CountryRegionCode];

-- Quantity of People by City
	SELECT
	[City],
	COUNT([Full Name]) as 'Amount People'
FROM vw_etl_fullPersonalInformations
	GROUP BY [City]
	ORDER BY [City];

-- Quantity of People by State, Quantity of City by State
SELECT
	[State Name],
	COUNT([City]) as 'Quantity of Cities',
	COUNT([Full Name]) as 'Quantity of People'
FROM vw_etl_fullPersonalInformations
	GROUP BY [State Name]
ORDER BY [State Name];