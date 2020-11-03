USE European_History;


Insert into FAMILY(FamilyId,FullName, Fame) Values(1, 'Hohenzollern', 8);
Insert into FAMILY(FamilyId,FullName, Fame) Values(2, 'Dracuiesti', 5);
Insert into FAMILY(FamilyId,FullName, Fame) Values(3, 'Basarab', 4);
Insert into FAMILY(FamilyId,FullName, Fame) Values(4, 'Musat', 5);
Insert into FAMILY(FamilyId,FullName, Fame) Values(5, 'Von Habsburg', 10);
Insert into FAMILY(FamilyId,FullName, Fame) Values(6, 'De Valois', 9);
Insert into FAMILY(FamilyId,FullName, Fame) Values(7, 'Bourbon', 9);
Insert into FAMILY(FamilyId,FullName, Fame) Values(8, 'Windsdor', 7);
Insert into FAMILY(FamilyId,FullName, Fame) Values(9, 'Osmanlogu', 9);
Insert into FAMILY(FamilyId,FullName, Fame) Values(10, 'De Medici', 9);
Insert into FAMILY(FamilyId,FullName, Fame) Values(11, 'Bonaparte', 7);
Insert into FAMILY(FamilyId,FullName, Fame) Values(12, 'Wettin', 8);

Insert into Leader(LeaderId, FullName, FamilyId, Fame) Values(1, 'Vlad the Impaler', 2, 10);
Insert into Leader(LeaderId, FullName, FamilyId, Fame) Values(2, 'Lorenzo the magnificent', 10, 10);
Insert into Leader(LeaderId, FullName, FamilyId, Fame) Values(3, 'Stephen the Great', 4, 8);
Insert into Leader(LeaderId, FullName, FamilyId, Fame) Values(4, 'Elisabeth the second', 8, 6);
Insert into Leader(LeaderId, FullName, FamilyId, Fame) Values(5, 'Wilhelm the second', 1, 9);
Insert into Leader(LeaderId, FullName, FamilyId, Fame) Values(6, 'Ferdinand of Romania', 1, 8);
Insert into Leader(LeaderId, FullName, FamilyId, Fame) Values(7, 'Micheal', 1, 8);
Insert into Leader(LeaderId, FullName, FamilyId, Fame) Values(8, 'Suleyman the magnificent', 9, 10);
Insert into Leader(LeaderId, FullName, FamilyId, Fame) Values(9, 'Charles the Vth', 5, 7);
Insert into Leader(LeaderId, FullName, FamilyId, Fame) Values(10, 'Charles the VIth', 8, 6);
Insert into Leader(LeaderId, FullName, FamilyId, Fame) Values(11, 'Emperor Charles', 5, 12);
Insert into Leader(LeaderId, FullName, FamilyId, Fame) Values(12, 'Napoleon', 11, 12);

Insert into Country(FullName, CountryId, Location, Exist) Values('Romania', 1, 'Est of Europe', 1);
Insert into Country(FullName, CountryId, Location, Exist) Values('Germany', 2, 'Center of Europe', 1);
Insert into Country(FullName, CountryId, Location, Exist) Values('Holy Roman Empire', 3, 'Center of Europe', 0);
Insert into Country(FullName, CountryId, Location, Exist) Values('Austria', 4, 'Center of Europe', 1);
Insert into Country(FullName, CountryId, Location, Exist) Values('Spain', 5, 'SouthWest of Europe', 1);
Insert into Country(FullName, CountryId, Location, Exist) Values('England', 6, 'NorthWest of Europe', 1);
Insert into Country(FullName, CountryId, Location, Exist) Values('France', 7, 'West of Europe', 1);
Insert into Country(FullName, CountryId, Location, Exist) Values('Moldova', 8, 'East of Europe', 0);
Insert into Country(FullName, CountryId, Location, Exist) Values('Wallachia', 9, 'East of Europe', 0);
Insert into Country(FullName, CountryId, Location, Exist) Values('Florence', 10, 'South of Europe', 0);

