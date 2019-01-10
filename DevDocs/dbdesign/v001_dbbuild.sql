create database wits_plusx DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;
grant all privileges on `wits_plusx`.* to 'witsdb'@'%' identified by 'witsdb';
flush privileges;


create database wits_plusx_demo DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;
grant all privileges on `wits_plusx_demo`.* to 'witsdb'@'%' identified by 'witsdb';
flush privileges;


grant all on `information_schema`.* to 'root'@'%' identified by 'witsdb' with grant option;
flush privileges;


GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'witsdb' WITH GRANT OPTION;
flush privileges;


SELECT host,user,Grant_priv,Super_priv FROM mysql.user;
UPDATE mysql.user SET Grant_priv='Y', Super_priv='Y' WHERE User='root';
FLUSH PRIVILEGES;
GRANT ALL ON *.* TO 'root'@'%';
