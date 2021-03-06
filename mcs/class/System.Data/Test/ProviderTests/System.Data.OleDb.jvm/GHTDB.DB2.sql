-- This CLP file was created using DB2LOOK Version 8.2
-- Timestamp: 10/04/2004 06:10:49 PM
-- Database Name: GHTDB             
-- Database Manager Version: DB2/NT Version 8.2.0          
-- Database Codepage: 1208
-- Database Collating Sequence is: BINARY

DROP DATABASE GHTDB;
create database ghtdb USING CODESET UTF8 TERRITORY US;

CONNECT TO GHTDB;
--Create temp tablespace
create user temporary tablespace ght_tempspace managed by system using ('GHT_TEMPSPACE');


-- Mimic tablespace

ALTER TABLESPACE SYSCATSPACE
      PREFETCHSIZE 16
      OVERHEAD 24.100000
      TRANSFERRATE 0.900000;


ALTER TABLESPACE TEMPSPACE1
      PREFETCHSIZE 16
      OVERHEAD 24.100000
      TRANSFERRATE 0.900000;


ALTER TABLESPACE USERSPACE1
      PREFETCHSIZE 16
      OVERHEAD 24.100000
      TRANSFERRATE 0.900000;

---------------------------------
-- DDL Statements for distinct types and/or Abstract Data Types
---------------------------------


CREATE DISTINCT TYPE "DB2ADMIN"."BIGINT1" AS "SYSIBM  ".DECIMAL(19)
	 WITH COMPARISONS;

------------------------------------------------
-- DDL Statements for types tables
------------------------------------------------
 
 CREATE TABLE "DB2ADMIN"."TYPES_SIMPLE"  (
 
 		  "ID" CHAR(10)  ,

		  "T_SMALLINT" SMALLINT   , 
		  
		  "T_INTEGER" INTEGER   , 
		  
		  "T_BIGINT" BIGINT   , 

		  "T_DECIMAL" DECIMAL(5,0)   , 
		  
		  "T_REAL" REAL   , 

		  "T_DOUBLE" DOUBLE   , 

		  "T_CHARACTER" CHAR(10)   , 

		  "T_VARCHAR" VARCHAR(10)   , 
		  
		  "T_LONGVARCHAR" LONG VARCHAR   ) IN "USERSPACE1" ; 







 CREATE TABLE "DB2ADMIN"."TYPES_EXTENDED"  (
 		  "ID" CHAR(10)  ,

		  "T_DATE" DATE   , 
		  
		  "T_TIME" TIME   , 

		  "T_TIMESTAMP" TIMESTAMP   , 

		  "T_BLOB" BLOB(1048576) LOGGED  COMPACT   , 

		  "T_CLOB" CLOB(1048576) LOGGED  COMPACT   , 

		  "T_DBCLOB" DBCLOB(1048576) LOGGED  COMPACT   ) IN "USERSPACE1" ; 









 CREATE TABLE "DB2ADMIN"."TYPES_SPECIFIC"  (

 		  "ID" CHAR(10)  ,

		  "T_GRAPHIC" GRAPHIC(10)   , 

		  "T_VARGRAPHIC" VARGRAPHIC(10)   ,

		  "T_LONGVARGRAPHIC" LONG VARGRAPHIC   ) IN "USERSPACE1" ; 



------------------------------------------------
-- DDL Statements for table "DB2ADMIN"."CATEGORIES"
------------------------------------------------
 
 CREATE TABLE "DB2ADMIN"."CATEGORIES"  (
		  "CATEGORYID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +1  
		    INCREMENT BY +1  
		    MINVALUE +1  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "CATEGORYNAME" VARCHAR(15) NOT NULL , 
		  "DESCRIPTION" DBCLOB(1073741823) NOT LOGGED NOT COMPACT )   
		 IN "USERSPACE1" ; 

 CREATE TABLE "MAINSOFT"."CATEGORIESNEW"  (
		  "CATEGORYID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +1  
		    INCREMENT BY +1  
		    MINVALUE +1  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "CATEGORYNAME" VARCHAR(15) NOT NULL , 
		  "DESCRIPTION" DBCLOB(1073741823) NOT LOGGED NOT COMPACT )   
		 IN "USERSPACE1" ;

 CREATE TABLE "MAINSOFT"."CATEGORIES"  (
		  "CATEGORYID" VARCHAR(10) NOT NULL , 
 
		  "CATEGORYNAME" VARCHAR(15) NOT NULL , 
		  "DESCRIPTION" DBCLOB(1073741823) NOT LOGGED NOT COMPACT)
		 IN "USERSPACE1" ;



