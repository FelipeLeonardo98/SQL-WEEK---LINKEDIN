-- Here you'll see a few codes (hard ways to work ("Portuguese: Formas trabalhosas")) before REFETORING


-- There are two ways (or more, for example using CTE's) to do it. 
-- Work hard way: TO JOIN ALL
/*SELECT 
	PE.BusinessEntityID as 'EntityID',
	CONCAT (PE.FirstName, ' ', PE.MiddleName, ' ' , PE.LastName) as 'Full Name',
	PP.PhoneNumber,
	PNT.Name as 'Number from',
	BEA.AddressID,
		PA.AddressLine1 as 'Street',
		ADT.name as 'Type',
		PA.City,
		PA.PostalCode,
		SP.name as 'State Name',
		SP.StateProvinceCode,
		SP.CountryRegionCode	
FROM 
	Person.Person as PE INNER JOIN Person.PersonPhone as PP 
			ON PE.BusinessEntityID = PP.BusinessEntityID
	INNER JOIN Person.PhoneNumberType as PNT 
			ON PP.PhoneNumberTypeID = PNT.PhoneNumberTypeID
	INNER JOIN Person.BusinessEntityAddress as BEA
			ON PE.BusinessEntityID = BEA.BusinessEntityID
	INNER JOIN Person.AddressType as ADT  
				ON ADT.AddressTypeID = BEA.AddressTypeID
		INNER JOIN Person.Address as PA
				ON BEA.AddressID = PA.AddressID
		INNER JOIN Person.StateProvince as SP
				ON PA.StateProvinceID = SP.StateProvinceID; */

-- Other "hard way to work", using just one view
/*
SELECT
	    vw_PeopleInformations.[EntityID],
		vw_PeopleInformations.[Full Name],
		vw_PeopleInformations.[PhoneNumber],
		vw_PeopleInformations.[Number from],
		BEA.AddressID,
		PA.AddressLine1 as 'Street',
		PA.PostalCode,
		ADT.name as 'Type',
		PA.City,
		SP.name as 'State Name',
		SP.StateProvinceCode,
		SP.CountryRegionCode
	FROM 
		vw_PeopleInformations INNER JOIN Person.BusinessEntityAddress as BEA
				ON vw_PeopleInformations.EntityID = BEA.BusinessEntityID
		INNER JOIN	Person.AddressType as ADT
				ON ADT.AddressTypeID = BEA.AddressTypeID
		INNER JOIN Person.Address as PA
				ON BEA.AddressID = PA.AddressID
		INNER JOIN Person.StateProvince as SP
				ON PA.StateProvinceID = SP.StateProvinceID; */
-- using two views
/*SELECT
	    vw_PeopleInformations.[EntityID],
		vw_PeopleInformations.[Full Name],
		vw_PeopleInformations.[PhoneNumber],
		vw_PeopleInformations.[Number from],
		vw_AddressInformations.[AddressID],
		vw_AddressInformations.[Street],
		vw_AddressInformations.[PostalCode],
		vw_AddressInformations.[Type],
		vw_AddressInformations.[City],
		vw_AddressInformations.[State Name],
		vw_AddressInformations.[StateProvinceCode],
		vw_AddressInformations.[CountryRegionCode]
FROM 
		vw_PeopleInformations INNER JOIN vw_AddressInformations
				ON vw_PeopleInformations.[EntityID] = vw_AddressInformations.[BusinessEntityID]; */
