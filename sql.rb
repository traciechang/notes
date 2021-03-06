# RDBMS Intro 10/4/17

# - Relational Model
# - RDBMS allows you interact with data (example: SQLite3, Postgres)

# - DDL (data definition language)
# 	- describes structure of tables
# 	- build tables
# 	- Ex: CREATE, DROP

# - DML (data manipulation language)
# 	- add, edit, delete data in tables
# 	- SELECT, INSERT, UPDATE, DELETE

*************************************************************************

# Demo

# - DDL

# CREATE TABLE plays (
# 	id INTEGER PRIMARY KEY,
# 	title TEXT NOT NULL,
# 	year INTEGER NOT NULL,
# 	playwright_id INTEGER NOT NULL,

# 	FOREIGN KEY (playwright_id) REFERENCES playwrights(id)
# );

# CREATE TABLE playwrights (
# 	id INTEGER PRIMARY KEY,
# 	name TEXT NOT NULL,
# 	birth_year INTEGER
# );

# - DML (what we are doing below is seeding)

# INSERT INTO
# 	playwrights (name, birth_year)
# VALUES
# 	('Arthur Miller', 1915),
# 	('Eugene O''Neill', 1888); #use the extra ' in SQL for quotes inside quotes

# INSERT INTO
# 	plays (title, year, playwright_id)
# VALUES
# 	('All My Sons', 1947, (SELECT id FROM playwrights WHERE name = 'Arthur Miller')) # embed a query to get id since playwrights table has not yet been created
# 	('Long Day''s Journey Into Night', 1956, (SELECT id FROM playwrights WHERE name = 'Eugene O''Neill'))

# go to to terminal:
# -> ls (to make sure you're in right file)
# -> cat import_db.sql | sqlite3 plays.db
# -> sqlite3 plays.db
# -> .tables (will show u all ur tables)
# -> .schema (will show you something similar to your DML
# - you can now interact with your data in here w/ queries
# - you can also insert data here

# now you can go to another terminal tab and go into pry
# -> require 'sqlite3'
# -> plays_db = SQLite3::Database.new(*./plays.db)
# -> plays_db.execute("SELECT * FROM plays") <- this will get your query
# -> plays_db.execute("INSERT INTO plays (title, year, playwright_id)
# VALUES ('The Glass', 1944, 3)")

# *************************************************************************
# Object Relational Mapping (ORM)

# - When we queried for data, we got back an array of arrays [[1, "Play Title", 1999, 1],...]
# - But how do we know what all these data mean? Not useful for Ruby developers
# - What if we can create instances of play with all this data? -> ORM

# class Play

# 	::all (this will get all plays in db)
# 	#initialize (create new instances of plays)
# 	#create (this will put your instances into db)
# 	#update (lets you update created instances)

# end

# - With this, you don't have to be writing SQL in your RUby code. We can interact w/ db in the language our code is written in

# Ex for update:

# def update
# 	raise "#{self} not in databse" unless @id
# 	PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
# 		UPDATE
# 			plays
# 		SET
# 			title = ?, year = ?, play_wright_id = ?
# 		WHERE
# 			id = ?
# 	SQL
# end

# ************************************************************************
# - SQL injection attacks

