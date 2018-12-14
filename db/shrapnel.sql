DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE vendors;


CREATE TABLE tags
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE vendors
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions
(
  id SERIAL8 PRIMARY KEY,
  amount DECIMAL,
  tag_id INT8 references tags(id) ON DELETE SET NULL,
  vendor_id INT8 references vendors(id) ON DELETE SET NULL,
  time TIMESTAMP
);

