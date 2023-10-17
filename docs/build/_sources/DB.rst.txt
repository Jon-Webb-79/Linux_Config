*****************
Install Databases
*****************
This section will describe the process for installing several Relational 
Database Management Systems (RDBMS).

SQLite
======
SQLite can be installed with the following command

.. code-block:: bash 

   sudo pacman -S sqlite 

You can also install a DB Browser with the command 

.. code-block:: bash 

   sudo pacman -S sqlitebrowser 

More information on SQLite in Arch Linux can be found in the 
`SQLite Arch Wiki <https://wiki.archlinux.org/title/SQLite>`_.

MariaDB
=======
MariaDB is the preferred installation of the MySQL suite in the Arch Linux
distribution.  More information on the use this suite can be found
at the `MariaDB Arch Wiki page <https://wiki.archlinux.org/title/MariaDB>`_.

#. Install MariaDB 

   .. code-block:: bash 

      sudo pacman -S mariadb 

   Run the following command to complete the installation process.

   .. code-block:: bash 

      maria-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

#. Start and enable services 

   .. code-block:: bash 

      systemctl enable mariadb.service 
      systemctl start mariadb.service 

#. Run the security protocol for mariadb 

   .. code-block:: bash 

      mariadb-secure-installation

#. Log into MariaDB.  The Arch Linux Wiki process asks a user to type the 
   command ``mariadb -u root -p``; however, this is predicated on the notion 
   that the user set a root password during the installation process, which 
   does not occur in an Arch Linux install.  The correct command to launch
   MariaDB is;

   .. code-block:: bash 

      sudo mariadb -u

#. Set the root password.  From within MariaDB type the following command 

   .. code-block:: bash 

      SET PASSWORD FOR 'root'@'localhost' = PASSWORD('password_here');

   From this point on, the Arch Linux Wiki is correct.

#. From within the MariaDB terminal create users with some or all root 
   privleges. 

   .. code-block:: bash 

      CREATE USER 'username'@'localhost' IDENTIFIED BY 'password_here';
      GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost';

   where ``ALL`` can and should be replaced with more specific privileges.
   You can even set priveleges to specific databases with a command such as;

   .. code-block:: bash 

      GRANT ALL PRIVILEGES ON db_name.* 'username'@'localhost';

#. You can also download the MySQL Workbench as a GUI front end for the 
   database management system.

   .. code-block:: bash 

      sudo pacman -S mysql-workbench

Once installed you can access workbench through the Desktop Environment
applications menu.  The application will also have to be configured to your 
local host when launched the first time.

PostGreSQL
==========
More information can be found from the 
`Arch Linux PostGreSQL Wiki <https://wiki.archlinux.org/title/PostgreSQL>`_ page.

#. Install PostGreSQL with the command 

   .. code-block:: bash 

      sudo pacman -S postgresql 

#. Open PostGreSQL with the command 

   .. code-block:: bash 

      sudo -iu postgres

#. Initialize the database cluster with 

   .. code-block:: bash 

      initdb --locale=C.UTF-8 --encoding=UTF8 -D /var/lib/postgres/data-checksums 

#. Return to standard user by typing ``exit``.

#. Initialize service with 

   .. code-block:: bash 

      sudo systemctl enable postgresql.service 
      sudo systemctl start postgresql.service 

#. Log back into postgres 

   .. code-block:: bash 

      sudo -iu postgres

#. Create a root user account

   .. code-block:: bash 

      createuser --interactive root 

   When prompted if this is a superuser, type ``y``.

#. Create a local user 

   .. code-block:: bash 

      createuser --interactive username 

   When prompted if you want this person to be a superuser, respond with ``n``.
   When prompted to make this user able to create new databases, but not able
   to assign new roles.  **NOTE:** Once in a database you can also create a new 
   user via the SQL command.

   .. code-block:: bash 

      CREATE ROLE username WITH LOGIN PASSWORD 'passowrd'

   Via SQL command, authorities can be assigned via 

   .. code-block:: bash 

      ALTER ROLE username ROLE 

   where ``ROLE`` can be 

   .. code-block:: bash 

      CREATEDB, SUPERUSER, CREATEROLE, REPLICATION, BYPASS RLS, etc 

#. Create a database with the command

   .. code-block:: bash 

      createdb myDatabaseName 

#. Connect to the database with the command 

   .. code-block:: bash 

      psql -d myDatabaseName 

#. Quit with ``\q``

#. Adter wuitting, you may get a warning stating 

   .. code-block:: bash 

      /var/lib/postgresql/.psql_history does not exist. 

   If this occurs, take the following steps.

   .. code-block:: bash 

      sudo chown postgres:postgres /var/lib/postgres/ 
      sudo chmod 700 /var/lib/postgres/ 
      sudo -iu postgres touch /var/lib/postgres/.psql_history 

#. Create a database with the command

   .. code-block:: bash 

      createdb myDatabaseName 

#. Connect to the database with the command 

   .. code-block:: bash 

      psql -d myDatabaseName 

#. Quit with ``\q``

#. Adter wuitting, you may get a warning stating 

   .. code-block:: bash 

      /var/lib/postgresql/.psql_history does not exist. 

   If this occurs, take the following steps.

   .. code-block:: bash 

      sudo chown postgres:postgres /var/lib/postgres/ 
      sudo chmod 700 /var/lib/postgres/ 
      sudo -iu postgres touch /var/lib/postgres/.psql_history 

#. From this point forward, you will access postgresql with the following 
   command 

   .. code-block:: bash 

      psql -U username -h host_name database_name

SQL-Server
==========
#. Install all required dependencies 

   .. code-block:: bash 

      mkdir aur 
      cd aur 
      yay -S mssql-server 
      yay -S msodbcsql 
      yay -S mssql-tools 

#. Configure SQL-Server 

   .. code-block:: bash 

      sudo /opt/mssql/bin/mssql-conf setup 

   Select the developer edition, it should be option 2 

   Set up the administrator password in the prompt 

#. Enable the server and ensure it initiates at computer start up 

   .. code-block:: bash 

      sudo systemctl enable mssql-server 
      sudo systemctl start mssql-server 

#. Connect as system administrator (sa)

   .. code-block:: bash 

      sqlcmd -S localhost -U sa 

   If this step has issues finding the certificate, you can run the following 
   command.  **NOTE:** This is not recommended for  production environment.

   .. code-block:: bash 

      sqlcmd -S localhost -S sa -C
