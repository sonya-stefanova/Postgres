CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "username" VARCHAR(50),
  "bio" VARCHAR(400),
  "avatar" VARCHAR(200),
  "phone" VARCHAR(30),
  "email" VARCHAR(40),
  "password" VARCHAR(20),
  "status" VARCHAR(15)
);

CREATE TABLE "posts" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "url" VARCHAR(200),
  "caption" VARCHAR(250),
  "lat" REAL,
  "long" REAL
);

CREATE TABLE "comments" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "content" text,
  "user_id" INTEGER,
  "post_id" INTEGER
);

CREATE TABLE "Likes" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "user_id" INTEGER,
  "post_id" INTEGER,
  "comment_id" INTEGER
);

CREATE TABLE "photo_tags" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "post_id" INTEGER,
  "user_id" INTEGER,
  "x" integer,
  "y" integer
);

CREATE TABLE "caption_tags" (
  "id" SERIAL PRIMARY KEY,
  "created_at" TIMESTAMP,
  "post_id" INTEGER,
  "user_id" INTEGER
);

CREATE TABLE "hashtags" (
  "id" SERIAL PRIMARY KEY,
  "created_at" TIMESTAMP,
  "title" VARCHAR
);

CREATE TABLE "hashtags_posts" (
  "id" SERIAL PRIMARY KEY,
  "hashtag_id" INTEGER,
  "post_id" INTEGER
);

CREATE TABLE "followers" (
  "id" SERIAL PRIMARY KEY,
  "created_at" TIMESTAMP,
  "user_id" INTEGER,
  "follower_id" INTEGER
);

ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "Likes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "Likes" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "Likes" ADD FOREIGN KEY ("comment_id") REFERENCES "comments" ("id");

ALTER TABLE "photo_tags" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "photo_tags" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "caption_tags" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "caption_tags" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "hashtags_posts" ADD FOREIGN KEY ("hashtag_id") REFERENCES "hashtags" ("id");

ALTER TABLE "hashtags_posts" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "followers" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "followers" ADD FOREIGN KEY ("follower_id") REFERENCES "users" ("id");