-- DDL Statements for indexes on Table "DB2ADMIN"."CATEGORIES"

CREATE INDEX "DB2ADMIN"."CATEGORYNAME" ON "DB2ADMIN"."CATEGORIES" 
		("CATEGORYNAME" ASC);

-- DDL Statements for indexes on Table "DB2ADMIN"."CATEGORIES"

CREATE INDEX "DB2ADMIN"."PK_CATEGORIES" ON "DB2ADMIN"."CATEGORIES" 
		("CATEGORYID" ASC)
		CLUSTER ;

-- DDL Statements for primary key on Table "DB2ADMIN"."CATEGORIES"

ALTER TABLE "DB2ADMIN"."CATEGORIES" 
	ADD CONSTRAINT "SQL040118121530460" PRIMARY KEY
		("CATEGORYID");





------------------------------------------------
-- DDL Statements for table "DB2ADMIN"."CUSTOMERCUSTOMERDEMO"
------------------------------------------------
 
 CREATE TABLE "DB2ADMIN"."CUSTOMERCUSTOMERDEMO"  (
		  "CUSTOMERID" CHAR(5) NOT NULL , 
		  "CUSTOMERTYPEID" CHAR(10) NOT NULL )   
		 IN "USERSPACE1" ; 

-- DDL Statements for primary key on Table "DB2ADMIN"."CUSTOMERCUSTOMERDEMO"

ALTER TABLE "DB2ADMIN"."CUSTOMERCUSTOMERDEMO" 
	ADD CONSTRAINT "PK_CUSTOMERCUSTOME" PRIMARY KEY
		("CUSTOMERID",
		 "CUSTOMERTYPEID");



------------------------------------------------
-- DDL Statements for table "DB2ADMIN"."CUSTOMERDEMOGRAPHICS"
------------------------------------------------
 
 CREATE TABLE "DB2ADMIN"."CUSTOMERDEMOGRAPHICS"  (
		  "CUSTOMERTYPEID" CHAR(10) NOT NULL , 
		  "CUSTOMERDESC" DBCLOB(1073741823) NOT LOGGED NOT COMPACT )   
		 IN "USERSPACE1" ; 

-- DDL Statements for primary key on Table "DB2ADMIN"."CUSTOMERDEMOGRAPHICS"

ALTER TABLE "DB2ADMIN"."CUSTOMERDEMOGRAPHICS" 
	ADD CONSTRAINT "PK_CUSTOMERDEMOGRA" PRIMARY KEY
		("CUSTOMERTYPEID");



------------------------------------------------
-- DDL Statements for table "DB2ADMIN"."CUSTOMERS"
------------------------------------------------
 
 CREATE TABLE "DB2ADMIN"."CUSTOMERS"  (
		  "CUSTOMERID" CHAR(5) NOT NULL , 
		  "COMPANYNAME" VARCHAR(40) NOT NULL , 
		  "CONTACTNAME" VARCHAR(30) , 
		  "CONTACTTITLE" VARCHAR(30) , 
		  "ADDRESS" VARCHAR(60) , 
		  "CITY" VARCHAR(15) , 
		  "REGION" VARCHAR(15) , 
		  "POSTALCODE" VARCHAR(10) , 
		  "COUNTRY" VARCHAR(15) , 
		  "PHONE" VARCHAR(24) , 
		  "FAX" VARCHAR(24) )   
		 IN "USERSPACE1" ; 
-- DDL Statements for indexes on Table "DB2ADMIN"."CUSTOMERS"

CREATE INDEX "DB2ADMIN"."CITY" ON "DB2ADMIN"."CUSTOMERS" 
		("CITY" ASC);

-- DDL Statements for indexes on Table "DB2ADMIN"."CUSTOMERS"

