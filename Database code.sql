CREATE TABLE `retail_store`
(
    `store_name` varchar(50) PRIMARY KEY,
    `tel_number` varchar(50) NOT NULL,
    `postcode` varchar(50) NOT NULL unique,
    `region` varchar(50)NOT NULL,
    `address` varchar(100)NOT NULL unique
);

CREATE TABLE `store_management`
(
    `store_name` varchar(50)NOT NULL,
    `shopkeeper_ID` BIGINT(20)NOT NULL
);

CREATE TABLE `employee`
(
    `ID` BIGINT(20) NOT NULL PRIMARY KEY,
    `name` varchar(50)NOT NULL,
    `job` varchar(50)NOT NULL,
    `store_name` varchar(50)NOT NULL 
);

CREATE TABLE `job`
(
    `job_name` varchar(50) NOT NULL PRIMARY KEY,
    `description` varchar(200)NOT NULL
);

CREATE TABLE `work_record`
(
    `employee_ID` bigint(20)NOT NULL,
    `date` date NOT NULL,
    `arrive` boolean NOT NULL,
    `leave` boolean NOT NULL
);

CREATE TABLE `date_weekday`
(
    `date` date NOT NULL PRIMARY KEY,
    `weekday` varchar(50) NOT NULL
);

CREATE TABLE `game`
(
    `game_title` varchar(50) NOT NULL PRIMARY KEY,
    `genre` varchar(50)NOT NULL,
    `release_date` date NOT NULL,
    `age_rating` int(20) NOT NULL,
    `company_name` varchar(50) NOT NULL,
    `comments` varchar(400) NOT NULL
);

CREATE TABLE `CD_management`
(
    `serial_num` varchar(50) NOT NULL,
    `game_title` varchar(400) NOT NULL
);

CREATE TABLE `CD`
(
    `serial_num` varchar(50) NOT NULL PRIMARY KEY,
    `CD_title` varchar(50) NOT NULL
);


ALTER TABLE `store_management` ADD
CONSTRAINT fk_sm_rs FOREIGN KEY (`store_name`)
REFERENCES `retail_store` (`store_name`);

ALTER TABLE `store_management` ADD
CONSTRAINT fk_sm_employee FOREIGN KEY (`shopkeeper_ID`)
REFERENCES `employee` (`ID`);

ALTER TABLE `employee` ADD
CONSTRAINT fk_employee_job FOREIGN KEY (`job`)
REFERENCES `job` (`job_name`);

ALTER TABLE `employee` ADD
CONSTRAINT fk_employee_rs FOREIGN KEY (`store_name`)
REFERENCES `retail_store` (`store_name`);

ALTER TABLE `work_record` ADD
CONSTRAINT fk_wr_employee FOREIGN KEY (`employee_ID`)
REFERENCES `employee` (`ID`);

ALTER TABLE `work_record` ADD
CONSTRAINT fk_wr_dw FOREIGN KEY (`date`)
REFERENCES `date_weekday` (`date`);


ALTER TABLE `CD_management` ADD
CONSTRAINT fk_cm_cd FOREIGN KEY (`serial_num`)
REFERENCES `CD` (`serial_num`);

ALTER TABLE `CD_management` ADD
CONSTRAINT fk_cm_game FOREIGN KEY (`game_title`)
REFERENCES `game` (`game_title`);



insert into game
VALUES
("Counter-Strike: Global Offensive","action","2017-9-16",14,"Valve","A popular first person shooter game around the world"),
("Dota2","action","2013-7-10",10,"Valve",	"Dota is deep and evolving, and it's never too late to join"),
("Civilization VI",	"strategy"	,"2016-10-21",	8,	"Firaxis Games","Civilization is a turn-based strategy game where players try to build an empire and stand the rest of time."),
("NBA 2K21","simulation","2020-9-4",12,	"2K","NBA 2K21 is the latest title in the world-renowned best selling NBA 2K franchise."),
("The Witcher 3: Wild Hunt","role play"	,"2015-5-18",16,"CD PROJEKT RED","The Witcher is a plot-driven, open-world role-playing game."),
("Fall Guys: Ultimate Knockout","casual","2020-8-4",6,"Mediatonic","In the game, you will play a cute cheap Jelly Bean Man, online experience to participate in the excitement of the pass variety!"),
("Forza Horizon 4","racing","2021-3-10",8,"Playground Games","Race, stunt, create and explore: choose your own way to become a superstar on the horizon."),
("Mirror","adventure","2018-4-19",18,"KAGAMI WORKs","This is a beautiful girl + gem elimination +GALGAME combination of the game."),
("Among us","casual","2018-11-17",12,"Innersloth",	"Made friends from it and probably will lose them all because of it at some point.");