Insert into Reign(LeaderId, CountryId, BegginingOfReign, EndOfReign) Values(1, 9, '1428-01-01', '1431-01-01');
Insert into Reign(LeaderId, CountryId, BegginingOfReign, EndOfReign) Values(1, 9, '1467-01-01', '1477-01-01');
Insert into Reign(LeaderId, CountryId, BegginingOfReign, EndOfReign) Values(2, 10, '1449-01-01', '1492-01-01');
Insert into Reign(LeaderId, CountryId, BegginingOfReign, EndOfReign) Values(3, 8, '1457-01-01', '1504-01-01');
Insert into Reign(LeaderId, CountryId, BegginingOfReign, EndOfReign) Values(4, 6, '1952-01-01', '2020-01-01');
Insert into Reign(LeaderId, CountryId, BegginingOfReign, EndOfReign) Values(7, 1, '1927-01-01', '1930-01-01');
Insert into Reign(LeaderId, CountryId, BegginingOfReign, EndOfReign) Values(7, 1, '1940-01-01', '1947-01-01');
Insert into Reign(LeaderId, CountryId, BegginingOfReign, EndOfReign) Values(5, 2, '1907-01-01', '1918-01-01');
Insert into Reign(LeaderId, CountryId, BegginingOfReign, EndOfReign) Values(11, 3, '1530-01-01', '1558-01-01');

Insert into Commandant(CommandantId, OverlordId, FullName, Fame) Values(1, 11, 'Gustav De Savoy', 10);
Insert into Commandant(CommandantId, OverlordId, FullName, Fame) Values(2, 3, 'Boier Andreius', 7);
Insert into Commandant(CommandantId, OverlordId, FullName, Fame) Values(3, 8, 'Pasa Hasan', 5);
Insert into Commandant(CommandantId, OverlordId, FullName, Fame) Values(4, 7, 'Maresal Alexandru Averescu', 8);
Insert into Commandant(CommandantId, OverlordId, FullName, Fame) Values(5, 7, 'Maresal Ion Antonescu', 9);
Insert into Commandant(CommandantId, OverlordId, FullName, Fame) Values(6, 5, 'Paul von Hindenberg', 8);
Insert into Commandant(CommandantId, OverlordId, FullName, Fame) Values(7, 5, 'Paul von Lettow-Vorbeck', 6);
Insert into Commandant(CommandantId, OverlordId, FullName, Fame) Values(8, 1, 'Boier Constantin', 4);
Insert into Commandant(CommandantId, OverlordId, FullName, Fame) Values(9, 12, 'Jean-Charles Abbatucci ', 8);

Insert into Army(ArmyId, CommandantId, Size, Experience) Values(1, 1, 30000, 8);
Insert into Army(ArmyId, CommandantId, Size, Experience) Values(2, 2, 15000, 5);
Insert into Army(ArmyId, CommandantId, Size, Experience) Values(3, 4, 700000, 7);
Insert into Army(ArmyId, CommandantId, Size, Experience) Values(4, 6, 345000, 8);
Insert into Army(ArmyId, CommandantId, Size, Experience) Values(5, 5, 900000, 3);
Insert into Army(ArmyId, CommandantId, Size, Experience) Values(6, 3, 120000, 10);
Insert into Army(ArmyId, CommandantId, Size, Experience) Values(7, 5, 5000, 3);
Insert into Army(ArmyId, CommandantId, Size, Experience) Values(8, 9, 200000, 10);
Insert into Army(ArmyId, CommandantId, Size, Experience) Values(9, 5, 30000, 5);
Insert into Army(ArmyId, CommandantId, Size, Experience) Values(10, 7, 100000, 5);

