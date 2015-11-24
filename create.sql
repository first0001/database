# ---------------------------------------------------------------------- #
# Script generated with: DeZign for Databases V9.0.0                     #
# Target DBMS:           MySQL 5                                         #
# Project file:          Project1 NUT.dez                                #
# Project name:                                                          #
# Author:                                                                #
# Script type:           Database creation script                        #
# Created on:            2015-11-23 19:10                                #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Add tables                                                             #
# ---------------------------------------------------------------------- #

# ---------------------------------------------------------------------- #
# Add table "Customer"                                                   #
# ---------------------------------------------------------------------- #
Create Schema 5605104007db;
User 5605104007db;
CREATE TABLE `Customer` (
    `C_Id` VARCHAR(40) NOT NULL,
    `C_Name` VARCHAR(40),
    `C_Address` VARCHAR(40),
    `C_Number` VARCHAR(40),
    `C_Email` VARCHAR(40),
    `C_Zipcode` VARCHAR(40),
    CONSTRAINT `PK_Customer` PRIMARY KEY (`C_Id`)
);

# ---------------------------------------------------------------------- #
# Add table "Supplier"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `Supplier` (
    `Sup_Id` VARCHAR(40),
    `P_Id` VARCHAR(40),
    `P_Name` VARCHAR(40),
    `Sup_Item` VARCHAR(40),
    `Sup_Address` VARCHAR(40),
    `Sup_Number` VARCHAR(40),
    `Sup_Email` VARCHAR(40)
);

# ---------------------------------------------------------------------- #
# Add table "Employee"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `Employee` (
    `Empnum` VARCHAR(4) NOT NULL,
    `Empname` VARCHAR(15),
    `Hiredate` DATE,
    `Salary` NUMERIC(6),
    `Position` VARCHAR(10),
    `Depno` VARCHAR(2),
    `MGRNO` VARCHAR(4),
    CONSTRAINT `PK_Employee` PRIMARY KEY (`Empnum`)
);

# ---------------------------------------------------------------------- #
# Add table "Logistic"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `Logistic` (
    `Car_Id` VARCHAR(40) NOT NULL,
    `Empname` VARCHAR(40),
    `Carry` NUMERIC(10),
    `P_Id` VARCHAR(40),
    `P_Name` VARCHAR(40),
    `Empnum` VARCHAR(4) NOT NULL,
    CONSTRAINT `PK_Logistic` PRIMARY KEY (`Car_Id`, `Empnum`)
);

# ---------------------------------------------------------------------- #
# Add table "Order"                                                      #
# ---------------------------------------------------------------------- #

CREATE TABLE `Order` (
    `O_Id` VARCHAR(40) NOT NULL,
    `Time` VARCHAR(40),
    `P_Name` VARCHAR(40),
    `Price` NUMERIC,
    `Empname` VARCHAR(40),
    `C_Name` VARCHAR(40),
    `C_Id` VARCHAR(40) NOT NULL,
    `Empnum` VARCHAR(4) NOT NULL,
    CONSTRAINT `PK_Order` PRIMARY KEY (`O_Id`, `C_Id`, `Empnum`)
);

# ---------------------------------------------------------------------- #
# Add table "Order_Detail"                                               #
# ---------------------------------------------------------------------- #

CREATE TABLE `Order_Detail` (
    `O_Id` VARCHAR(40) NOT NULL,
    `P_Id` VARCHAR(40),
    `UnitPrice` VARCHAR(40),
    `Quantity` VARCHAR(40),
    `C_Id` VARCHAR(40) NOT NULL,
    `Empnum` VARCHAR(4) NOT NULL,
    CONSTRAINT `PK_Order_Detail` PRIMARY KEY (`O_Id`, `C_Id`, `Empnum`)
);

# ---------------------------------------------------------------------- #
# Add table "Product"                                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `Product` (
    `P_Id` VARCHAR(40) NOT NULL,
    `P_Name` VARCHAR(40),
    `Price` VARCHAR(40),
    `UnitsInStock` NUMERIC(10),
    `C_Id` VARCHAR(40) NOT NULL,
    `O_Id` VARCHAR(40) NOT NULL,
    `Empnum` VARCHAR(4) NOT NULL,
    `Car_Id` VARCHAR(40) NOT NULL,
    PRIMARY KEY (`P_Id`, `C_Id`, `O_Id`, `Empnum`, `Car_Id`)
);

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `Product` ADD CONSTRAINT `Logistic_Product` 
    FOREIGN KEY (`Empnum`, `Car_Id`) REFERENCES `Logistic` (`Empnum`,`Car_Id`);

ALTER TABLE `Product` ADD CONSTRAINT `Order_Product` 
    FOREIGN KEY (`C_Id`, `O_Id`, `Empnum`) REFERENCES `Order` (`C_Id`,`O_Id`,`Empnum`);

ALTER TABLE `Product` ADD CONSTRAINT `Customer_Product` 
    FOREIGN KEY (`C_Id`) REFERENCES `Customer` (`C_Id`);

ALTER TABLE `Product` ADD CONSTRAINT `Order_Detail_Product` 
    FOREIGN KEY (`C_Id`, `O_Id`, `Empnum`) REFERENCES `Order_Detail` (`C_Id`,`O_Id`,`Empnum`);

ALTER TABLE `Logistic` ADD CONSTRAINT `Employee_Logistic` 
    FOREIGN KEY (`Empnum`) REFERENCES `Employee` (`Empnum`);

ALTER TABLE `Order` ADD CONSTRAINT `Customer_Order` 
    FOREIGN KEY (`C_Id`) REFERENCES `Customer` (`C_Id`);

ALTER TABLE `Order` ADD CONSTRAINT `Employee_Order` 
    FOREIGN KEY (`Empnum`) REFERENCES `Employee` (`Empnum`);

ALTER TABLE `Order_Detail` ADD CONSTRAINT `Order_Order_Detail` 
    FOREIGN KEY (`C_Id`, `O_Id`, `Empnum`) REFERENCES `Order` (`C_Id`,`O_Id`,`Empnum`);
