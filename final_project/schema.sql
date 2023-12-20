CREATE TABLE "teams" (
  "id" integer PRIMARY KEY,
  "name" text NOT NULL,
  "mascot" text NOT NULL,
  "conference_id" integer NOT NULL,
  FOREIGN KEY("conference_id") REFERENCES "conferences"("id")
);

CREATE TABLE "schools" (
  "id" integer PRIMARY KEY,
  "name" text NOT NULL,
  "location" text NOT NULL,
  "team_id" integer NOT NULL,
  FOREIGN KEY("team_id") REFERENCES "teams"("id")
);

CREATE TABLE "conferences" (
  "id" integer PRIMARY KEY,
  "name" text NOT NULL
);

CREATE TABLE "players" (
  "id" integer PRIMARY KEY,
  "first_name" text NOT NULL,
  "last_name" text NOT NULL,
  "hometown" text NOT NULL,
  "grad_year" integer NOT NULL,
  "school_id" integer NOT NULL,
  FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

CREATE TABLE "seasons" (
  "id" integer PRIMARY KEY,
  "year" integer NOT NULL
);

CREATE TABLE "player_stats" (
  "id" integer PRIMARY KEY,
  "player_id" integer NOT NULL,
  "season_id" integer NOT NULL,
  "points" integer,
  "rebounds" integer,
  "assists" integer,
  FOREIGN KEY("player_id") REFERENCES "players"("id"),
  FOREIGN KEY("season_id") REFERENCES "seasons"("id")
);

CREATE TABLE "team_stats" (
  "id" integer PRIMARY KEY,
  "team_id" integer NOT NULL,
  "season_id" integer NOT NULL,
  "points" integer NOT NULL,
  "rebounds" integer NOT NULL,
  FOREIGN KEY("team_id") REFERENCES "teams"("id"),
  FOREIGN KEY("season_id") REFERENCES "seasons"("id")
);
