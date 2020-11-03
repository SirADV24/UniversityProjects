
CREATE DATABASE European_History;

USE European_History;


CREATE TABLE FAMILY(
FamilyId INT PRIMARY KEY,
FullName VARCHAR(100),
Fame INT
);

CREATE TABLE Leader(
LeaderId INT PRIMARY KEY,
FullName VARCHAR(100),
FamilyId INT,
Fame INT,
FOREIGN KEY (FamilyId) REFERENCES FAMILY(FamilyId) ON DELETE CASCADE
);

CREATE TABLE Country(
FullName VARCHAR(100),
CountryId INT PRIMARY KEY,
Location VARCHAR(100),
Exist bit
);

CREATE TABLE Reign(
LeaderId INT REFERENCES Leader(LeaderId),
CountryId INT REFERENCES Country(CountryId),
BegginingOfReign DATE,
EndOfReign DATE,
primary key(CountryId, BegginingOfReign, EndOfReign),
foreign key (LeaderId) references Leader(LeaderId),
foreign key (CountryId) references Country(CountryId)
);

CREATE TABLE Commandant(
CommandantId INT PRIMARY KEY,
OverlordId INT ,
FullName VARCHAR(100),
Fame INT,
foreign key (OverlordId) References Leader(LeaderId)
);

CREATE TABLE Army(
ArmyId INT PRIMARY KEY,
CommandantId INT REFERENCES Commandant(CommandantId),
Size INT,
Experience INT,
foreign key (CommandantId) References Commandant(COmmandantId)
);

CREATE TABLE War(
AttackerId INT REFERENCES Country(CountryId),
DeffenderId INT REFERENCES Country(CountryId),
BeginningDate DATE,
EndDate DATE,
casualties INT,
primary key(AttackerId, DeffenderId, BeginningDate),
foreign key (AttackerId) References Country(CountryId),
foreign key (DeffenderId) References Country(CountryId)
);

CREATE TABLE Castles(
CastleId INT PRIMARY KEY,
FullName VARCHAR(100),
Location VARCHAR(100),
FamilyId INT,
foreign key (FamilyId) REFERENCES FAMILY(FamilyId)
);

CREATE TABLE MercenaryCompany(
FullName VARCHAR(100) PRIMARY KEY,
LeaderName VARCHAR(100),
Strenght INT,
DefaultPrice INT
);

CREATE TABLE Contract(
LeaderId INT ,
CompanyName VARCHAR(100),
Price INT,
foreign key (LeaderId) References Leader(LeaderId),
foreign key (CompanyName) References MercenaryCompany(FullName),
PRIMARY key (LeaderId, CompanyName, Price)
);

