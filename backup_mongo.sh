#!/bin/bash

DATETIME=`date +%d%m%Y-%H`
DB_TO_BACKUP='pcat' 

mongodump  -d ${DB_TO_BACKUP} -o ~/dbmongodump/${DB_TO_BACKUP}_${DATETIME}
