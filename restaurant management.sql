CREATE TABLE address
(
  A_id INT(10) NOT NULL,
  city varchar(45) NOT NULL,
  post_code INT(10) NOT NULL,
  road varchar(45) NOT NULL,
  house varchar(45) NOT NULL,
  PRIMARY KEY (A_id)
);

CREATE TABLE Discount
(
  d_id INT(10) NOT NULL,
  Cust_status varchar(45) NOT NULL,
  PRIMARY KEY (d_id)
);

CREATE TABLE Customer_Rank
(
  Platinum varchar(45) NOT NULL,
  Golden varchar(45) NOT NULL,
  R_ID INT(10) NOT NULL,
  regular varchar(45) NOT NULL,
  d_id INT(10) NOT NULL,
  PRIMARY KEY (R_ID),
  FOREIGN KEY (d_id) REFERENCES Discount(d_id)
);

CREATE TABLE employee
(
  empid INT(10) NOT NULL,
  name varchar(45) NOT NULL,
  salary numeric(10,2) NOT NULL,
  status varchar(45) NOT NULL,
  address varchar(45) NOT NULL,
  A_id INT(10) NOT NULL,
  PRIMARY KEY (empid),
  FOREIGN KEY (A_id) REFERENCES address(A_id)
);

CREATE TABLE Customer
(
  ID INT(10) NOT NULL,
  U_Name varchar(45) NOT NULL,
  status varchar(45) NOT NULL,
  email varchar(45) NOT NULL,
  City varchar(45) NOT NULL,
  street varchar(45) NOT NULL,
  postcode INT(10) NOT NULL,
  R_ID INT(10) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (R_ID) REFERENCES Customer_Rank(R_ID)
);

CREATE TABLE delivery_boy
(
  ID INT(10) NOT NULL,
  Area_code varchar(45) NOT NULL,
  name varchar(45) NOT NULL,
  A_id INT(10) NOT NULL,
  empid INT(10) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (A_id) REFERENCES address(A_id),
  FOREIGN KEY (empid) REFERENCES employee(empid)
);

CREATE TABLE payment
(
  card INT(10) NOT NULL,
  p_id INT(10) NOT NULL,
  bkash INT(10) NOT NULL,
  d_id INT(10) NOT NULL,
  PRIMARY KEY (p_id),
  FOREIGN KEY (d_id) REFERENCES Discount(d_id)
);

CREATE TABLE Customer_phone
(
  phone varchar(45) NOT NULL,
  ID INT(10) NOT NULL,
  PRIMARY KEY (phone, ID),
  FOREIGN KEY (ID) REFERENCES Customer(ID)
);

CREATE TABLE order_item
(
  O_date DATE NOT NULL,
  Del_status varchar(45) NOT NULL,
  O_time TIME NOT NULL,
  cust_id INT NOT NULL,
  Tot_parchase INT(10) NOT NULL,
  ID INT NOT NULL,
  A_id INT NOT NULL,
  p_id INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (A_id) REFERENCES address(A_id),
  FOREIGN KEY (p_id) REFERENCES payment(p_id)
);

CREATE TABLE item
(
  Item_name varchar(45) NOT NULL,
  item_id INT(10) NOT NULL,
  price INT(10) NOT NULL,
  description varchar(45) NOT NULL,
  ID INT(10) NOT NULL,
  PRIMARY KEY (item_id),
  FOREIGN KEY (ID) REFERENCES order(ID)
);