CREATE INDEX "DB2ADMIN"."COMPANYNAME" ON "DB2ADMIN"."CUSTOMERS" 
		("COMPANYNAME" ASC);

-- DDL Statements for indexes on Table "DB2ADMIN"."CUSTOMERS"

CREATE INDEX "DB2ADMIN"."PK_CUSTOMERS" ON "DB2ADMIN"."CUSTOMERS" 
		("CUSTOMERID" ASC)
		CLUSTER ;

-- DDL Statements for indexes on Table "DB2ADMIN"."CUSTOMERS"

CREATE INDEX "DB2ADMIN"."POSTALCODE" ON "DB2ADMIN"."CUSTOMERS" 
		("POSTALCODE" ASC);

-- DDL Statements for indexes on Table "DB2ADMIN"."CUSTOMERS"

CREATE INDEX "DB2ADMIN"."REGION" ON "DB2ADMIN"."CUSTOMERS" 
		("REGION" ASC);



-- DDL Statements for unique constraints on Table "DB2ADMIN"."CUSTOMERS"
ALTER TABLE "DB2ADMIN"."CUSTOMERS" ADD CONSTRAINT "UK_CUSTOMERID" UNIQUE ("CUSTOMERID");



------------------------------------------------
-- DDL Statements for table "DB2ADMIN"."EMPLOYEETERRITORIES"
------------------------------------------------
 
 CREATE TABLE "DB2ADMIN"."EMPLOYEETERRITORIES"  (
		  "EMPLOYEEID" INTEGER NOT NULL , 
		  "TERRITORYID" VARCHAR(20) NOT NULL )   
		 IN "USERSPACE1" ; 

-- DDL Statements for primary key on Table "DB2ADMIN"."EMPLOYEETERRITORIES"

ALTER TABLE "DB2ADMIN"."EMPLOYEETERRITORIES" 
	ADD CONSTRAINT "PK_EMPLOYEETERRITO" PRIMARY KEY
		("EMPLOYEEID",
		 "TERRITORYID");



------------------------------------------------
-- DDL Statements for table "DB2ADMIN"."SHIPPERS"
------------------------------------------------
 
 CREATE TABLE "DB2ADMIN"."SHIPPERS"  (
		  "SHIPPERID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +1  
		    INCREMENT BY +1  
		    MINVALUE +1  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "COMPANYNAME" VARCHAR(40) NOT NULL , 
		  "PHONE" VARCHAR(24) )   
		 IN "USERSPACE1" ; 
-- DDL Statements for indexes on Table "DB2ADMIN"."SHIPPERS"

CREATE INDEX "DB2ADMIN"."PK_SHIPPERS" ON "DB2ADMIN"."SHIPPERS" 
		("SHIPPERID" ASC)
		CLUSTER ;


-- DDL Statements for primary key on Table "DB2ADMIN"."SHIPPERS"
ALTER TABLE "DB2ADMIN"."SHIPPERS" ADD CONSTRAINT "SQL040118121538100" PRIMARY KEY ("SHIPPERID");


------------------------------------------------
-- DDL Statements for table "DB2ADMIN"."ORDERS"
------------------------------------------------
 
 CREATE TABLE "DB2ADMIN"."ORDERS"  (
		  "ORDERID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +1  
		    INCREMENT BY +1  
		    MINVALUE +1  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "CUSTOMERID" CHAR(5) , 
		  "EMPLOYEEID" INTEGER , 
		  "ORDERDATE" DATE , 
		  "REQUIREDDATE" DATE , 
		  "SHIPPEDDATE" DATE , 
		  "SHIPVIA" INTEGER , 
		  "FREIGHT" DECIMAL(19,4) WITH DEFAULT 0 , 
		  "SHIPNAME" VARCHAR(40) , 
		  "SHIPADDRESS" VARCHAR(60) , 
		  "SHIPCITY" VARCHAR(15) , 
		  "SHIPREGION" VARCHAR(15) , 
		  "SHIPPOSTALCODE" VARCHAR(10) , 
		  "SHIPCOUNTRY" VARCHAR(15) )   
		 IN "USERSPACE1" ; 