insert into cd
VALUES
("A1234","VintageFun 3 in 1 2019"),
("B567C","VintageFun 5 in 1 2020"),
("CF89E","VintageFun 4 in 1 2021"),
("D123G","Forza Horizon 4");



insert into cd_management
values
("A1234",	"Counter-Strike: Global Offensive"),
("A1234",	"Dota2"),
("A1234",	"The Witcher 3: Wild Hunt"),
("B567C",	"Civilization VI"),
("B567C",	"NBA 2K21"),
("B567C",	"Fall Guys: Ultimate Knockout"),
("B567C",	"Forza Horizon 4"),
("B567C",	"Mirror"),
("CF89E",	"Among us"),
("CF89E",	"The Witcher 3: Wild Hunt"),
("CF89E",	"Civilization VI"),
("CF89E",	"Counter-Strike: Global Offensive"),
("D123G",	"Forza Horizon 4");




insert into retail_store
VALUES
("VintageFun1",	"12345",	"LN12345",	"north",	"Oxiford Rd"),
("VintageFun2",	"23456",	"LS23456",	"south",	"Priory St"),
("VintageFun3",	"34567",	"LE34567",	"east",	"Aston St"),
("VintageFun4",	"45678",	"LW45678",	"west",	"Barrack Rd"),
("VintageFun5",	"56789",	"LC9ABCD",	"central",	"Old Hall Ln"),
("VintageFun6",	"67890",	"LNEF0G1",	"north",	"Booth St W"),
("VintageFun7",	"78901",	"LS23ABC",	"south",	"Deane Rd");



insert into job 
VALUES
("shopkeeper",	"To manage the shop"),
("sales staff",	"Do some daily work" ),
("shop cleaner",	"To keep the shop clean");




insert into employee 
values 
(123456789000,	"Alan", 	"shopkeeper",	"VintageFun1"),
(123456789001,	"Bob",	"shopkeeper",	"VintageFun2"),
(123456789002,	"Caven",	"shopkeeper",	"VintageFun3"),
(123456789003,	"Davi",	"shopkeeper",	"VintageFun4"),
(123456789004,	"Eurus",	"shopkeeper",	"VintageFun5"),
(123456789005,	"Fata",	"shopkeeper",	"VintageFun6"),
(123456789006,	"Guy",	"shopkeeper",	"VintageFun7"),
(123456789007,	"Halen",	"sales staff",	"VintageFun1"),
(123456789008,	"Iris",	"sales staff",	"VintageFun2"),
(123456789009,	"John",	"sales staff",	"VintageFun3"),
(123456789010,	"Kaven",	"sales staff",	"VintageFun4"),
(123456789011,	"Lily",	"sales staff",	"VintageFun5"),
(123456789012,	"Marry",	"sales staff",	"VintageFun6"),
(123456789013,	"Neo",	"sales staff",	"VintageFun7"),
(123456789014,	"Oli",	"shop cleaner",	"VintageFun1"),
(123456789015,	"Peter",	"shop cleaner",	"VintageFun2"),
(123456789016,	"Queen",	"shop cleaner",	"VintageFun3"),
(123456789017,	"Roly",	"shop cleaner",	"VintageFun4"),
(123456789018,	"Steven",	"shop cleaner",	"VintageFun5"),
(123456789019,	"Tylar",	"shop cleaner",	"VintageFun6"),
(123456789020,	"Ueli",	"shop cleaner",	"VintageFun7");

INSERT INTO date_weekday 
VALUES 
("2021-05-03", "Monday"), 
("2021-05-04", "Tuesday"), 
("2021-05-05", "Wednesday"), 
("2021-05-06", "Thursday"), 
("2021-05-07", "Friday"), 
("2021-05-10", "Monday"), 
("2021-05-11", "Tuesday"), 
("2021-05-12", "Wednesday"), 
("2021-05-13", "Thursday"), 
("2021-05-14", "Friday");

