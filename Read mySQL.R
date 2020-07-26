#####Reading from mySQL in R environment
#In one mySQL connection there may be multiple databases
#In one database there may be multiple tables
#Each table is like a dataframe

ucscDb <- dbConnect(MySQL(), user = "genome", host = "genome-mysql.cse.ucsc.edu")
#opens a mySQL connection as ucscDb
#user = "genome" is given on mySQL link
#host ="..." is where the mySQL server is

result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb)
#go to database link and send mySQL command "show database" through dbGet command
#remember to disconnect from server
#TRUE indicates successful disconnection
#"result" shows all databases that is available in mySQL connection as given by "show databases" command

hg19 <- dbConnect(MySQL(), user = "genome", db = "hg19", host = "genome-mysql.cse.ucsc.edu")
#hg19 is one of the databases available in mySQL connection
#remember to include in dbConnect command

allTables <- dbListTables(hg19)
#list all tables in the hg19 database

columnnames <- dbListFields(hg19, "affyU133Plus2")
#list all fields(columns) in the "affyU133Plus2" table

dbGetQuery(hg19, "select count(*) from affyU133Plus2")
#go to hg19 database and send mySQL command of "select count(*) from affyU133Plus2"
#mySQL command "select count(*) from..." gets the number of rows

#affyData <- dbReadTable(hg19, "affyU133Plus2")
#extract data table/frame from "affyU133Plus2" in hg19 database

query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
#select a specific subset of the data table/frame
#"misMacthes" is a column in the table
#filter table based on "misMatches" values from 1 to 3

affyMis <- fetch(query);quantile(affyMis$misMatches)
#fetch function pulls the query and stores in local environment
#Used as follow up to "dbSendQuery" which is used to indicate subset of dataframe

affyMisSmall <- fetch(query, n = 10); dbClearResult(query)
#only fetch first 10 rows of data frame from query

dbDisconnect(hg19)
#always remember to close the connection