-- DDL Statements for indexes on Table "DB2ADMIN"."ORDERS"

CREATE INDEX "DB2ADMIN"."CUSTOMERID" ON "DB2ADMIN"."ORDERS" 
		("CUSTOMERID" ASC);

-- DDL Statements for indexes on Table "DB2ADMIN"."ORDERS"

CREATE INDEX "DB2ADMIN"."EMPLOYEEID" ON "DB2ADMIN"."ORDERS" 
		("EMPLOYEEID" ASC);

-- DDL Statements for indexes on Table "DB2ADMIN"."ORDERS"

CREATE INDEX "DB2ADMIN"."ORDERDATE" ON "DB2ADMIN"."ORDERS" 
		("ORDERDATE" ASC);

-- DDL Statements for indexes on Table "DB2ADMIN"."ORDERS"

CREATE INDEX "DB2ADMIN"."PK_ORDERS" ON "DB2ADMIN"."ORDERS" 
		("ORDERID" ASC)
		CLUSTER ;

-- DDL Statements for indexes on Table "DB2ADMIN"."ORDERS"

CREATE INDEX "DB2ADMIN"."SHIPPEDDATE" ON "DB2ADMIN"."ORDERS" 
		("SHIPPEDDATE" ASC);

-- DDL Statements for indexes on Table "DB2ADMIN"."ORDERS"

CREATE INDEX "DB2ADMIN"."SHIPPERSORDERS" ON "DB2ADMIN"."ORDERS" 
		("SHIPVIA" ASC);

-- DDL Statements for indexes on Table "DB2ADMIN"."ORDERS"

CREATE INDEX "DB2ADMIN"."SHIPPOSTALCODE" ON "DB2ADMIN"."ORDERS" 
		("SHIPPOSTALCODE" ASC);


-- DDL Statements for primary key on Table "DB2ADMIN"."ORDERS"
ALTER TABLE "DB2ADMIN"."ORDERS" ADD CONSTRAINT "SQL040118121536160" PRIMARY KEY	("ORDERID");



------------------------------------------------
-- DDL Statements for table "DB2ADMIN"."PRODUCTS"
------------------------------------------------
 
 CREATE TABLE "DB2ADMIN"."PRODUCTS"  (
		  "PRODUCTID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +1  
		    INCREMENT BY +1  
		    MINVALUE +1  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "PRODUCTNAME" VARCHAR(40) NOT NULL , 
		  "SUPPLIERID" INTEGER , 
		  "CATEGORYID" INTEGER , 
		  "QUANTITYPERUNIT" VARCHAR(20) , 
		  "UNITPRICE" DECIMAL(19,4) WITH DEFAULT 0 , 
		  "UNITSINSTOCK" SMALLINT WITH DEFAULT 0 , 
		  "UNITSONORDER" SMALLINT WITH DEFAULT 0 , 
		  "REORDERLEVEL" SMALLINT WITH DEFAULT 0 , 
		  "DISCONTINUED" SMALLINT NOT NULL WITH DEFAULT 0 )   
		 IN "USERSPACE1" ; 
-- DDL Statements for indexes on Table "DB2ADMIN"."PRODUCTS"

CREATE INDEX "DB2ADMIN"."CATEGORIESPRODUCTS" ON "DB2ADMIN"."PRODUCTS" 
		("CATEGORYID" ASC);

-- DDL Statements for indexes on Table "DB2ADMIN"."PRODUCTS"

CREATE INDEX "DB2ADMIN"."PK_PRODUCTS" ON "DB2ADMIN"."PRODUCTS" 
		("PRODUCTID" ASC)
		CLUSTER ;

-- DDL Statements for indexes on Table "DB2ADMIN"."PRODUCTS"

CREATE INDEX "DB2ADMIN"."PRODUCTNAME" ON "DB2ADMIN"."PRODUCTS" 
		("PRODUCTNAME" ASC);

-- DDL Statements for indexes on Table "DB2ADMIN"."PRODUCTS"

CREATE INDEX "DB2ADMIN"."SUPPLIERID" ON "DB2ADMIN"."PRODUCTS" 
		("SUPPLIERID" ASC);


