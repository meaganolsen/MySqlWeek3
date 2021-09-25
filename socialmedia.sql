create database if not exists social_media;

use social_media;

drop table if exists comments;
drop table if exists posts;
drop table if exists users;

create table users(
		id int(15) not null auto_increment,
		username varchar(15)not null,
		password varchar(15)not null,
		email varchar(20) not null,
		first_name varchar(20) not null,
		last_name varchar(20) not null,
		primary key(id)
);

create table posts(
		id int(10) not null auto_increment,
		user_id int(15) not null,
		post longtext not null,
		post_time datetime default current_timestamp,
		primary key(id),
		foreign key(user_id) references users(id)
);

create table comments(
		post_id int(10) not null,
		user_id int(15) not null,
		comment longtext not null,
		comment_time datetime default current_timestamp,
		primary key(post_id,user_id),
		foreign key(post_id) references posts(id),
		foreign key(user_id) references users(id)
);