INSERT INTO work_record
VALUES
(123456789000, "2021-05-03", 1, 1),
(123456789000, "2021-05-04", 1, 1),
(123456789000, "2021-05-05", 1, 1),
(123456789000, "2021-05-06", 1, 1),
(123456789000, "2021-05-07", 1, 1),
(123456789001, "2021-05-05", 0, 0),
(123456789001, "2021-05-06", 1, 1),
(123456789001, "2021-05-07", 1, 1),
(123456789001, "2021-05-10", 1, 1),
(123456789001, "2021-05-12", 1, 1),
(123456789001, "2021-05-14", 1, 0),
(123456789002, "2021-05-05", 1, 1),
(123456789002, "2021-05-10", 1, 1),
(123456789002, "2021-05-07", 1, 0),
(123456789003, "2021-05-05", 1, 1),
(123456789003, "2021-05-06", 1, 1),
(123456789003, "2021-05-07", 1, 1),
(123456789003, "2021-05-10", 0, 0),
(123456789003, "2021-05-11", 1, 1),
(123456789003, "2021-05-12", 1, 1),
(123456789003, "2021-05-13", 1, 1),
(123456789003, "2021-05-14", 1, 1),
(123456789004, "2021-05-03", 1, 0),
(123456789004, "2021-05-04", 1, 1),
(123456789004, "2021-05-05", 1, 1),
(123456789004, "2021-05-06", 0, 1),
(123456789004, "2021-05-07", 0, 1),
(123456789004, "2021-05-11", 1, 1),
(123456789004, "2021-05-12", 1, 1),
(123456789004, "2021-05-13", 0, 1),
(123456789005, "2021-05-03", 0, 1),
(123456789005, "2021-05-04", 1, 1),
(123456789005, "2021-05-05", 1, 1),
(123456789005, "2021-05-07", 1, 1),
(123456789005, "2021-05-10", 1, 1),
(123456789005, "2021-05-11", 1, 1),
(123456789005, "2021-05-12", 1, 1),
(123456789005, "2021-05-13", 0, 1),
(123456789006, "2021-05-03", 1, 1),
(123456789006, "2021-05-05", 1, 1),
(123456789006, "2021-05-07", 1, 1),
(123456789006, "2021-05-10", 1, 1),
(123456789006, "2021-05-12", 1, 1),
(123456789006, "2021-05-14", 1, 1),
(123456789007, "2021-05-03", 1, 1),
(123456789007, "2021-05-04", 1, 1),
(123456789007, "2021-05-05", 0, 1),
(123456789007, "2021-05-06", 1, 1),
(123456789007, "2021-05-07", 1, 0),
(123456789007, "2021-05-10", 1, 1),
(123456789007, "2021-05-11", 1, 1),
(123456789007, "2021-05-12", 1, 1),
(123456789007, "2021-05-13", 1, 1),
(123456789008, "2021-05-03", 1, 1),
(123456789008, "2021-05-04", 1, 1),
(123456789008, "2021-05-05", 1, 1),
(123456789008, "2021-05-06", 1, 1),
(123456789008, "2021-05-07", 1, 0),
(123456789008, "2021-05-10", 1, 1),
(123456789008, "2021-05-11", 1, 1),
(123456789008, "2021-05-12", 1, 1),
(123456789008, "2021-05-13", 1, 1),
(123456789008, "2021-05-14", 1, 0),
(123456789009, "2021-05-03", 1, 1),
(123456789009, "2021-05-04", 1, 1),
(123456789009, "2021-05-05", 1, 1),
(123456789009, "2021-05-06", 1, 1),
(123456789009, "2021-05-07", 1, 1),
(123456789009, "2021-05-10", 1, 1),
(123456789009, "2021-05-11", 1, 1),
(123456789009, "2021-05-12", 1, 1),
(123456789009, "2021-05-13", 1, 1),
(123456789009, "2021-05-14", 1, 1),
(123456789010, "2021-05-03", 1, 0),
(123456789010, "2021-05-04", 0, 1),
(123456789010, "2021-05-05", 1, 1),
(123456789010, "2021-05-06", 1, 1),
(123456789010, "2021-05-07", 1, 1),
(123456789010, "2021-05-10", 1, 1),
(123456789010, "2021-05-11", 1, 1),
(123456789010, "2021-05-12", 1, 1),
(123456789010, "2021-05-13", 1, 1),
(123456789010, "2021-05-14", 1, 1),
(123456789011, "2021-05-03", 0, 1),
(123456789011, "2021-05-04", 1, 1),
(123456789011, "2021-05-05", 1, 1),
(123456789011, "2021-05-06", 1, 1),
(123456789011, "2021-05-07", 1, 1),
(123456789011, "2021-05-10", 1, 1),
(123456789011, "2021-05-11", 1, 1),
(123456789011, "2021-05-12", 1, 1),
(123456789011, "2021-05-13", 1, 1),
(123456789011, "2021-05-14", 0, 1),
(123456789012, "2021-05-04", 1, 1),
(123456789012, "2021-05-05", 1, 1),
(123456789012, "2021-05-06", 0, 1),
(123456789012, "2021-05-10", 0, 1),
(123456789012, "2021-05-11", 0, 0),
(123456789013, "2021-05-03", 1, 1),
(123456789013, "2021-05-04", 0, 1),
(123456789013, "2021-05-05", 1, 1),
(123456789013, "2021-05-06", 1, 1),
(123456789013, "2021-05-07", 1, 1),
(123456789013, "2021-05-10", 1, 1),
(123456789013, "2021-05-11", 1, 1),
(123456789013, "2021-05-12", 1, 1),
(123456789013, "2021-05-13", 1, 1),
(123456789013, "2021-05-14", 1, 1),
(123456789014, "2021-05-03", 1, 0),
(123456789014, "2021-05-04", 1, 0),
(123456789014, "2021-05-05", 1, 0),
(123456789014, "2021-05-06", 1, 1),
(123456789014, "2021-05-07", 1, 1),
(123456789014, "2021-05-10", 1, 1),
(123456789014, "2021-05-11", 1, 1),
(123456789014, "2021-05-12", 1, 1),
(123456789014, "2021-05-13", 1, 1),
(123456789015, "2021-05-10", 1, 1),
(123456789015, "2021-05-11", 1, 1),
(123456789015, "2021-05-12", 1, 1),
(123456789015, "2021-05-13", 1, 1),
(123456789015, "2021-05-14", 1, 1),
(123456789016, "2021-05-06", 1, 1),
(123456789016, "2021-05-06", 1, 1),
(123456789016, "2021-05-06", 1, 1),
(123456789016, "2021-05-06", 1, 1),
(123456789016, "2021-05-06", 1, 1),
(123456789016, "2021-05-06", 1, 1),
(123456789016, "2021-05-06", 1, 1),
(123456789016, "2021-05-06", 1, 1),
(123456789017, "2021-05-03", 1, 1),
(123456789017, "2021-05-04", 1, 1),
(123456789017, "2021-05-05", 1, 1),
(123456789017, "2021-05-06", 1, 1),
(123456789017, "2021-05-07", 0, 1),
(123456789017, "2021-05-10", 1, 1),
(123456789017, "2021-05-11", 1, 1),
(123456789017, "2021-05-12", 1, 1),
(123456789017, "2021-05-13", 1, 1),
(123456789017, "2021-05-14", 1, 1),
(123456789018, "2021-05-03", 1, 1),
(123456789018, "2021-05-04", 1, 1),
(123456789018, "2021-05-05", 1, 1),
(123456789018, "2021-05-06", 1, 1),
(123456789018, "2021-05-07", 0, 0),
(123456789018, "2021-05-10", 0, 0),
(123456789018, "2021-05-11", 1, 1),
(123456789018, "2021-05-12", 1, 1),
(123456789018, "2021-05-13", 1, 1),
(123456789018, "2021-05-14", 1, 1),
(123456789019, "2021-05-03", 0, 1),
(123456789019, "2021-05-04", 1, 1),
(123456789019, "2021-05-05", 0, 0),
(123456789019, "2021-05-06", 1, 1),
(123456789019, "2021-05-07", 1, 1),
(123456789019, "2021-05-10", 1, 1),
(123456789019, "2021-05-11", 1, 1),
(123456789019, "2021-05-12", 1, 0),
(123456789020, "2021-05-03", 0, 1),
(123456789020, "2021-05-04", 0, 1),
(123456789020, "2021-05-05", 1, 1),
(123456789020, "2021-05-06", 1, 1),
(123456789020, "2021-05-07", 1, 1),
(123456789020, "2021-05-10", 1, 1),
(123456789020, "2021-05-11", 1, 1),
(123456789020, "2021-05-12", 1, 0),
(123456789020, "2021-05-13", 1, 1);




INSERT INTO store_management 
VALUES 
("VintageFun1", 123456789000), 
("VintageFun2", 123456789001), 
("VintageFun3", 123456789002), 
("VintageFun4", 123456789003), 
("VintageFun5", 123456789004), 
("VintageFun6", 123456789005), 
("VintageFun7", 123456789006) ;