-- DDL Statements for primary key on Table "DB2ADMIN"."PRODUCTS"
ALTER TABLE "DB2ADMIN"."PRODUCTS" ADD CONSTRAINT "SQL040118121537130" PRIMARY KEY ("PRODUCTID");



------------------------------------------------
-- DDL Statements for table "DB2ADMIN"."REGION"
------------------------------------------------
 
 CREATE TABLE "DB2ADMIN"."REGION"  (
		  "REGIONID" INTEGER NOT NULL , 
		  "REGIONDESCRIPTION" CHAR(50) NOT NULL )   
		 IN "USERSPACE1" ; 


-- DDL Statements for unique constraints on Table "DB2ADMIN"."REGION"

ALTER TABLE "DB2ADMIN"."REGION" 
	ADD CONSTRAINT "UK_REGION" UNIQUE
		("REGIONID");


------------------------------------------------
-- DDL Statements for table "DB2ADMIN"."SUPPLIERS"
------------------------------------------------
 
 CREATE TABLE "DB2ADMIN"."SUPPLIERS"  (
		  "SUPPLIERID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (  
		    START WITH +1  
		    INCREMENT BY +1  
		    MINVALUE +1  
		    MAXVALUE +2147483647  
		    NO CYCLE  
		    CACHE 20  
		    NO ORDER ) , 
		  "COMPANYNAME" VARCHAR(40) NOT NULL , 
		  "CONTACTNAME" VARCHAR(30) , 
		  "CONTACTTITLE" VARCHAR(30) , 
		  "ADDRESS" VARCHAR(60) , 
		  "CITY" VARCHAR(15) , 
		  "REGION" VARCHAR(15) , 
		  "POSTALCODE" VARCHAR(10) , 
		  "COUNTRY" VARCHAR(15) , 
		  "PHONE" VARCHAR(24) , 
		  "FAX" VARCHAR(24) , 
		  "HOMEPAGE" DBCLOB(1073741823) NOT LOGGED NOT COMPACT )   
		 IN "USERSPACE1" ; 
-- DDL Statements for indexes on Table "DB2ADMIN"."SUPPLIERS"

CREATE INDEX "DB2ADMIN"."COMPANYNAME1" ON "DB2ADMIN"."SUPPLIERS" 
		("COMPANYNAME" ASC);

-- DDL Statements for indexes on Table "DB2ADMIN"."SUPPLIERS"

CREATE INDEX "DB2ADMIN"."PK_SUPPLIERS" ON "DB2ADMIN"."SUPPLIERS" 
		("SUPPLIERID" ASC)
		CLUSTER ;

-- DDL Statements for indexes on Table "DB2ADMIN"."SUPPLIERS"

CREATE INDEX "DB2ADMIN"."POSTALCODE2" ON "DB2ADMIN"."SUPPLIERS" 
		("POSTALCODE" ASC);


-- DDL Statements for primary key on Table "DB2ADMIN"."SUPPLIERS"
ALTER TABLE "DB2ADMIN"."SUPPLIERS" ADD CONSTRAINT "SQL040118121538820" PRIMARY KEY ("SUPPLIERID");



------------------------------------------------
-- DDL Statements for table "DB2ADMIN"."TERRITORIES"
------------------------------------------------
 
 CREATE TABLE "DB2ADMIN"."TERRITORIES"  (
		  "TERRITORYID" VARCHAR(20) NOT NULL , 
		  "TERRITORYDESCRIPTION" CHAR(50) NOT NULL , 
		  "REGIONID" INTEGER NOT NULL )   
		 IN "USERSPACE1" ; 

-- DDL Statements for primary key on Table "DB2ADMIN"."TERRITORIES"

ALTER TABLE "DB2ADMIN"."TERRITORIES" 
	ADD CONSTRAINT "PK_TERRITORIES" PRIMARY KEY
		("TERRITORYID");





