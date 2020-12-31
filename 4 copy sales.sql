psql -h localhost -p 5432 -U username -d databasename

\copy sales from 'fullpath\sales.csv' WITH CSV header;
