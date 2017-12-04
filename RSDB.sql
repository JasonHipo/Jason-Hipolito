--item
CREATE TABLE Item (
    ItemID serial UNIQUE NOT NULL,
    name text,
    itemDesc text,
PRIMARY KEY (ItemID)
);
--Monster
Create TABLE Monster (
    MID serial UNIQUE NOT NULL,
    Name text,
    MonsterLevel integer,
    Weakness text,
    Primary Key(MID)
);
--DropTable
Create TABLE DropTable (
    DropTableID serial UNIQUE NOT NULL,
    ItemID integer references Item(ItemID) NOT NULL,
    MID integer references monster(MID) NOT NULL,
    DropRate decimal(5,2)
);
--Inventory
CREATE TABLE Inventory (
    InvID serial UNIQUE NOT NULL,
    ItemID integer references Item(ItemID) NOT NULL,
    ItemName text,
PRIMARY KEY (InvID)
);
--ItemRelation
CREATE TABLE ItemRelation (   
    InvID integer references Inventory(InvID) NOT NULL,
    ItemID integer references Item(ItemID) NOT NULL
);
--Bank
CREATE TABLE Bank (
    BID serial UNIQUE NOT NULL,
    CID integer references Item(ItemID) NOT NULL,
PRIMARY KEY (BID)
) ;
--StoredItems
CREATE TABLE StoredItems (
     BID integer references Bank(BID) NOT NULL,
     ItemID integer references Item(ItemID) NOT NULL,
     ItemName text
);
--Skill
CREATE TABLE Skill (
    SID serial UNIQUE NOT NULL,
    Level integer,
    Experience integer,
    Primary Key (SID)
);
--Quest
CREATE TABLE Quest (
    QID serial UNIQUE NOT NULL,
    Name text,
    QuestDesc text,
    ReqLevel integer,
PRIMARY KEY (QID)
);
--QuestReward
CREATE TABLE QuestReward (
    QID integer references Quest(QID) NOT NULL,
    Experience integer
);
--QuestLog
CREATE TABLE QuestLog (
    QuestLogID serial UNIQUE NOT NULL,
    CID integer references Item(ItemID) NOT NULL,
    Primary Key (QuestLogID)
);
--UserCharacter
CREATE TABLE UserCharacter (
    CID serial UNIQUE NOT NULL,
	QuestLogID integer references QuestLog(QuestLogID) NOT NULL,
    InvID integer references Inventory(InvID) NOT NULL,
    BID integer references Bank(BID) NOT NULL,
    UserName VarChar(12),
    DisplayName VarChar(12),
    Primary Key(CID)
);
--SkillRelation
CREATE TABLE SkillRelation (
    CID integer references UserCharacter(CID) NOT NULL,
	SID integer references Skill(SID) NOT NULL
);
--QuestCompleted
Create TABLE QuestCompleted (
    QuestlogID integer references Questlog(QuestlogID ) NOT NULL,
    CID integer references UserCharacter(CID) NOT NULL,
    Questcompleted text
);
--QuestRelation
CREATE TABLE QuestRelation (
     QuestLogID integer references questLog(QuestLogID) NOT NULL,
     QID integer references Quest(QID) NOT NULL
);


--item
INSERT INTO item (name, itemdesc)
VALUES ('Spade', 'Used to dig');

INSERT INTO item (name, itemdesc)
VALUES ('Pickaxe', 'Used to mine');

INSERT INTO item (name, itemdesc)
VALUES ('Rune Scimitar', 'Slash weapon');

INSERT INTO item (name, itemdesc)
VALUES ('Bandos Chestplate', 'Defensive chestplate');

INSERT INTO item (name, itemdesc)
VALUES ('Dragon Boots', 'Strong Boots');

INSERT INTO item (name, itemdesc)
VALUES ('Draggon Dagger', 'Special Weapon');

INSERT INTO item (name, itemdesc)
VALUES ('Abyssal Whip', 'An Abyssal Deamon Spine');

INSERT INTO item (name, itemdesc)
VALUES ('Legends Cape', 'Cape for legends');

INSERT INTO item (name, itemdesc)
VALUES ('Ahrim Staff', 'Anchient Staff');

INSERT INTO item (name, itemdesc)
VALUES ('Ashes', 'Its ashes');

INSERT INTO item (name, itemdesc)
VALUES ('Arclight', 'A strong weapon agiants demons');

