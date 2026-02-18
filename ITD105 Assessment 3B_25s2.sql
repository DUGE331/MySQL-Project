DROP DATABASE IF EXISTS Assessment_3B_25s2_Dreamhome;

CREATE DATABASE Assessment_3B_25s2_Dreamhome;

USE Assessment_3B_25s2_Dreamhome;

CREATE TABLE Branch (
branchNo   CHAR(9) NOT NULL, 
address    VARCHAR(50) NOT NULL, 
postcode   VARCHAR(5) NOT NULL, 
telNo      VARCHAR(10) NOT NULL,
CONSTRAINT branch_PK
       PRIMARY KEY (branchNo)
);

CREATE TABLE Staff (
staffNo    CHAR(9) NOT NULL, 
fName      VARCHAR(25) NOT NULL, 
lName      VARCHAR(35) NOT NULL, 
address    VARCHAR(50) NOT NULL, 
mobTelNo   VARCHAR(10) NOT NULL, 
position   VARCHAR(15) NOT NULL, 
gender	   ENUM ('M','F', 'O'), 
DOB        DATE, 
salary     DECIMAL(8,2) NOT NULL,
branchNo   CHAR(9) NOT NULL,
CONSTRAINT staff_PK
       PRIMARY KEY (staffNo),
CONSTRAINT staff_branch_FK 
       FOREIGN KEY (branchNo) 
           REFERENCES Branch(branchNo)
);

CREATE TABLE PropertyOwner (
ownerNo    CHAR(9) NOT NULL, 
fName      VARCHAR(25) NOT NULL, 
lName      VARCHAR(35) NOT NULL, 
address    VARCHAR(50) NOT NULL, 
telNo      VARCHAR(10) NOT NULL,
CONSTRAINT propertyOwner_PK
       PRIMARY KEY (ownerNo)
);


CREATE TABLE PropertyForRent (
propertyNo CHAR(9) NOT NULL, 
address    VARCHAR(50) NOT NULL,
postcode   VARCHAR(5) NOT NULL,  
propertyType VARCHAR(15) NOT NULL, 
rooms      SMALLINT NOT NULL, 
rent       DECIMAL(6, 1) NOT NULL, 
ownerNo    CHAR(9) NOT NULL, 
staffNo    CHAR(9) NOT NULL,  
branchNo   CHAR(9) NOT NULL,
CONSTRAINT propertyForRent_PK
       PRIMARY KEY (propertyNo),
CONSTRAINT property_owner_FK 
       FOREIGN KEY (ownerNo) 
       REFERENCES PropertyOwner(ownerNo),
CONSTRAINT property_staff_FK 
       FOREIGN KEY (staffNo) 
       REFERENCES Staff(staffNo),
CONSTRAINT property_branch_FK 
       FOREIGN KEY (branchNo) 
       REFERENCES Branch(branchNo)
);

CREATE TABLE Client (
clientNo   CHAR(9) NOT NULL, 
fName      VARCHAR(25) NOT NULL, 
lName      VARCHAR(35) NOT NULL, 
address    VARCHAR(50) NOT NULL, 
mobTelNo   VARCHAR(10) NOT NULL, 
emailAddr  VARCHAR(50),  
prefType   VARCHAR(15) NOT NULL, 
maxRent    DECIMAL(6,1) NOT NULL, 
CONSTRAINT client_PK
       PRIMARY KEY (clientNo)
);

CREATE TABLE Inspection(
clientNo   CHAR(9) NOT NULL, 
propertyNo CHAR(9) NOT NULL, 
viewDate   DATE NOT NULL, 
comments   VARCHAR(50),
CONSTRAINT inspection_PK
       PRIMARY KEY (propertyNo, clientNo),
CONSTRAINT inspection_propty_FK 
       FOREIGN KEY (propertyNo) 
       REFERENCES PropertyForRent(propertyNo),
CONSTRAINT inspection_client_FK 
       FOREIGN KEY (clientNo) 
       REFERENCES Client(clientNo)
);

