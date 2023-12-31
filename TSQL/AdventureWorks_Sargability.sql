/* 
This Sample Code is provided for the purpose of illustration only and is not intended
	to be used in a production environment.  THIS SAMPLE CODE AND ANY RELATED INFORMATION ARE
	PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT
	NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
	PURPOSE.  
	We grant You a nonexclusive, royalty-free right to use and modify the Sample Code
	and to reproduce and distribute the object code form of the Sample Code, provided that You
	agree: 
	(i) to not use Our name, logo, or trademarks to market Your software product in which
		the Sample Code is embedded; 
	(ii) to include a valid copyright notice on Your software product
		in which the Sample Code is embedded; 
	and (iii) to indemnify, hold harmless, and defend Us and
		Our suppliers from and against any claims or lawsuits, including attorneys fees, that arise or
		result from the use or distribution of the Sample Code.
*/

-- Query  Optimization
-- SARGability

--create tables 
DROP TABLE IF EXISTS #ProductDescriptionSARG
GO
CREATE TABLE #ProductDescriptionSARG
(
          [ProductDescriptionID] INT              NOT NULL,
          [Description]          NVARCHAR (400)   NOT NULL,
          [rowguid]              UNIQUEIDENTIFIER NOT NULL,
          [ModifiedDate]         DATETIME         NOT NULL,
          [DescriptionSingle]    VARCHAR (400)    NULL,
          PRIMARY KEY CLUSTERED ([ProductDescriptionID] ASC)
);

GO
CREATE NONCLUSTERED INDEX [IXProductDescriptionSARG_Description]
          ON [#ProductDescriptionSARG]([Description] ASC);

GO
CREATE NONCLUSTERED INDEX [IX_ProductDescriptionSARG_ModifiedDate]
          ON [#ProductDescriptionSARG]([ModifiedDate] ASC, [Description] ASC);

GO
CREATE NONCLUSTERED INDEX [IX_ProductDescriptionSARG_DescriptionSingle]
          ON [#ProductDescriptionSARG]([DescriptionSingle] ASC, [ModifiedDate] ASC);

GO
INSERT INTO #ProductDescriptionSARG
SELECT *,
       CAST ([Description] AS VARCHAR (400))
FROM   Production.ProductDescription;

GO
UPDATE        #ProductDescriptionSARG
          SET ModifiedDate = CAST (((2013 - ProductDescriptionID % 5) * 10000 + ((ProductDescriptionID % 11) + 1) * 100 + ((ProductDescriptionID) % 27) + 1) AS CHAR (8));

GO
--select * from dbo.#ProductDescriptionSARG

SELECT *
FROM   #ProductDescriptionSARG AS pds
WHERE  pds.Description LIKE '%replacement%';


SELECT *
FROM   #ProductDescriptionSARG AS pds
WHERE  pds.Description LIKE 'replacement%';

-- functions on column
-- keep an eye on the estimate vs. actual rows

--not so good
SELECT *
FROM   #ProductDescriptionSARG AS pds
WHERE  substring(pds.Description, 1, 11) = 'replacement';

--better
SELECT *
FROM   #ProductDescriptionSARG AS pds
WHERE  pds.Description LIKE 'replacement%';

-- playing with dates
SELECT pds.Description,
       pds.ModifiedDate
FROM   #ProductDescriptionSARG AS pds
WHERE  year(pds.ModifiedDate) = 2009;


GO
SELECT pds.Description,
       pds.ModifiedDate
FROM   #ProductDescriptionSARG AS pds
WHERE  pds.ModifiedDate BETWEEN '20090101' AND '20091231';
