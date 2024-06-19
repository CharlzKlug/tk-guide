#!/usr/bin/env tclsh

package require tdbc

# Include the sqlite driver
package require tdbc::sqlite3

# Create an sqlite3 database connection.
tdbc::sqlite3::connection create dbBook sqliteDB.sql

dbBook allrows {
    CREATE TABLE author (
			 id INTEGER PRIMARY KEY,
			 first TEXT,
			 last TEXT
			 );
}

# Prepare a command for inserting into author table
set authorInsert [dbBook prepare {
    INSERT INTO author (first, last) VALUES (:first, :last);
}]

foreach first {Clif Ken Mark} last {Flynt Jones Twain} {
    $authorInsert execute
}

# Prepare a command to select rows from the author table
# pattern is defined in a dict.
set authorSearch [dbBook prepare {
    SELECT * from author WHERE last like :pattern;
}]

$authorSearch foreach rowDict {pattern %n%} {
    puts "rowDict: $rowDict"
}