------------------------------------------------
-- DDL Statements for table "DB2ADMIN"."EMPLOYEES"
------------------------------------------------
 
 CREATE TABLE "DB2ADMIN"."EMPLOYEES"  (
		  "EMPLOYEEID" INTEGER NOT NULL , 
		  "LASTNAME" VARCHAR(20) NOT NULL , 
		  "FIRSTNAME" VARCHAR(10) NOT NULL , 
		  "TITLE" VARCHAR(30) , 
		  "TITLEOFCOURTESY" VARCHAR(25) , 
		  "BIRTHDATE" TIMESTAMP , 
		  "HIREDATE" TIMESTAMP , 
		  "ADDRESS" VARCHAR(60) , 
		  "CITY" VARCHAR(15) , 
		  "REGION" VARCHAR(15) , 
		  "POSTALCODE" VARCHAR(10) , 
		  "COUNTRY" VARCHAR(15) , 
		  "HOMEPHONE" VARCHAR(24) , 
		  "EXTENSION" VARCHAR(4) , 
		  "NOTES" DBCLOB(1073741823) NOT LOGGED NOT COMPACT , 
		  "REPORTSTO" INTEGER , 
		  "PHOTOPATH" VARCHAR(255) , 
		  "MYCOLUMN" INTEGER )   
		 IN "USERSPACE1" ; 
-- DDL Statements for indexes on Table "DB2ADMIN"."EMPLOYEES"

CREATE INDEX "DB2ADMIN"."LASTNAME" ON "DB2ADMIN"."EMPLOYEES" 
		("LASTNAME" ASC);

-- DDL Statements for indexes on Table "DB2ADMIN"."EMPLOYEES"

CREATE INDEX "DB2ADMIN"."PK_EMPLOYEES" ON "DB2ADMIN"."EMPLOYEES" 
		("EMPLOYEEID" ASC)
		CLUSTER ;


-- DDL Statements for primary key on Table "DB2ADMIN"."EMPLOYEES"
ALTER TABLE "DB2ADMIN"."EMPLOYEES" ADD CONSTRAINT "SQL040126121512760" PRIMARY KEY ("EMPLOYEEID");



------------------------------------------------
-- DDL Statements for table "DB2ADMIN"."Order Details"
------------------------------------------------
 
 CREATE TABLE "DB2ADMIN"."Order Details"  (
		  "ORDERID" INTEGER NOT NULL , 
		  "PRODUCTID" INTEGER NOT NULL , 
		  "UNITPRICE" DECIMAL(19,4) NOT NULL WITH DEFAULT 0 , 
		  "QUANTITY" SMALLINT NOT NULL WITH DEFAULT 1 , 
		  "DISCOUNT" REAL NOT NULL WITH DEFAULT 0 )   
		 IN "USERSPACE1" ; 
-- DDL Statements for indexes on Table "DB2ADMIN"."Order Details"

CREATE INDEX "DB2ADMIN"."ORDERID" ON "DB2ADMIN"."Order Details" 
		("ORDERID" ASC);

-- DDL Statements for indexes on Table "DB2ADMIN"."Order Details"

CREATE INDEX "DB2ADMIN"."PK_ORDER_DETAILS" ON "DB2ADMIN"."Order Details" 
		("ORDERID" ASC,
		 "PRODUCTID" ASC)
		CLUSTER ;

-- DDL Statements for indexes on Table "DB2ADMIN"."Order Details"

CREATE INDEX "DB2ADMIN"."PRODUCTID" ON "DB2ADMIN"."Order Details" 
		("PRODUCTID" ASC);


-- DDL Statements for primary key on Table "DB2ADMIN"."Order Details"
ALTER TABLE "DB2ADMIN"."Order Details" ADD CONSTRAINT "SQL040127121002770" PRIMARY KEY ("ORDERID", "PRODUCTID");



------------------------------------------------
-- DDL Statements for table "DB2ADMIN"."GH_EMPTYTABLE"
------------------------------------------------
 
 CREATE TABLE "DB2ADMIN"."GH_EMPTYTABLE"  (
		  "COL1" INTEGER , 
		  "COL2" VARCHAR(50) )   
		 IN "USERSPACE1" ; 








-- DDL Statements for foreign keys on Table "DB2ADMIN"."CUSTOMERCUSTOMERDEMO"