CREATE TABLE Registration (
clientNo   CHAR(9) NOT NULL,
branchNo   CHAR(9) NOT NULL, 
staffNo    CHAR(9) NOT NULL, 
dateJoined DATE NOT NULL,
CONSTRAINT registration_PK
       PRIMARY KEY (clientNo, branchNo),
CONSTRAINT register_client_FK 
       FOREIGN KEY (clientNo) 
       REFERENCES Client(clientNo),
CONSTRAINT registister_branch_FK 
       FOREIGN KEY (branchNo) 
           REFERENCES Branch(branchNo),
CONSTRAINT register_staff_FK 
       FOREIGN KEY (staffNo) 
       REFERENCES Staff(staffNo)
);

INSERT INTO Client VALUES ('CN55','Robert','De Niro','5 Godfather St ConcreteShoes Q 4567','0141881825', 'rdenero@hotmail.com.au', 'Flat',470.0);
INSERT INTO Client VALUES ('CN65','Katherine','Hepburn','5 AfricanQueen St Congo Q 4568','0141881825', 'khepburn@hotmail.com.au','Flat',560.0);
INSERT INTO Client VALUES ('CN75','Humphrey','Bogart','5 Casablanca St RicksPlace Q 4569','0141881825', 'hbogart@hotmail.com.au','House',830.0);
INSERT INTO Client VALUES ('CN85','Tom','Hanks','5 Castaway St LonelyIsland Q 4566','0141841825', 'thanks@hotmail.com.au','Flat',460.0);

-- SELECT * FROM Client;

INSERT INTO Branch VALUES ('BN003','56 Dover Drive Wilston','Q4041','3345 6789');
INSERT INTO Branch VALUES ('BN006','163 Pain Street Enoggera','Q4041','3365 6790');
INSERT INTO Branch VALUES ('BN009','32 Chance Road Zillmere','Q4043','3325 6791');
INSERT INTO Branch VALUES ('BN012','22 Steer Road East Brisbane','Q4044','3335 6792');
INSERT INTO Branch VALUES ('BN015','16 Argon Street Cleveland','Q4045','3385 6793');

-- SELECT * FROM Client;

INSERT INTO Staff VALUES ('SN009','Mandy','Johnston','5 Chapel Rd Wilston Q 4567','0141881825','Assistant','F','2000-02-19',65000,'BN006');
INSERT INTO Staff VALUES ('SN014','Terry','Longbody','10 George St Zillmere Q 4567','0141481825','Assistant','O','2001-03-24',85000,'BN003');
INSERT INTO Staff VALUES ('SN037','Lia','Smith','15 Mary St Albany Creek Q 4567','0141881825','Manager','F','2002-11-10',120000,'BN003');
INSERT INTO Staff VALUES ('ST005','Shaza','Randall','25 Ann St Samford Q 4567','0141841825','Assistant','O','1990-06-03',88000,'BN003');
INSERT INTO Staff VALUES ('ST021','John','Brown','30 Margaret St Eatons Hill Q 4567','0141841825','Assistant','M','1995-10-01',111000,'BN006');
INSERT INTO Staff VALUES ('ST041','Jules','Lee','35 Wharf St Grange Q 4567','0141848825','Manager','F','1995-06-13',105000,'BN009');
INSERT INTO Staff VALUES ('SN020','Marco','Peters','40 Chapel Rd Windsor Q 4567','0141848825','Teller','M','1999-05-23',85000,'BN012');
INSERT INTO Staff VALUES ('SN007','Janet','Doe','45 Turbot St Enogerra Q 4567','0141481825','Teller','F','1998-07-13',83000,'BN003');
INSERT INTO Staff VALUES ('SN008','Neal','Walker','50 Grange Rd Kelvin Grove Q 4567','0141881825','Teller','M','1991-03-09',81000,'BN015');

