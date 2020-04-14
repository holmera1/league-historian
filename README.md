# league-historian

Welcome to League Historian!

This README will document the basic environment setup needed in order to recreate the running project.

**Steps:**

1.	Download all of the code source files that pertain to this web application. And copy all of the files into a folder named league-historian and put this folder into the htdocs directory of your WAMP, MAMP, or XAMPP server. Make sure that your name the folder 
2.	Go to the following link and download the .csv files for the complete dataset.
  	https://www.kaggle.com/paololol/league-of-legends-ranked-matches
3.	Turn on your Apache server and your MySQL servers. (These must be on or you will not be able to recreate the running project.)
4.	Open the file named project2-final.sql within MySQL Workbench.
5.	Scroll down to the Data Insertion section of the SQL database code.
>Note that this starts at line 168 and ends at line 397.
6.	For all of the load statements, change the directories where you are loading the files to the absolute path of the location of where your csv files currently are on your local machine.
>If you forget to do this step or ignore this step, MySQL Workbench will throw errors and the dataset will not be loaded into your local machine.
7.	Attempt to execute all queries within the file using MySQL Workbench.
>The order that the queries come in is significantly important. DO NOT try to execute the queries in an order that is not the same as how they appear in the given file.

>Note: If you are receiving errors (not warnings) in MySQL Workbench, then go into each individual .csv file, delete the data in the A2 cell within the .csv file and then re-enter the data back into the same cell. Then save the file as a .csv file again to the same location.
8.	Double-check to see that all of the tables were created properly in MySQL Workbench, along with the data loaded in for each table.
>If done correctly up to this point, your database will contain 8 tables, 1 view, and 7 stored procedures.

**Steps 9 to 12 are only for those who are trying to recreate this project on a non-Windows machine**

9.	Open the files conn.php and functions.php within a text editor or other IDE that is capable of editing PHP code or files.
10.	In conn.php, change the variables $dbuname and $dbpass to match the default values for username and password on your local operating system.
>For example, on Windows, the default admin username is ‘root’ and the password is empty.

>Make sure that you are changing these values to be strings using quotation marks to enclose the username and password.
11.	In addition to this, change the port number within the construction of the PDO to match your port used in MySQL Workbench.
>Typically, on Windows, the default port number is 3306.
12.	Repeat steps 9-11 for every individual function within functions.php as well.
>Note that this can be done very easily using an IDE like PHPStorm by JetBrains by doing a find and replace all.
13.	By this point, you will have everything that you need to run the project within a web browser. Our recommendation is Google Chrome! Go into your browser and go to localhost/league-historian/dashboard.php

**If you have followed all of the steps above correctly, then you will be able to see the web application in your browser. You can now begin looking at the history of the meta by selecting a patch in the dropdown menu and hitting submit.**
