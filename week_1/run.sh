docker network create pg_network

docker run -it \
  -e POSTGRES_USER="shdev" \
  -e POSTGRES_PASSWORD="root" \
  -e POSTGRES_DB="ny_taxi" \
  -v $(pwd)/ny_taxi_postgres_data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --network pg_network \
  --name pg-database \
postgres:14

docker run -it \
  -e PGADMIN_DEFAULT_EMAIL="admin@admin.com" \
  -e PGADMIN_DEFAULT_PASSWORD="root" \
  -p 8080:80 \
  --network pg_network \
  --name pgadmin \
dpage/pgadmin4


URL=https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-01.csv.gz

python ingest.py \
  --user=shdev \
  --password=root \
  --host=localhost \
  --port=5432 \
  --db=ny_taxi \
  --table_name=green_taxi_trips \
  --url=${URL}


URL=https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-01.csv.gz

python ingest.py \
  --user=shdev \
  --password=root \
  --host=localhost \
  --port=5432 \
  --db=ny_taxi \
  --table_name=green_taxi_trips \
  --url=${URL}

URL=https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv

python ingest.py \
  --user=shdev \
  --password=root \
  --host=localhost \
  --port=5432 \
  --db=ny_taxi \
  --table_name=taxi_zone_lookup \
  --url=${URL}