-- SELECT * FROM Staff;

INSERT INTO PropertyOwner VALUES ('PO046','John','Kent','12 Fergus Dr, Grange Q4053','0141862812');
INSERT INTO PropertyOwner VALUES ('PO086','Maggie','Simpson','16 Achray St, Windsor Q4030','0141577419');
INSERT INTO PropertyOwner VALUES ('PO076','Ike','Turner','18 Well St, Windsor Q4030','0141941728');
INSERT INTO PropertyOwner VALUES ('PO096','Peta','Sims','20 Park Pl, Windsor Q4030','0141257025');

-- SELECT * FROM PropertyOwner;

INSERT INTO PropertyForRent VALUES ('PH014','16 Holhead Rd Wilston','Q4052','House',6,650,'PO086','SN014','BN006');
INSERT INTO PropertyForRent VALUES ('PF016','5 Manor Drv Grange','Q4051','Flat',4,450,'PO076','SN037','BN003');
INSERT INTO PropertyForRent VALUES ('PH021','18 Manor Rd Grange','Q4051','House',5,600,'PO076','SN007','BN009');
INSERT INTO PropertyForRent VALUES ('PF036','2 Manor Rd Grange','Q4051','Flat',3,375,'PO046','SN008','BN012');
INSERT INTO PropertyForRent VALUES ('PF004','6 Manor St Grange','Q4051','Flat',3,350,'PO096','ST005','BN003');
INSERT INTO PropertyForRent VALUES ('PH097','Muir Dv Wilston','Q4052','House',3,380,'PO046','ST021','BN015');
INSERT INTO PropertyForRent VALUES ('PF094','6 Argyll St Zillmere','Q4053','Flat',4,400,'PO096','SN014','BN006');

-- SELECT * FROM PropertyForRent;

INSERT INTO Inspection VALUES ('CN55','PH014','2023-05-24','too small');
INSERT INTO Inspection VALUES ('CN75','PF016','2023-04-20','too remote');
INSERT INTO Inspection VALUES ('CN55','PF016','2023-05-26',NULL);
INSERT INTO Inspection VALUES ('CN65','PF036','2023-05-14','no dining room');
INSERT INTO Inspection VALUES ('CN85','PF004','2023-04-28',NULL);

-- SELECT * FROM Inspection;

INSERT INTO Registration VALUES ('CN55', 'BN006', 'SN014', '2021-01-02');
INSERT INTO Registration VALUES ('CN65', 'BN003', 'SN037', '2020-04-11');
INSERT INTO Registration VALUES ('CN75', 'BN003', 'ST005', '2021-11-16');
INSERT INTO Registration VALUES ('CN85', 'BN009', 'ST041', '2021-03-07');

-- SELECT * FROM Registration;

-- End of script

#“erase the old table if it exists, so we can start fresh.” is what drop table does
DROP TABLE IF EXISTS BrisAuctionedProperty;
DROP TABLE IF EXISTS BrisAuction;
DROP TABLE IF EXISTS PropertyListedForSale;


-- PropertyListedForSale table
CREATE TABLE PropertyListedForSale (
    propertyNo CHAR(9) NOT NULL,
    address VARCHAR(50) NOT NULL,
    postcode VARCHAR(5) NOT NULL,
    propertyType VARCHAR(15) NOT NULL,
    rooms SMALLINT NOT NULL,
    listingPrice DECIMAL(12,2) NOT NULL CHECK (listingPrice > 600000.00),
    ownerNo CHAR(9) NOT NULL,
    staffNo CHAR(9) NOT NULL,
    branchNo CHAR(9) NOT NULL,
    PRIMARY KEY (propertyNo),
    -- Foreign keys
    CONSTRAINT fk_sale_owner FOREIGN KEY (ownerNo) REFERENCES PropertyOwner(ownerNo),
    CONSTRAINT fk_sale_staff FOREIGN KEY (staffNo) REFERENCES Staff(staffNo),
    CONSTRAINT fk_sale_branch FOREIGN KEY (branchNo) REFERENCES Branch(branchNo)
);


