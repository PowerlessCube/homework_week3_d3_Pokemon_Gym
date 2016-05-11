
DROP TABLE gyms CASCADE;
DROP TABLE trainers CASCADE;
DROP TABLE pokemons;

CREATE TABLE gyms (
  id SERIAL4 primary key,
  name VARCHAR(255),
  city VARCHAR(255),
  leader VARCHAR(255)
);

CREATE TABLE trainers (
  id SERIAL4 primary key,
  name VARCHAR(255),
  discipline VARCHAR(255),
  city VARCHAR(255),
  gym_id INT4 references gyms( id ) ON DELETE CASCADE
);

CREATE TABLE pokemons (
  id SERIAL4 primary key,
  name VARCHAR(255),
  type_one VARCHAR(255),
  trainer_id INT4 references trainers( id ) ON DELETE CASCADE
);
