#!/bin/bash
pg_dump -cC --inserts -U freecodecamp periodic_table > periodic_table.sql

#cd periodic_table
#git add .
#git commit -m "$(date)"
#git push -u origin main