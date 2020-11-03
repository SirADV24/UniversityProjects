USE European_History;


-- Wrong insert

Insert into Country(FullName, CountryId, Location, Exist) 
	Values('Romania', 1, 'Est of Europe', 1);

Insert into Leader(LeaderId, FullName, FamilyId, Fame) Values(100, 'On hundred one characters are here
On hundred one characters are hereOn hundred one characters are hereOn hundred one characters are here
On hundred one characters are hereOn hundred one characters are hereOn hundred one characters are here
On hundred one characters are hereOn hundred one characters are hereOn hundred one characters are here
On hundred one characters are hereOn hundred one characters are hereOn hundred one characters are here
On hundred one characters are hereOn hundred one characters are hereOn hundred one characters are here
On hundred one characters are hereOn hundred one characters are hereOn hundred one characters are here
On hundred one characters are hereOn hundred one characters are hereOn hundred one characters are here', 2, 10);
-- Updates

Update Country
Set Location = 'Middle of Europe'
Where CountryId = 1;

Update FAMILY
Set Fame = 10
Where FamilyId = 1;

-- Delete

Delete Leader
where Fame < 5;

-- A) Union

Select L.FullName, L.Fame, L.FamilyId
From Leader as L
Where L.Fame > 9
Union ALL
Select L.FullName, L.Fame, L.FamilyId
From Leader as L
Where (L.FullName like 'C%' or L.FullName like 'F%');


Select C.FullName, C.Location
From Country as C
Where Location = 'Center of Europe'
Union 
Select C.FullName, C.Location
From Country as C
Where Location = 'NorthWest of Europe'
ORDER by C.FullName;

-- B) Intersect

Select *
From Reign
Where LeaderId IN (
	Select LeaderId
    From Leader
    Where Fame > (
		Select AVG(Fame)
		From Leader
    ) AND BegginingOfReign > Cast('1440-01-01' as Date)
);

Select LeaderId
From Leader
Intersect
Select LeaderId
From Reign;

-- C) Except

Select LeaderId
from Leader
Except
Select LeaderId
from Reign;

Select FullName
from MercenaryCompany
Where FullName Not In (
	Select CompanyName
    From Contract
);


-- D) Joins

Select L.LeaderId, L.FullName, C.FullName, R.BegginingOfReign, R.EndOfReign, L.Fame
from Leader as L INNER JOIN Reign as R
	On( L.LeaderId = R.LeaderId)
INNER JOIN Country as C
	On(R.CountryId = C.CountryID)
Where L.Fame > 8;

Select L.FullName, F.FullName, C.FullName, R.BegginingOfReign, R.EndOfReign
from Reign as R
Left join Leader as L 
On R.LeaderId = L.LeaderId
Left join Country as C
On R.CountryId = C.CountryId
Left join FAMILY as F
On L.FamilyId = F.FamilyId;

Select Com.FullName, L.FullName
from Leader as L
Right join Commandant as Com
On Com.OverlordId = L.LeaderId;

Select Cas.FullName, Cas.Location, F.FullName 
From Castles as Cas 
FULL Join FAMILY as F
ON Cas.FamilyId = F.FamilyId;

-- E) subqueries

-- "Select the leader who rulled in a country that no longer exists "
Select L.FullName, C.FullName, R.BegginingOfReign, R.EndOfReign
From Reign as R
Left join Country as C
On R.CountryId = C.CountryId
Left join Leader as L
On R.LeaderId = L.LeaderId 
Where L.LeaderId In(
	Select R.LeaderId
	From Reign as R
	Where R.CountryId In (
		Select CountryId
		From Country
		Where Exist = 0
	)
);

-- "Select the leaders whose families have an above average fame"
Select L.FullName, F.FullName, F.Fame
From Leader as L
Right join FAMILY as F
On L.FamilyId = F.FamilyId
Where L.FamilyId in (
	Select FamilyId from FAMILY as F
	Where F.Fame > (
		Select AVG(Fame)
		From FAMILY as F
	)
);



