## execute this first
sqlite3 meteorites.db
## execute the following cmds in the terminal after
.read reset.sql <br>
.import --csv --skip 1 meteorites.csv meteorites_temp <br>
.read import.sql <br>
