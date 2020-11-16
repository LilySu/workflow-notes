# with the following prompt in psql command line:
postgres=#:

# to exit
q

# help
# help with psql commands
\?

# for commands
\h

# list databases
\l

# importing
\i [full path and file name with extension]

C:\\Users\\lilyx\\workflow-notes\\SQL\\PostgreSQL\\chinook-database\\ChinookDatabase\\DataSources\\Chinook_PostgreSql.sql

i\ 'C:/Users/lilyx/workflow-notes/SQL/PostgreSQL/chinook-database/ChinookDatabase/DataSources/Chinook_PostgreSql.sql'


# pgloader in debian
cd /mnt/c/Users/<user>/Desktop

pgloader https://github.com/lerocha/chinook-database/raw/master/ChinookDatabase/DataSources/Chinook_Sqlite_AutoIncrementPKs.sqlite pgsql:///chinook

\d track

# In Debian:
sudo -u postgres psql -p 5432 -h 127.0.0.1



# Error:
# createdb: could not connect to database template1: could not connect to server: No such file or directory
#         Is the server running locally and accepting
#         connections on Unix domain socket "/var/run/postgresql/.s.PGSQL.5433"?

sudo service postgresql restart
sudo -u postgres /etc/init.d/postgresql restart

sudo find / -type f -name pg_hba.conf


pg_ctl -D "C:\Program Files\PostgreSQL\13\data" start
pg_ctl -D "C:\Program Files\PostgreSQL\13\data" stop

# logs:
%APPDATA%\pgAdmin\pgadmin4.log

# get running processes
ps aux

# importing from psql
\i <path>

# error unrecognized schema
# set default for a role in a database:
ALTER ROLE foo IN DATABASE test SET search_path = blarg,public;
# Write the command at the top of your script. Or execute it in your DB session:

SET search_path = blarg,public;