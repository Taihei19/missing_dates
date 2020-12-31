psql -h localhost -p 5432 -U username -d databasename

\copy product from 'fullpath\product.csv' WITH CSV header;
