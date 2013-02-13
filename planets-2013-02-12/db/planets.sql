create table planets (
  id serial4 primary key,
  image text,
  name varchar(255),
  orbit float8,
  diameter float8,
  mass float8,
  moons smallint
);
