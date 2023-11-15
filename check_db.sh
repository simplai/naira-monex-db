
until pg_isready -h localhost -p 5432 -U $POSTGRESQL_USER; do
      echo "WAITIIIIING"
      sleep 1
done

if psql -h localhost -p 5432 -U $POSTGRESQL_USER -d $POSTGRESQL_DATABASE -c "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public';" | grep -q '0'; then
  echo "Relationship does not exist. Running your command..."


else
  echo "Relationship already exists. Skipping command."
fi