INSERT INTO item (name, itemdesc)
VALUES ('Bones', 'Bury these');

INSERT INTO item (name, itemdesc)
VALUES ('Big Bones', 'Bury these');

INSERT INTO item (name, itemdesc)
VALUES ('Death Rune', 'Magical Runes');

INSERT INTO item (name, itemdesc)
VALUES ('Chaos Rune', 'Magical Runes');

INSERT INTO item (name, itemdesc)
VALUES ('Air Rune', 'Magical Runes');

INSERT INTO item (name, itemdesc)
VALUES ('Fire Rune', 'Magical Runes');

--monster
INSERT INTO monster (name, monsterlevel, weakness)
VALUES ('General Graador', 642, 'Stab');

INSERT INTO monster (name, monsterlevel,weakness)
VALUES ('Abyssal Demon', 124, 'Arclight');

INSERT INTO monster (name, monsterlevel,weakness)
VALUES ('Goblin', 5, 'Slash');

INSERT INTO monster (name, monsterlevel,weakness)
VALUES ('Spiritual Mage', 83, 'Ranged');

INSERT INTO monster (name, monsterlevel,weakness)
VALUES ('Ahrim the Blighted', 98, 'Ranged');

--Droptable
INSERT INTO Droptable (itemid, mid,droprate)
VALUES (1, 1, 40);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (3, 1, 20);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (4, 1, 20);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (15, 1, 60);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (7, 2, .25);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (13, 1, 100);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (14, 2, 30);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (10, 2, 100);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (15, 2, 30);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (16, 2, 30);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (12, 4, 100);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (2, 4, 2.5);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (17, 4, 25);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (16, 4, 25);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (14, 5, 45);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (2, 5, 1);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (11, 5, 3);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (12, 5, 100);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (9, 3, 2);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (10, 3, 100);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (3, 3, 15);

INSERT INTO Droptable (itemid, mid,droprate)
VALUES (6, 3, 10);

--inventory
INSERT INTO inventory 
VALUES (1,1, 'Spade');

INSERT INTO inventory
VALUES (2,15, 'Chaos Rune');

INSERT INTO inventory 
VALUES (3,15, 'Chaos Rune');

INSERT INTO inventory 
VALUES (4,15, 'Chaos Rune');

INSERT INTO inventory 
VALUES (5,9, ' Ahrims Staff');

INSERT INTO inventory
VALUES (6,13, 'Big Bones');

--itemrelation
INSERT INTO itemrelation (invid, itemID)
VALUES (1, 1);

INSERT INTO itemrelation (invid, itemID)
VALUES (2, 15);

INSERT INTO itemrelation (invid, itemID)
VALUES (3, 15);

INSERT INTO itemrelation (invid, itemID)
VALUES (4, 15);

INSERT INTO itemrelation (invid, itemID)
VALUES (5, 9);

INSERT INTO itemrelation (invid, itemID)
VALUES (6, 13);

--Bank
INSERT INTO bank 
VALUES (1, 1);

INSERT INTO bank 
VALUES (2, 2);

INSERT INTO bank 
VALUES (3, 3);

INSERT INTO bank
VALUES (4, 4);

INSERT INTO bank 
VALUES (5, 5);

INSERT INTO bank 
VALUES (6, 6);

--storeditems
INSERT INTO storeditems 
VALUES (1, 1, 'Spade');
INSERT INTO storeditems 
VALUES (1,4,'Bandos chestplate');
INSERT INTO storeditems 
VALUES (1,1,'Spade');
INSERT INTO storeditems 
VALUES (2,3,'Rune Scimitar');
INSERT INTO storeditems 
VALUES (2,4,'Bandos chestplate');
INSERT INTO storeditems 
VALUES (4,3,'Rune Scimitar');
INSERT INTO storeditems 
VALUES (3,5,'Dragon Boots');
INSERT INTO storeditems 
VALUES (3,4,'Bandos Chestplate');
INSERT INTO storeditems 
VALUES (5,11,'Arclight');
INSERT INTO storeditems 
VALUES (6,3,'Rune Scimitar');
INSERT INTO storeditems 
VALUES (6,4,'Bandos chestplate');
INSERT INTO storeditems 
VALUES (4,5,'Dragon Boots');

