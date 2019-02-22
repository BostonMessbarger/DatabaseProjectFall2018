PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;
---------Create tables-----------
CREATE TABLE Users (
usid INTEGER PRIMARY KEY AUTOINCREMENT,
displayName string NOT NULL,
email string UNIQUE,
password string NOT NULL,
wallet float DEFAULT 0 CHECK(wallet >= 0) 
);

CREATE TABLE Games (
gid INTEGER PRIMARY KEY AUTOINCREMENT,
title string NOT NULL,
ryear int,
price float,
genre string,
developer string
);

CREATE TABLE Achievements (
gid int,
aid int,
name string UNIQUE,
ptValue int,
foreign key(gid) references Games(gid),
primary key(gid,aid)
);

CREATE TABLE TradingCard (
gid int,
title string NOT NULL,
tid int,
shiny int DEFAULT 0,
foreign key(gid) references Games(gid),
primary key(tid,gid)
);

CREATE TABLE Earn (
usid int,
gid int,
aid int,
foreign key(usid) references Users(usid),
foreign key(gid,aid) references Achievements(gid,aid),
primary key(usid, gid, aid)
);

CREATE TABLE Collected (
usid int,
tid int,
gid int,
foreign key(usid) references Users(usid),
foreign key(tid,gid) references TradingCard(tid,gid),
primary key(usid,tid,gid)
);

CREATE TABLE Owns (
usid int,
gid int,
foreign key(usid) references Users(usid),
foreign key(gid) references Games(gid),
primary key(usid, gid)
);