ALTER TABLE "DB2ADMIN"."CUSTOMERCUSTOMERDEMO" 
	ADD CONSTRAINT "SQL040118143112730" FOREIGN KEY
		("CUSTOMERTYPEID")
	REFERENCES "DB2ADMIN"."CUSTOMERDEMOGRAPHICS"
		("CUSTOMERTYPEID")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "DB2ADMIN"."EMPLOYEETERRITORIES"

ALTER TABLE "DB2ADMIN"."EMPLOYEETERRITORIES" 
	ADD CONSTRAINT "SQL040118143112790" FOREIGN KEY
		("TERRITORYID")
	REFERENCES "DB2ADMIN"."TERRITORIES"
		("TERRITORYID")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "DB2ADMIN"."ORDERS"

ALTER TABLE "DB2ADMIN"."ORDERS" 
	ADD CONSTRAINT "SQL040127151054370" FOREIGN KEY
		("SHIPVIA")
	REFERENCES "DB2ADMIN"."SHIPPERS"
		("SHIPPERID")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "DB2ADMIN"."PRODUCTS"

ALTER TABLE "DB2ADMIN"."PRODUCTS" 
	ADD CONSTRAINT "SQL040127151054430" FOREIGN KEY
		("CATEGORYID")
	REFERENCES "DB2ADMIN"."CATEGORIES"
		("CATEGORYID")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "DB2ADMIN"."PRODUCTS" 
	ADD CONSTRAINT "SQL040127151054460" FOREIGN KEY
		("SUPPLIERID")
	REFERENCES "DB2ADMIN"."SUPPLIERS"
		("SUPPLIERID")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for check constraints on Table "DB2ADMIN"."PRODUCTS"

ALTER TABLE "DB2ADMIN"."PRODUCTS" 
	ADD CONSTRAINT "CK_PRODUCTS_UNITPR" CHECK 
		(UNITPRICE >= 0)
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for check constraints on Table "DB2ADMIN"."PRODUCTS"

ALTER TABLE "DB2ADMIN"."PRODUCTS" 
	ADD CONSTRAINT "CK_REORDERLEVEL" CHECK 
		(REORDERLEVEL >= 0)
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for check constraints on Table "DB2ADMIN"."PRODUCTS"

ALTER TABLE "DB2ADMIN"."PRODUCTS" 
	ADD CONSTRAINT "CK_UNITSINSTOCK" CHECK 
		(UNITSINSTOCK >= 0)
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for check constraints on Table "DB2ADMIN"."PRODUCTS"

ALTER TABLE "DB2ADMIN"."PRODUCTS" 
	ADD CONSTRAINT "CK_UNITSONORDER" CHECK 
		(UNITSONORDER >= 0)
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "DB2ADMIN"."EMPLOYEES"

ALTER TABLE "DB2ADMIN"."EMPLOYEES" 
	ADD CONSTRAINT "SQL040126121642680" FOREIGN KEY
		("REPORTSTO")
	REFERENCES "DB2ADMIN"."EMPLOYEES"
		("EMPLOYEEID")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for foreign keys on Table "DB2ADMIN"."Order Details"

ALTER TABLE "DB2ADMIN"."Order Details" 
	ADD CONSTRAINT "SQL040127151054020" FOREIGN KEY
		("ORDERID")
	REFERENCES "DB2ADMIN"."ORDERS"
		("ORDERID")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "DB2ADMIN"."Order Details" 
	ADD CONSTRAINT "SQL040127151054350" FOREIGN KEY
		("PRODUCTID")
	REFERENCES "DB2ADMIN"."PRODUCTS"
		("PRODUCTID")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for check constraints on Table "DB2ADMIN"."Order Details"

ALTER TABLE "DB2ADMIN"."Order Details" 
	ADD CONSTRAINT "CK_DISCOUNT" CHECK 
		(DISCOUNT >= 0 AND DISCOUNT <= 1)
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for check constraints on Table "DB2ADMIN"."Order Details"

ALTER TABLE "DB2ADMIN"."Order Details" 
	ADD CONSTRAINT "CK_QUANTITY" CHECK 
		(QUANTITY > 0)
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for check constraints on Table "DB2ADMIN"."Order Details"

ALTER TABLE "DB2ADMIN"."Order Details" 
	ADD CONSTRAINT "CK_UNITPRICE" CHECK 
		(UNITPRICE >= 0)
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