--Quest
INSERT INTO Quest 
VALUES (1,'Dragon Slayer','Go to the island of craynor and slay the dragon',32);
INSERT INTO Quest 
VALUES (2,'Cooks assisstant', 'The cook of lumbridge needs you to get ingredients for a cake',10);
INSERT INTO Quest 
VALUES (3,'Fight Arena', 'Save a mothers child from the fight arena',45);
INSERT INTO Quest 
VALUES (4,'Vampire Slayer', 'Kill a vampire thats harassing Draynor Village', 20);
INSERT INTO Quest 
VALUES (5,'Lost Tribe', 'There is a disturbance in the lunbridge basement, go investigate',55);
INSERT INTO Quest 
VALUES (6,'Another Slice of H.A.M.', 'H.A.M. has kidnaped my brother, go save him',65);

--skill
INSERT INTO skill
VALUES (1,12, 1584);

INSERT INTO skill
VALUES (2,96, 9684577);

INSERT INTO skill
VALUES (3,55, 166636);

INSERT INTO skill
VALUES (4,99, 13034431);

INSERT INTO skill
VALUES (5,88, 4385776);

INSERT INTO skill
VALUES (6,65, 449428);

--QuestReward
INSERT INTO QuestReward
VALUES (1,30000);
INSERT INTO QuestReward
VALUES (2,150);
INSERT INTO QuestReward
VALUES (3,3000);
INSERT INTO QuestReward
VALUES (4,400);
INSERT INTO QuestReward
VALUES (5,23000);
INSERT INTO QuestReward
VALUES (6,50000);

--QuestLog
INSERT INTO Questlog
VALUES (1,1);
INSERT INTO Questlog
VALUES (2,2);
INSERT INTO Questlog
VALUES (3,3);
INSERT INTO Questlog
VALUES (4,4);
INSERT INTO Questlog
VALUES (5,5);
INSERT INTO Questlog
VALUES (6,6);

--usercharacter
INSERT INTO usercharacter
VALUES (1,1,1,1,'Jay','Dark Jason53');
INSERT INTO usercharacter
VALUES (2,2,2,2,'FishSlayer90','CaptnFish');
INSERT INTO usercharacter
VALUES (3,3,3,3,'DragonBeast','PonyBoy');
INSERT INTO usercharacter
VALUES (4,4,4,4,'L33tNoob','GetGud');
INSERT INTO usercharacter
VALUES (5,5,5,5,'LordAlan','Inferno');
INSERT INTO usercharacter
VALUES (6,6,6,6,'Kitty4life','dogsrcool');

--skillrelation
INSERT INTO skillrelation
VALUES (1,1);
INSERT INTO skillrelation
VALUES (2,2);
INSERT INTO skillrelation
VALUES (3,3);
INSERT INTO skillrelation
VALUES (4,4);
INSERT INTO skillrelation
VALUES (5,5);
INSERT INTO skillrelation
VALUES (6,6);

--questcompleted
INSERT INTO questcompleted
VALUES (2,2,'Dragon Slayer');
INSERT INTO questcompleted
VALUES (2,2,'Vampire Slayer');
INSERT INTO questcompleted
VALUES (2,2,'Cooks Assisstant');
INSERT INTO questcompleted
VALUES (3,3,'Vampire Slayer');
INSERT INTO questcompleted
VALUES (3,3,'Lost Tribe');
INSERT INTO questcompleted
VALUES (5,5,'Another Slice of H.A.M.');
INSERT INTO questcompleted
VALUES (4,4,'Another Slice of H.A.M.');
INSERT INTO questcompleted
VALUES (5,5,'Lost Tribe');
INSERT INTO questcompleted
VALUES (6,6,'Another Slice of H.A.M.');
INSERT INTO questcompleted
VALUES (6,6,'Vampire Slayer');
INSERT INTO questcompleted
VALUES (6,6,'Lost Tribe');
INSERT INTO questcompleted
VALUES (6,6,'Cooks Assisstant');
INSERT INTO questcompleted
VALUES (6,6,'Dragon Slayer');
INSERT INTO questcompleted
VALUES (6,6,'Fight Arena');
INSERT INTO questcompleted
VALUES (2,2,'Lost Tribe');

--QuestRelation
INSERT INTO questrelation
VALUES (1,1);
INSERT INTO questrelation
VALUES (2,1);
INSERT INTO questrelation
VALUES (3,2);
INSERT INTO questrelation
VALUES (4,2);
INSERT INTO questrelation
VALUES (5,4);
INSERT INTO questrelation
VALUES (6,5);








