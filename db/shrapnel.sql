DROP TABLE budgets;
DROP TABLE transactions;
DROP TABLE vendors;
DROP TABLE tags;


CREATE TABLE tags
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE budgets
(
  id SERIAL8 PRIMARY KEY,
  tag_id INT8 references tags(id) ON DELETE CASCADE,
  maxspend VARCHAR(255)
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
  tag_id INT8 references tags(id) ON DELETE CASCADE,
  vendor_id INT8 references vendors(id) ON DELETE CASCADE,
  time TIMESTAMP
);

