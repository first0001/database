# ---------------------------------------------------------------------- #
# Script generated with: DeZign for Databases V9.0.0                     #
# Target DBMS:           MySQL 5                                         #
# Project file:          Project1 NUT.dez                                #
# Project name:                                                          #
# Author:                                                                #
# Script type:           Database drop script                            #
# Created on:            2015-11-23 19:10                                #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Drop foreign key constraints                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `Product` DROP FOREIGN KEY `Logistic_Product`;

ALTER TABLE `Product` DROP FOREIGN KEY `Order_Product`;

ALTER TABLE `Product` DROP FOREIGN KEY `Customer_Product`;

ALTER TABLE `Product` DROP FOREIGN KEY `Order_Detail_Product`;

ALTER TABLE `Logistic` DROP FOREIGN KEY `Employee_Logistic`;

ALTER TABLE `Order` DROP FOREIGN KEY `Customer_Order`;

ALTER TABLE `Order` DROP FOREIGN KEY `Employee_Order`;

ALTER TABLE `Order_Detail` DROP FOREIGN KEY `Order_Order_Detail`;

# ---------------------------------------------------------------------- #
# Drop table "Product"                                                   #
# ---------------------------------------------------------------------- #

# Drop constraints #

DROP TABLE `Product`;

# ---------------------------------------------------------------------- #
# Drop table "Order_Detail"                                              #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE `Order_Detail` DROP PRIMARY KEY;

DROP TABLE `Order_Detail`;

# ---------------------------------------------------------------------- #
# Drop table "Order"                                                     #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE `Order` DROP PRIMARY KEY;

DROP TABLE `Order`;

# ---------------------------------------------------------------------- #
# Drop table "Logistic"                                                  #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE `Logistic` DROP PRIMARY KEY;

DROP TABLE `Logistic`;

# ---------------------------------------------------------------------- #
# Drop table "Employee"                                                  #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE `Employee` DROP PRIMARY KEY;

DROP TABLE `Employee`;

# ---------------------------------------------------------------------- #
# Drop table "Supplier"                                                  #
# ---------------------------------------------------------------------- #

DROP TABLE `Supplier`;

# ---------------------------------------------------------------------- #
# Drop table "Customer"                                                  #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE `Customer` DROP PRIMARY KEY;

DROP TABLE `Customer`;
