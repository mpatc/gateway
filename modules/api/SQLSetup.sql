-- delete existing tables from the database
drop table if exists users;
drop table if exists payments;
drop table if exists pending;

-- create new users table
create table if not exists users (
  userID int auto_increment primary key,
  payoutAddress varchar(60),
  totalSales int(15),
  created timestamp default current_timestamp,
  merchantID varchar(16),
  password varchar(256),
  salt varchar(256),
  username varchar(24)
);

-- create new payments table
create table if not exists payments (
  paymentIndex int auto_increment primary key,
  paymentAddress varchar(60),
  paidAmount varchar(15),
  created timestamp default current_timestamp,
  paymentID varchar(32),
  merchantID varchar(16),
  paymentKey varchar(80),
  paymentTXID varchar(64),
  transferTXID varchar(64),
  callbackURL varchar(128)
);

-- create new pending table
CREATE table if not exists pending (
  created timestamp default current_timestamp,
  address varchar(60),
  txid varchar(64)
);

-- create a test user
insert into users (
  userID,
  merchantID,
  password,
  salt,
  username
) values (
  1,
  "deadbeef20181111",
  "b4f9fe7fb85b0d835881c007c89743034794d6d5860e41c3e3946dc9648bfa5e",
  "d8245dbc8c67cf0f849e9b5c73122bed3f84207852091f70f4fa2a12923a5700",
  "gwtestuser1"
)