-- BrisAuction table
CREATE TABLE BrisAuction (
    auctionNo CHAR(9) NOT NULL,
    date DATE NOT NULL,
    auctionAddress VARCHAR(50) DEFAULT NULL,
    branchNo CHAR(9) NOT NULL,
    PRIMARY KEY (auctionNo),
    -- Foreign key
    CONSTRAINT fk_auction_branch FOREIGN KEY (branchNo) REFERENCES Branch(branchNo)
);

-- BrisAuctionedProperty table
CREATE TABLE BrisAuctionedProperty (
    auctionNo CHAR(9) NOT NULL,
    propertyNo CHAR(9) NOT NULL,
    finalBidAmount DECIMAL(12,2) DEFAULT NULL,
    soldFor DECIMAL(12,2) DEFAULT 600000.00, #Constraint for "soldFor is $600 000.00 by default."
    PRIMARY KEY (auctionNo, propertyNo),
    -- Foreign keys
    CONSTRAINT fk_auctioned_auction FOREIGN KEY (auctionNo) REFERENCES BrisAuction(auctionNo),
    CONSTRAINT fk_auctioned_property FOREIGN KEY (propertyNo) REFERENCES PropertyListedForSale(propertyNo)
);

-- Sample INSERTs based on your data

INSERT INTO PropertyListedForSale VALUES
('PS020','87 King Road Albion','Q4532','House',5,1200000,'PO076','SN009','BN003'),
('PS018','51 South Street New Market','Q4235','House',4,960000,'PO046','ST021','BN006'),
('PS064','397 Richmond Kelvin Grove','Q4333','Flat',3,750000,'PO076','SN007','BN006');

INSERT INTO BrisAuction VALUES
('AN008','2023-01-24',NULL,'BN015'),
('AN060','2023-01-04','Auction house 164 Pain St g Q4051','BN006'),
('AU089','2023-02-13',NULL,'BN012');

INSERT INTO BrisAuctionedProperty VALUES
('AN008','PS018',950000,950500),
('AN060','PS064',NULL,750000);

SELECT * FROM PropertyListedForSale;
SELECT * FROM BrisAuction;
SELECT * FROM BrisAuctionedProperty;

-- task3
SELECT clientNo, fName, lName, emailAddr, prefType, maxRent
FROM Client
WHERE prefType = 'Flat'
	AND maxRent < 560;
    
INSERT INTO Client (clientNo, fName, lName, address, mobTelNo, emailAddr, prefType, maxRent)
VALUES ('CR87', 'Marry', 'Smith', '7 Shark St Brisbane city', '0141003590', 'smith@hotmail.com.au', 'Flat', 640);

DELETE FROM Inspection
WHERE clientNo = 'CN75'
  AND propertyNo = 'PF016'
  AND viewDate = '2023-04-20';

UPDATE Staff
SET salary = salary * 1.24
WHERE staffNo IN ('SN037', 'ST041');

SELECT COUNT(*) AS num_properties #count all rows for PO046 in PropertyForRent and displau result in num_properties column
FROM PropertyForRent
WHERE ownerNo = 'PO046';

SELECT *
FROM PropertyForRent
WHERE address LIKE '2%'  #% matches any sequence of characters after the starting character and LIKE is a matching operator
   OR address LIKE '5%';

SELECT b.address AS branchAddress, COUNT(p.propertyNo) AS totalProperties 
FROM Branch b #finds branches
JOIN PropertyForRent p ON b.branchNo = p.branchNo #joins branch to its properties
GROUP BY b.branchNo, b.address 
HAVING COUNT(p.propertyNo) > 1; #displays properties over 1