CREATE TABLE Friend (
usid int,
fid int,
primary key(usid, fid),
foreign key(usid) references Users(usid),
foreign key(fid) references Users(usid)
);
---------Populate tables--------------
--usid atuomatically generated to be unique, totalPoints set to 0
INSERT INTO Users (displayName,email,password,wallet) VALUES("Jake","janmc@mst.edu","Pa$$word",350);
INSERT INTO Users (displayName,email,password,wallet) VALUES("Boston","bmp67@mst.edu","Adm!n",40);
INSERT INTO Users (displayName,email,password,wallet) VALUES("Kevin","kanm29@mst.edu","12345",1337);
INSERT INTO Users (displayName,email,password,wallet) VALUES("Joe","joe123@mst.edu","67890",10);
INSERT INTO Users (displayName,email,password,wallet) VALUES("Bob","bob456@mst.edu","qwerty",679);
INSERT INTO Users (displayName,email,password,wallet) VALUES("Carl","lrac78@mst.edu","Hats",908);
INSERT INTO Users (displayName,email,password,wallet) VALUES("Paul","palu90@mst.edu","Caaaarrrlll",98);
--INSERT INTO Games(gid,title,ryear,price,genre,developer)
INSERT INTO Games VALUES (1,"A well titled game",2018,59.99,"Strategy","DEADBEEF");
INSERT INTO Games VALUES (2,"A second titled game",2019,59.99,"FPS","DEADBEEF");
INSERT INTO Games VALUES (3,"Metro Exodus", 2019, 59.99, "Survival horror", "4A Games");
INSERT INTO Games VALUES (4,"Lords Of The Fallen", 2014, 29.99,"ARPG", "Deck 13");
INSERT INTO Games VALUES (5,"Portal 2",2011,9.99,"Puzzle","Valve");
INSERT INTO Games VALUES (6,"DOOM",2016,19.99,"FPS","id Software");
INSERT INTO Games VALUES (7,"Guacamelee! Super Turbo Championship Edition", 2014,14.99,"Platformer","DrinkBox Studios");
INSERT INTO Games VALUES (8,"Dishonored 2",2016,39.99,"Action","Arkane Studios");
INSERT INTO Games VALUES (9,"Middle-earth: Shadow of War Definitive Edition",2017,59.99,"ARPG","Monolith Productions");
INSERT INTO Games VALUES (10,"Shadow Warrior 2",2016, 39.99,"FPS","Flying Wild Hog");
INSERT INTO Games VALUES (11,"Rocket League",2015,19.99,"Sports","Psyonix Inc");
INSERT INTO Games VALUES (12,"Star Realms",2016,0,"Strategy","White Wizard Games");
INSERT INTO Games VALUES (13,"Broforce",2015,14.99, "Action", "Free Lives");
INSERT INTO Games VALUES (14,"Skyrim",2011,19.99, "RPG", "Bethesda");
INSERT INTO Games VALUES (15,"Terraria",2011,9.99, "Sandbox", "Re-Logic");
INSERT INTO Games VALUES (16,"Getting Over It with Bennett Foddy",2017,7.99, "Frustrating", "Bennett Foddy");
INSERT INTO Games VALUES (17,"Portal",2011,9.99, "Puzzle", "Valve");
INSERT INTO Games VALUES (18,"Axiom Verge",2015,19.99, "Metroidvania", "Thomas Happ Games LCC");
INSERT INTO Games VALUES (19,"Castle Crashers",2015,14.99, "Action", "The Behemoth");
INSERT INTO Games VALUES (20,"BattleBlock Theater",2012,14.99, "Co-op", "The Behemoth");
--INSERT INTO Achievements(gid,aid,name,ptValue)
INSERT INTO Achievements VALUES (1,1,"congrats u wrote code",50);
INSERT INTO Achievements VALUES (1,2,"u did it im so proud",50);
INSERT INTO Achievements VALUES (2,1,"woo!",40);
INSERT INTO Achievements VALUES (2,2,"yay you",10);
INSERT INTO Achievements VALUES (4,1,"Bookworm",12);
INSERT INTO Achievements VALUES (4,2,"Its bound to take your life",15);
INSERT INTO Achievements VALUES (4,3,"Myself again",30);
INSERT INTO Achievements VALUES (4,4,"So thats a Lord!",40);
INSERT INTO Achievements VALUES (5,1,"Wake Up Call",17);
INSERT INTO Achievements VALUES (5,2,"Tater  Tote", 50);
INSERT INTO Achievements VALUES (5,3,"You Monster",25);
INSERT INTO Achievements VALUES (5,4,"Lunacy", 59);
INSERT INTO Achievements VALUES (6,1,"Whos Next", 70);
INSERT INTO Achievements VALUES (6,2,"An old Friend",60);
INSERT INTO Achievements VALUES (6,3,"Rip and Tear",57);
INSERT INTO Achievements VALUES (6,4,"Marked for Death",99);
INSERT INTO Achievements VALUES (7,1,"Pollo Power", 65);
INSERT INTO Achievements VALUES (7,2,"Thant’s one big Gato Frito", 55);
INSERT INTO Achievements VALUES (7,3,"Power Within",60);
INSERT INTO Achievements VALUES (7,4,"Viva La Resurreccion",28);
INSERT INTO Achievements VALUES (8,1,"The Beast Within",23);
INSERT INTO Achievements VALUES (8,2,"Morbid Theft",45);
INSERT INTO Achievements VALUES (8,3,"Ghostly",70);
INSERT INTO Achievements VALUES (8,4,"Freedom Of Speech",65);
INSERT INTO Achievements VALUES (9,1,"Better Luck Next Time",20);
INSERT INTO Achievements VALUES (9,2,"Speak Friend and Enter",47);
INSERT INTO Achievements VALUES (9,3,"Nemesis",50);
INSERT INTO Achievements VALUES (9,4,"Lord of Horror",55);
INSERT INTO Achievements VALUES (10,1,"I Think I Saw a Wabbit",60);
INSERT INTO Achievements VALUES (10,2,"Tiny Little Pieces",75);
INSERT INTO Achievements VALUES (10,3,"Colonel Fasthand",75);
INSERT INTO Achievements VALUES (10,4,"Hard Wang",92);
INSERT INTO Achievements VALUES (11,1,"First-Timer",11);
INSERT INTO Achievements VALUES (11,2,"Triple Threat",20);
INSERT INTO Achievements VALUES (11,3,"Wall-Crawler",24);
INSERT INTO Achievements VALUES (11,4,"Barras Bravas",33);
INSERT INTO Achievements VALUES (11,5,"Still A Show-Off",37);
INSERT INTO Achievements VALUES (13,1,"Hot Brotato",90);
INSERT INTO Achievements VALUES (13,2,"Shaken, Not Stirred",75);
INSERT INTO Achievements VALUES (13,3,"Your eyes can deceive you",30);
INSERT INTO Achievements VALUES (13,4,"I’ll Be Back",80);
INSERT INTO Achievements VALUES (14,1,"Unbound",12);
INSERT INTO Achievements VALUES (14,2,"Blessed",20);
INSERT INTO Achievements VALUES (14,3,"Apprentice",30);
INSERT INTO Achievements VALUES (15,1,"Timber!!",25);
INSERT INTO Achievements VALUES (15,2,"Ooo! Shiny!",34);
INSERT INTO Achievements VALUES (15,3,"You Can Do It!",35);
INSERT INTO Achievements VALUES (16,1,"Got Over It",100);
INSERT INTO Achievements VALUES (17,1,"Companion",18);
INSERT INTO Achievements VALUES (17,2,"The Cake is a Lie",25);
INSERT INTO Achievements VALUES (17,3,"The Part Where He Kills You",59);
INSERT INTO Achievements VALUES (18,1,"Xedur",16);
INSERT INTO Achievements VALUES (18,2,"Telal",28);
INSERT INTO Achievements VALUES (18,3,"Uruku",47);
INSERT INTO Achievements VALUES (18,4,"Gir-Tab",54);
INSERT INTO Achievements VALUES (18,5,"Ukhu",60);
INSERT INTO Achievements VALUES (19,1,"Melee Is Best",51);
INSERT INTO Achievements VALUES (19,2,"Maximum Firepower",72);
INSERT INTO Achievements VALUES (19,3,"Deer Trainer",77);
INSERT INTO Achievements VALUES (20,1,"Cast Member",11);
INSERT INTO Achievements VALUES (20,2,"Black Marketeer",26);
INSERT INTO Achievements VALUES (20,3,"Nail File Cake",29);
--INSERT INTO TradingCard(gid,title,tid,shiny(default 0))
INSERT INTO TradingCard VALUES (1,"Best Dev",1,1);
INSERT INTO TradingCard(gid,title,tid) VALUES (1,"A fun card",2);
INSERT INTO TradingCard(gid,title,tid) VALUES (1,"Another fun card",3);
INSERT INTO TradingCard VALUES (2,"A+ on this project",1,1);
INSERT INTO TradingCard(gid,title,tid) VALUES (2,"It works!",2);
INSERT INTO TradingCard(gid,title,tid) VALUES (4,"Chamber Boss",1);
INSERT INTO TradingCard(gid,title,tid) VALUES (4,"Chamber Exit",2);
INSERT INTO TradingCard(gid,title,tid) VALUES (5,"Destruction",1);
INSERT INTO TradingCard(gid,title,tid) VALUES (5,"Intro",2);
INSERT INTO TradingCard(gid,title,tid) VALUES (5,"The Lab",3);
INSERT INTO TradingCard(gid,title,tid) VALUES(6,"Revenant", 1);
INSERT INTO TradingCard(gid,title,tid) VALUES(6,"Mancubus",2);
INSERT INTO TradingCard(gid,title,tid) VALUES(6,"Hell Razer",3);
INSERT INTO TradingCard(gid,title,tid) VALUES(6,"Cacodemon",4);
INSERT INTO TradingCard(gid,title,tid) VALUES(7,"Jaguar Javier",1);
INSERT INTO TradingCard(gid,title,tid) VALUES(7,"Cabezon",2);
INSERT INTO TradingCard(gid,title,tid) VALUES(7,"Juan Poses for Trading Card Photo",3);
INSERT INTO TradingCard(gid,title,tid) VALUES(7,"X’Tabay",4);
INSERT INTO TradingCard(gid,title,tid) VALUES(8,"Corvo Attano",1);
INSERT INTO TradingCard VALUES(8,"Captain Meagan Foster",2,1);
INSERT INTO TradingCard(gid,title,tid) VALUES(8,"Aramis Stilton",3);
INSERT INTO TradingCard(gid,title,tid) VALUES(8,"Kirin Jindosh",4);
INSERT INTO TradingCard VALUES(9,"Weaver of Fate",1,1);
INSERT INTO TradingCard(gid,title,tid) VALUES(9,"Tar Goroth",2);
INSERT INTO TradingCard(gid,title,tid) VALUES(9,"Minas Ithil",3);
INSERT INTO TradingCard(gid,title,tid) VALUES(9,"Legendary",4);
INSERT INTO TradingCard(gid,title,tid) VALUES(9,"Gravewalker",5);
INSERT INTO TradingCard(gid,title,tid) VALUES(9,"Gorgoroth",6);
INSERT INTO TradingCard(gid,title,tid) VALUES(9,"Defender of Gondor",7);
INSERT INTO TradingCard(gid,title,tid) VALUES(10,"Lo Wang",1);
INSERT INTO TradingCard VALUES(10,"Gozu",2,1);
INSERT INTO TradingCard(gid,title,tid) VALUES(10,"Ameonna",3);
INSERT INTO TradingCard(gid,title,tid) VALUES(11,"Goal",1);
INSERT INTO TradingCard(gid,title,tid) VALUES(11,"Epic Save",2);
INSERT INTO TradingCard(gid,title,tid) VALUES(11,"That Crossbar",3);
INSERT INTO TradingCard(gid,title,tid) VALUES(13,"Brade",1);
INSERT INTO TradingCard(gid,title,tid) VALUES(13,"Bro In Black",2);
INSERT INTO TradingCard(gid,title,tid) VALUES(13,"Snake Broskin",3);
INSERT INTO TradingCard(gid,title,tid) VALUES(13,"Rambro",4);
INSERT INTO TradingCard(gid,title,tid) VALUES(13,"Satan",5);
INSERT INTO TradingCard(gid,title,tid) VALUES(13,"Ellen Ripbro",6);
INSERT INTO TradingCard(gid,title,tid) VALUES(14,"Dragur",1);
INSERT INTO TradingCard VALUES(14,"Alduin",2,1);
INSERT INTO TradingCard(gid,title,tid) VALUES(15,"Zombie",1);
INSERT INTO TradingCard(gid,title,tid) VALUES(15,"Chthulu's Eye",2);
INSERT INTO TradingCard(gid,title,tid) VALUES(15,"Blade of Terra",3);
INSERT INTO TradingCard(gid,title,tid) VALUES(16,"Cauldron",1);
INSERT INTO TradingCard(gid,title,tid) VALUES(16,"Hammer",2);
INSERT INTO TradingCard(gid,title,tid) VALUES(17,"Portal Gun",1);
INSERT INTO TradingCard(gid,title,tid) VALUES(17,"Wheatly",2);
INSERT INTO TradingCard(gid,title,tid) VALUES(17,"Companion Cube",3);
INSERT INTO TradingCard(gid,title,tid) VALUES(17,"Atlas",4);
INSERT INTO TradingCard(gid,title,tid) VALUES(18,"Matter Disruptor",1);
INSERT INTO TradingCard(gid,title,tid) VALUES(18,"Gun",2);
INSERT INTO TradingCard(gid,title,tid) VALUES(19,"Red Knight",1);
INSERT INTO TradingCard(gid,title,tid) VALUES(19,"Blue Knight",2);
INSERT INTO TradingCard(gid,title,tid) VALUES(20,"Puppet",1);
INSERT INTO TradingCard(gid,title,tid) VALUES(20,"Block",2);
--INSERT INTO Owns(uid,gid)
INSERT INTO Owns VALUES (1,1);
INSERT INTO Owns VALUES (1,2);
INSERT INTO Owns VALUES (1,4);
INSERT INTO Owns VALUES (1,6);
INSERT INTO Owns VALUES (1,8);
INSERT INTO Owns VALUES (1,10);
INSERT INTO Owns VALUES (1,12);
INSERT INTO Owns VALUES (1,14);
INSERT INTO Owns VALUES (1,15);
INSERT INTO Owns VALUES (1,18);
INSERT INTO Owns VALUES (1,19);
INSERT INTO Owns VALUES (2,1);
INSERT INTO Owns VALUES (2,2);
INSERT INTO Owns VALUES (2,3);
INSERT INTO Owns VALUES (2,5);
INSERT INTO Owns VALUES (2,8);
INSERT INTO Owns VALUES (2,13);
INSERT INTO Owns VALUES (2,14);
INSERT INTO Owns VALUES (2,15);
INSERT INTO Owns VALUES (2,16);
INSERT INTO Owns VALUES (2,17);
INSERT INTO Owns VALUES (3,1);
INSERT INTO Owns VALUES (3,2);
INSERT INTO Owns VALUES (3,3);
INSERT INTO Owns VALUES (3,5);
INSERT INTO Owns VALUES (3,7);
INSERT INTO Owns VALUES (3,9);
INSERT INTO Owns VALUES (3,11);
INSERT INTO Owns VALUES (3,13);
INSERT INTO Owns VALUES (3,15);
INSERT INTO Owns VALUES (3,18);
INSERT INTO Owns VALUES (3,19);
INSERT INTO Owns VALUES (3,20);
INSERT INTO Owns VALUES (4,2);
INSERT INTO Owns VALUES (4,3);
INSERT INTO Owns VALUES (4,4);
INSERT INTO Owns VALUES (4,5);
INSERT INTO Owns VALUES (4,8);
INSERT INTO Owns VALUES (4,9);
INSERT INTO Owns VALUES (4,11);
INSERT INTO Owns VALUES (4,15);
INSERT INTO Owns VALUES (4,16);
INSERT INTO Owns VALUES (4,18);
INSERT INTO Owns VALUES (4,19);
INSERT INTO Owns VALUES (5,1);
INSERT INTO Owns VALUES (5,5);
INSERT INTO Owns VALUES (5,8);
INSERT INTO Owns VALUES (5,9);
INSERT INTO Owns VALUES (5,10);
INSERT INTO Owns VALUES (5,11);
INSERT INTO Owns VALUES (5,12);
INSERT INTO Owns VALUES (5,13);
INSERT INTO Owns VALUES (5,18);
INSERT INTO Owns VALUES (6,4);
INSERT INTO Owns VALUES (6,5);
INSERT INTO Owns VALUES (6,6);
INSERT INTO Owns VALUES (7,4);
INSERT INTO Owns VALUES (7,6);
INSERT INTO Owns VALUES (7,10);
--INSERT INTO Collected(uid,tid,gid)
INSERT INTO Collected VALUES (1,1,1);
INSERT INTO Collected VALUES (1,2,2);
INSERT INTO Collected VALUES (1,3,6);
INSERT INTO Collected VALUES (1,2,8);
INSERT INTO Collected VALUES (1,3,10);
INSERT INTO Collected VALUES (2,1,1);
INSERT INTO Collected VALUES (2,1,2);
INSERT INTO Collected VALUES (2,3,5);
INSERT INTO Collected VALUES (2,2,8);
INSERT INTO Collected VALUES (2,1,13);
INSERT INTO Collected VALUES (3,2,1);
INSERT INTO Collected VALUES (3,2,2);
INSERT INTO Collected VALUES (3,1,5);
INSERT INTO Collected VALUES (3,3,7);
INSERT INTO Collected VALUES (3,2,9);
INSERT INTO Collected VALUES (3,1,11);
INSERT INTO Collected VALUES (3,3,13);
INSERT INTO Collected VALUES (4,1,2);
INSERT INTO Collected VALUES (4,2,4);
INSERT INTO Collected VALUES (4,3,5);
INSERT INTO Collected VALUES (4,2,8);
INSERT INTO Collected VALUES (4,3,9);
INSERT INTO Collected VALUES (5,1,1);
INSERT INTO Collected VALUES (5,2,5);
INSERT INTO Collected VALUES (5,3,6);
INSERT INTO Collected VALUES (5,3,13);
INSERT INTO Collected VALUES (5,1,18);
INSERT INTO Collected VALUES (6,2,4);
INSERT INTO Collected VALUES (6,3,5);
INSERT INTO Collected VALUES (6,2,6);
INSERT INTO Collected VALUES (7,2,4);
INSERT INTO Collected VALUES (7,2,6);
INSERT INTO Collected VALUES (7,3,10);
--INSERT INTO Earn(uid, gid, aid)
INSERT INTO Earn VALUES (1,1,1);
INSERT INTO Earn VALUES (1,2,2);
INSERT INTO Earn VALUES (1,4,3);
INSERT INTO Earn VALUES (1,6,1);
INSERT INTO Earn VALUES (1,6,2);
INSERT INTO Earn VALUES (1,8,3);
INSERT INTO Earn VALUES (1,10,2);
INSERT INTO Earn VALUES (2,1,1);
INSERT INTO Earn VALUES (2,2,2);
INSERT INTO Earn VALUES (2,5,2);
INSERT INTO Earn VALUES (2,5,3);
INSERT INTO Earn VALUES (2,8,1);
INSERT INTO Earn VALUES (2,8,2);
INSERT INTO Earn VALUES (2,13,1);
INSERT INTO Earn VALUES (3,2,1);
INSERT INTO Earn VALUES (3,5,3);
INSERT INTO Earn VALUES (3,7,1);
INSERT INTO Earn VALUES (3,9,2);
INSERT INTO Earn VALUES (3,11,2);
INSERT INTO Earn VALUES (3,13,2);
INSERT INTO Earn VALUES (4,2,1);
INSERT INTO Earn VALUES (4,4,3);
INSERT INTO Earn VALUES (4,11,1);
INSERT INTO Earn VALUES (4,15,2);
INSERT INTO Earn VALUES (4,16,1);
INSERT INTO Earn VALUES (4,18,1);
INSERT INTO Earn VALUES (4,18,2);
INSERT INTO Earn VALUES (4,19,1);
INSERT INTO Earn VALUES (5,1,2);
INSERT INTO Earn VALUES (5,5,3);
INSERT INTO Earn VALUES (5,9,1);
INSERT INTO Earn VALUES (5,10,2);
INSERT INTO Earn VALUES (5,11,3);
INSERT INTO Earn VALUES (5,18,1);
INSERT INTO Earn VALUES (6,4,2);
INSERT INTO Earn VALUES (6,5,3);
INSERT INTO Earn VALUES (6,6,1);
INSERT INTO Earn VALUES (7,4,2);
INSERT INTO Earn VALUES (7,6,3);
INSERT INTO Earn VALUES (7,10,2);
--INSERT INTO Friend(usid,fid)
INSERT INTO Friend VALUES(1,2);
INSERT INTO Friend VALUES(1,3);
INSERT INTO Friend VALUES(2,1);
INSERT INTO Friend VALUES(2,3);
INSERT INTO Friend VALUES(3,1);
INSERT INTO Friend VALUES(3,2);
INSERT INTO Friend VALUES(7,6);
INSERT INTO Friend VALUES(6,7);
INSERT INTO Friend VALUES(4,2);
INSERT INTO Friend VALUES(5,7);

COMMIT;