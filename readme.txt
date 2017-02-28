To run this app you need to have local web-server (tested with Tomcat) and MySQL on your PC.

DB properties:
 - url: 'jdbc:mysql://localhost:3306/test';
 - username: 'root';
 - password: 'root'.
 
Run database_script.sql in your MySQL Workbench to create database 'test', table 'user' and fill the table with some sample data.
Run mvn package and then deploy 'crud.war' (from 'target' folder) to your web-server.
Go to 'http://localhost:8080/crud/' and enjoy the app!
