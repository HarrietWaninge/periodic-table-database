#!/bin/bash
pg_dump -cC --inserts -U freecodecamp periodic_table > periodic_table.sql

yes | sudo apt-get install rsync
rsync -a --exclude={'.*','periodic_table'} ./ ./periodic_table

cd periodic_table
#git add .
#git commit -m "$(date)"
#git push -u origin main