CREATE view DB2ADMIN.CURRENT_PRODUCT_LIST AS SELECT PRODUCTS.ProductName,PRODUCTS.UnitPrice 
FROM DB2ADMIN.PRODUCTS AS PRODUCTS 
where PRODUCTS.UnitPrice > (select AVG(DB2ADMIN.PRODUCTS.UnitPrice) from DB2ADMIN.PRODUCTS);


--------------------------------------------------------
-- Database and Database Manager configuration parameters
--------------------------------------------------------

UPDATE DBM CFG USING cpuspeed 3.306410e-007;
UPDATE DBM CFG USING intra_parallel NO;
UPDATE DBM CFG USING federated YES;
UPDATE DBM CFG USING fed_noauth NO;

UPDATE DB CFG FOR GHTDB USING locklist 25;
UPDATE DB CFG FOR GHTDB USING dft_degree 1;
UPDATE DB CFG FOR GHTDB USING maxlocks 22;
UPDATE DB CFG FOR GHTDB USING avg_appls 1;
UPDATE DB CFG FOR GHTDB USING stmtheap 2048;
UPDATE DB CFG FOR GHTDB USING dft_queryopt 5;

---------------------------------
-- Environment Variables settings
---------------------------------


--COMMIT WORK;

---CONNECT RESET;

--TERMINATE;
-- USER is: 
-- Specified SCHEMA is: DB2ADMIN
-- The db2look utility will consider only the specified tables 
-- Creating DDL for table(s)

-- Schema name is ignored for the Federated Section
;

COMMIT WORK;
CONNECT RESET;
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
DROP DATABASE GHTDB_EX;
create database ghtdb_EX USING CODESET UTF8 TERRITORY US;

CONNECT TO GHTDB_EX;
 

 CREATE TABLE "DB2ADMIN"."CUSTOMERS"  (

		  "CUSTOMERID" CHAR(10) NOT NULL , 

		  "COMPANYNAME" VARCHAR(40) NOT NULL , 

		  "CONTACTNAME" VARCHAR(30) , 

		  "CONTACTTITLE" VARCHAR(30) , 

		  "ADDRESS" VARCHAR(60) , 

		  "CITY" VARCHAR(15) , 

		  "REGION" VARCHAR(15) , 

		  "POSTALCODE" VARCHAR(10) , 

		  "COUNTRY" VARCHAR(15) , 

		  "PHONE" VARCHAR(24) , 

		  "FAX" VARCHAR(24) )   

		 IN "USERSPACE1" ; 

-- DDL Statements for indexes on Table "DB2ADMIN"."CUSTOMERS"



CREATE INDEX "DB2ADMIN"."CITY" ON "DB2ADMIN"."CUSTOMERS" 

		("CITY" ASC);



-- DDL Statements for indexes on Table "DB2ADMIN"."CUSTOMERS"



CREATE INDEX "DB2ADMIN"."COMPANYNAME" ON "DB2ADMIN"."CUSTOMERS" 

		("COMPANYNAME" ASC);



-- DDL Statements for indexes on Table "DB2ADMIN"."CUSTOMERS"



CREATE INDEX "DB2ADMIN"."PK_CUSTOMERS" ON "DB2ADMIN"."CUSTOMERS" 

		("CUSTOMERID" ASC)

		CLUSTER ;



-- DDL Statements for indexes on Table "DB2ADMIN"."CUSTOMERS"



CREATE INDEX "DB2ADMIN"."POSTALCODE" ON "DB2ADMIN"."CUSTOMERS" 

		("POSTALCODE" ASC);



-- DDL Statements for indexes on Table "DB2ADMIN"."CUSTOMERS"



CREATE INDEX "DB2ADMIN"."REGION" ON "DB2ADMIN"."CUSTOMERS" 

		("REGION" ASC);







-- DDL Statements for unique constraints on Table "DB2ADMIN"."CUSTOMERS"

ALTER TABLE "DB2ADMIN"."CUSTOMERS" ADD CONSTRAINT "UK_CUSTOMERID" UNIQUE ("CUSTOMERID");




COMMIT WORK;
CONNECT RESET;
TERMINATE;