-- F) 
-- "Select only the commandant who are in charge of at least 1 army larger than 100k soldiers"
Select *
from Commandant as Com
Where Exists (
	Select A.ArmyId, A.[Size]
	From Army as A
	Where A.CommandantId = Com.CommandantId
	And A.size > 100000
);

Select *
from War as W
Where Exists(
	Select C.CountryId
	From Country as C
	Where C.Exist = 1 AND (W.AttackerId = C.CountryId or W.DeffenderId = C.CountryId)
);

-- G)
-- "Select the leaders from families whose own castles in France, Germany or Romania"
-- "		and have the fame between 5 and 10"
Select Target.FullName
From (Select *
	From Leader as L
	Where L.FamilyId in (
		Select F.FamilyId from FAMILY as F
		Where F.FamilyId in (
			Select Cas.FamilyId
			From Castles as Cas 
			Where Cas.Location in ('France', 'Germany', 'Romania')
		)	
	) )	as Target
Where Target.Fame BETWEEN 5 and 10;

-- "Select the wars with casualties higher than 10000 and show in descending order"
Select *
From (Select *
	From War as W
	Where W.casualties > 10000
) as TopWars
Order by TopWars.casualties Desc;


--H)
-- "Select the least damaging war and the most damaing one from a country that no longer exists"
Select C.FullName, Min(W.casualties) as Min_Casulaties , Max(W.casualties) as Max_Casualties
From War as W
Left Join Country as C on W.AttackerId = C.CountryId
Group by C.FullName, W.AttackerId
Having W.AttackerId in (
	Select C.CountryId
	From Country as C
	Where C.Exist = 0
)

-- Show the countries whose location is in West, North or East or Europe with the amount of soldiers lost
-- 		in a war they started

Select C.FullName, SUM(W.casualties) as All_casualties
From War as W
Left JOIN Country as C
On W.AttackerId = C.CountryId
Group by W.AttackerId, C.FullName
Having W.AttackerId in (
	Select C.CountryId from Country as C
	Where C.Location = 'NorthWest of Europe' 
	or C.[Location] = 'West of Europe' or C.[Location] = 'East of Europe'
);

-- Show the families who have more than 3 castles

Select F.FullName
from Castles as Cas 
Left join FAMILY as F On Cas.FamilyId = F.FamilyId
Group by F.FullName, Cas.FamilyId
Having Count(Cas.FamilyId) >= 3;

-- Show the Leader and his commander from the leaders with above average fame

Select L.FullName, C.FullName
From Leader as L 
RIGHT Join Commandant as C on C.OverlordId = L.LeaderId
Group by L.FullName, C.FullName, L.Fame
Having L.Fame > (
	Select AVG(L.Fame)
	From Leader as L
);


-- i)

-- Select Leaders who have a commandant who is more famous than them
Select L.FullName
From Leader L
Where L.Fame < any (
	Select Com.Fame
	from Commandant Com
);

Select L.FullName
From Leader as L 
Where L.Fame < (
	Select MAX(Com.Fame)
	From Commandant as Com
);

-- Mercenary companies that ALWAYS got more money than expected
Select * 
From MercenaryCompany M
WHere M.DefaultPrice > ALL (
	Select C.Price
	From Contract as C INNER join MercenaryCompany as M On C.CompanyName = M.FullName
);


Select * 
From MercenaryCompany M
WHere M.DefaultPrice > (
	Select Max(C.Price)
	From Contract as C inner join MercenaryCompany as M On C.CompanyName = M.FullName
);

-- All leaders
Select *
From Leader L 
Where L.Fame = Any(
	Select L2.Fame from Leader L2
	Where L.LeaderId = L2.LeaderId
);


Select *
From Leader L
Where L.Fame in (
	Select L2.Fame From Leader L2
	Where L.LeaderId = L2.LeaderId
);

-- Select leaders with fame bigger than all commanders
Select *
From Leader L
Where L.Fame > ALL(
	Select Com.Fame from Commandant as Com
);

Select * 
From Leader L 
WHere L.Fame not in(
	Select Com.Fame from Commandant as Com
);