Insert into War(AttackerId, DeffenderId, BeginningDate, EndDate, casualties) Values (6, 7, '1109-01-01', '1113-01-01', 30000);
Insert into War(AttackerId, DeffenderId, BeginningDate, EndDate, casualties) Values (6, 7, '1337-01-01', '1453-01-01', 50000);
Insert into War(AttackerId, DeffenderId, BeginningDate, EndDate, casualties) Values (7, 6, '1475-01-01', '1476-01-01', 70000);
Insert into War(AttackerId, DeffenderId, BeginningDate, EndDate, casualties) Values (6, 7, '1496-01-01', '1498-01-01', 130000);
Insert into War(AttackerId, DeffenderId, BeginningDate, EndDate, casualties) Values (8, 9, '1321-01-01', '1323-01-01', 10000);
Insert into War(AttackerId, DeffenderId, BeginningDate, EndDate, casualties) Values (3, 7, '1320-01-01', '1323-01-01', 300000);
Insert into War(AttackerId, DeffenderId, BeginningDate, EndDate, casualties) Values (6, 5, '1655-01-01', '1659-01-01', 10000);
Insert into War(AttackerId, DeffenderId, BeginningDate, EndDate, casualties) Values (5, 6, '1701-01-01', '1702-01-01', 550000);

Insert into Castles(CastleId, FullName, Location, FamilyId) Values (1, 'Montluçon castle', 'France', 7);
Insert into Castles(CastleId, FullName, Location, FamilyId) Values (2, 'Neuschwanstein', 'Germany', 1);
Insert into Castles(CastleId, FullName, Location, FamilyId) Values (3, 'Bran', 'Romania', 5);
Insert into Castles(CastleId, FullName, Location, FamilyId) Values (4, 'Château de Chantilly', 'France', 6);
Insert into Castles(CastleId, FullName, Location, FamilyId) Values (5, 'Eilean Donan', 'Scotland', 8);
Insert into Castles(CastleId, FullName, Location, FamilyId) Values (6, 'Hohenzollern Castle', 'Germany', 1);
Insert into Castles(CastleId, FullName, Location, FamilyId) Values (7, 'Corvin Castle', 'Romania', 5);
Insert into Castles(CastleId, FullName, Location, FamilyId) Values (8, 'Alcázar of Segovia', 'Spain', 6);
Insert into Castles(CastleId, FullName, Location, FamilyId) Values (9, 'The Alcázar of Seville', 'France', 7);
Insert into Castles(CastleId, FullName, Location, FamilyId) Values (10, 'Burg Kreuzenstein', 'Austria', 5);


Insert into MercenaryCompany(FullName, LeaderName, Strenght, DefaultPrice) Values ('Black legion', 'Unknown', 25, 1000000);
Insert into MercenaryCompany(FullName, LeaderName, Strenght, DefaultPrice) Values ('Hawk fog', 'Griffith', 100, 1250000);
Insert into MercenaryCompany(FullName, LeaderName, Strenght, DefaultPrice) Values ('The Ten Thousand', 'Artaxerxes', 80, 150000);
Insert into MercenaryCompany(FullName, LeaderName, Strenght, DefaultPrice) Values ('The White Company', 'Sir John Hawkwood', 65, 2000000);
Insert into MercenaryCompany(FullName, LeaderName, Strenght, DefaultPrice) Values ('The Swiss Guard', 'Pope', 30, 0);
Insert into MercenaryCompany(FullName, LeaderName, Strenght, DefaultPrice) Values ('The Flying Tigers', 'Chennault', 35, 20000);
Insert into MercenaryCompany(FullName, LeaderName, Strenght, DefaultPrice) Values ('The Catalan Grand Company', 'Roger de Flor', 90, 100000);
Insert into MercenaryCompany(FullName, LeaderName, Strenght, DefaultPrice) Values ('The Varangian Guard', 'Emperor Basil II', 75, 1250000);


Insert into Contract(LeaderId, CompanyName, Price) VALUES (1, 'Black legion', 1000000);
Insert into Contract(LeaderId, CompanyName, Price) VALUES (3, 'The White Company', 150000);
Insert into Contract(LeaderId, CompanyName, Price) VALUES (7, 'The Catalan Grand Company', 1250000);
Insert into Contract(LeaderId, CompanyName, Price) VALUES (2, 'Hawk fog', 50000);
Insert into Contract(LeaderId, CompanyName, Price) VALUES (10, 'The Varangian Guard', 1350000);