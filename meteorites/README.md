## execute this first
sqlite3 meteorites.db
## execute the following cmds in the terminal after
.read reset.sql //
.import --csv --skip 1 meteorites.csv meteorites_temp // 
.read import.sql //
