# TournamentResults
###PostgreSQL backend for Swiss-style tournament
####Contents
<ul>
<li>tournament.sql creates the database, tables, and views
<li>tournament.py contains methods for querying and updating the database
<li>tournament_test.py has unit tests for tournament.py methods.
</ul>
PostgreSQL must be installed to execute these files. Once installed, run psql from the command line and enter the following to setup the database:
```
=> \i tournament.sql
=> \q
```
To test the database, from the command line enter:
```
> python tournament_test.py
```
