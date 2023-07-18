
# Pre-requisites

## Database

it is required the server to have a copy of the AdventureWorksOLTP database

* AdventureWorks OLTP sample databases can be found at: https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms
* the scripts provided have been sucessfully tested with databases created from AdventureWorks2022.bak |  AdventureWorks2019.bak |  AdventureWorks2017.bak |  AdventureWorks2016.bak

### Enlarged Database

(optional) In case you want to simulate workload with a bigger database  expanding the sales tables by manually running the following scripts:

* "AdventureWorks_EnlargeSalesTables.sql"
* "AdventureWorks_CreateEnlargedSalesTables.sql"

## RML utilities

the client machine needs to have RML utilitites installed, with the tools folder as part of the Path

* the RML UTILITIES can be downloaded from: https://www.microsoft.com/en-us/download/details.aspx?id=103126

## PowerShell

Update your PowerShell to the latest version 