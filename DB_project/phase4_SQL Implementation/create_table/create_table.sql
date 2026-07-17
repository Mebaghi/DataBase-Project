create table co_clerk
(id int primary key,
birthdate date,
education nvarchar(100),
experience nvarchar(100),
children_num smallint);

create  table Co_Project(
proj_id int primary key,
proj_name nvarchar(100),
score int, 
deadline date,  
finished_projects nvarchar(100),
unfinished_projects nvarchar(100));


create table projec_manager (
id int primary key,
proj_id int,
finished_projects_num int,
FOREIGN KEY (proj_id) REFERENCES Co_Project(proj_id));

create table Company(
branch_id int primary key,
company_name nvarchar(100));


create table company_manager(
id int primary key, 
branch_id int, 
company_role nvarchar(100),
date_start date,
foreign key(branch_id) references Company(branch_id));

create table Co_Team(
team_id int primary key,
score int,
member_num int,
team_name nvarchar(100),
proj_id int,
foreign key(proj_id) references Co_Project(proj_id));

create table team_manager(
id int primary key,
team_id int, 
date_start date,
foreign key(team_id) references Co_Team(team_id));

create table team_members(
id int primary key,
team_id int,
mem_role nvarchar(100),
foreign key(team_id) references Co_Team(team_id));

create table phone_number(
id int primary key,
phone_num bigint,
foreign key(id) references co_clerk(id));

create table defines(
team_id int,
proj_id int,
foreign key(team_id) references Co_Team(team_id),
foreign key(proj_id) references Co_Project(proj_id));

create table co_address(
branch_id int  primary key,
company_address nvarchar(100),
foreign key(branch_id) references Company(branch_id));
