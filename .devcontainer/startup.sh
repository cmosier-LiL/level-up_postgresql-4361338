apt update &&
apt install -y postgresql &&
service postgresql start &&
su postgres -c "psql -c 'create role vscode login;'" &&
su postgres -c "psql -c 'create database linkedin;'"

# Run an initial setup script for the MariaDB database
if [ -f .devcontainer/setup-postgresql.sql ]; then
  psql -h 127.0.0.1 -U postgres postgres < .devcontainer/setup-postgresql.sql
fi
