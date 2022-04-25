--Creating Database
Create Database ASPNETAssignment1;

--Selecting Database
Use ASPNETAssignment1;

--Creating Table
Create table FootBallLeague(
MatchID int Primary key,
TeamName1 varchar(12),
TeamName2 varchar(12),
[Status] varchar(12),
WinningTeam varchar(12),
Points int
);

--Creating Procedure
Create Procedure FootBallLeagueProcedure(
@MatchID int,
@TeamName1 varchar(12),
@TeamName2 varchar(12),
@Status varchar(12),
@WinningTeam varchar(12),
@Points int
)
As
Begin
Insert Into FootBallLeague(MatchID,TeamName1,TeamName2,[Status],WinningTeam,Points)
Values(@MatchID,@TeamName1,@TeamName2,@Status,@WinningTeam,@Points)
End

--Using Procedure to Insert values in table
Exec FootBallLeagueProcedure 1001,Italy,France,Win,France,4;
Exec FootBallLeagueProcedure 1002,Brazil,Portugal,Draw,null,2;
Exec FootBallLeagueProcedure 1003,England,Japan,Win,England,4;
Exec FootBallLeagueProcedure 1004,USA,Russia,Win,Russia,4;
Exec FootBallLeagueProcedure 1005,Portugal,Italy,Draw,null,2;
Exec FootBallLeagueProcedure 1006,Brazil,France,Win,Brazil,4;
Exec FootBallLeagueProcedure 1007,England,Russia,Win,Russia,4;
Exec FootBallLeagueProcedure 1008,Japan,USA,Draw,null,2;

--Selecting all winning TeamNames
Select WinningTeam
From FootBallLeague
Where [Status]='Win';

--Creating View to display teams whose status is Draw
Create View Match_View As
Select TeamName1,TeamName2
From FootBallLeague
Where WinningTeam='Draw';

--Selecting all matches in which Japan played
Select *
From FootBallLeague
Where TeamName1='Japan'
OR TeamName2='Japan';