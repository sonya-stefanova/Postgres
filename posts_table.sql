CREATE TABLE posts (
	id SERIAL PRIMARY KEY,
  	created_at TIMESTAMP with time zone default CURRENT_TIMESTAMP,
  	updated_at TIMESTAMP with time zone default CURRENT_TIMESTAMP,
  	url VARCHAR (200) NOT NULL,
  	caption VARCHAR (250),
  	lat REAL CHECK(lat IS NULL OR (lat>=-90 and lat <=90)), 
  	long REAL CHECK(lat IS NULL OR (lat>=-90 and lat <=90)),
	user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE
);
