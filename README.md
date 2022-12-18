# Light BnB

## Project Summary

Light BnB is a lightweight clone of AirBnB, used as a test bed for psql database querying (and building) as part of [Lighthouse Labs Web Development Flex Program](https://www.lighthouselabs.ca/en/web-development-flex-program).


Lighthouse BnB_WebApp simulates a development mockup of an AirBnB style booking app, and the base code for that aspect of the project can be found on [Lighthouse Labs GitHub](https://github.com/lighthouse-labs/LightBnB_WebApp). The clone originally pulled from an in-memory database; I rewrote the appropriate parts of the back end to pull data from an sql database, making queries via browser interaction using javascript and PostgreSQL.

<img src ="public_gif\LightBnB.gif" alt="LightBnB screenshot gif">

### Setup

Assuming you have [Node.js](https://nodejs.org/en/), [npm](https://www.npmjs.com/), [PostgreSQL](https://www.postgresql.org/), and [git](https://git-scm.com/) installed on your computer, you can proceed by:

Clone the repository and enter the LightBnB directory.
```
git clone git@github.com:tronross/LightBnB.git LightBnB
cd LightBnB
```

Open psql via the CLI:

```
psql
```
You may be prompted to choose a password for your user, if you need to choose a password, the command is:
```
\password
```
Enter the password, press return and then confirm it.

You will need to create the database. While running psql:
```
CREATE DATABASE lightbnb;
```
Then, connect to the database, create the tables from the included schema, and seed it with some included fake data:
```
\c lightbnb;
\i migrations/01_schema.sql;
\i seeds/01_seeds.sql
\i seeds/02_seeds.sql
```
At this point, you can run psql queries from the command line or by importing sql query files.
```
SELECT * FROM properties
WHERE city = 'Edmonton';
```
To explore the database via the app, quit psql, change to the LightBnB_WebApp-master directory and install the dependencies:
```
\q
cd LightBnB_WebApp-master
npm install
```

The dependencies for the project are:
```
bcrypt:          ^3.0.6
body-parser:     ^1.19.0
cookie-session:  ^1.3.3
dotenv:          ^16.0.3
express:         ^4.17.1
nodemon:         ^1.19.1
pg:              ^8.8.0
```

Please insure that you have npx installed (it has been bundled with npm since version 5.20). If you do not have npx installed, you may install it via the command

```
npm install -g npx
```
Create an .env file in the root of the LightBnB_WebApp-master directory and populate it with your configuration data (you will find an .env.example file there to follow).

You launch the server by entering:

```
npm run local
```
You can now launch the app by going to [http://localhost:3000/](http://localhost:3000/).

If you wish to sign in as a user, you can utilize any of the user e-mails from the database, an example is 'ossie@teddybearz.net'. Passwords for all users are 'password'.

An ERD for the database may be found in the /planning directory.