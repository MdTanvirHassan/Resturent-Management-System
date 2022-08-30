CREATE TABLE Delivery_boy
(
  D_ID INT NOT NULL,
  name VARCHAR(64) NOT NULL,
  DArea_code INT NOT NULL,
  Phone INT NOT NULL,
  salary NUMERIC(8,2) NOT NULL,
  PRIMARY KEY (D_ID, DArea_code)
);

CREATE TABLE Address
(
  A_ID INT NOT NULL,
  Postcode INT NOT NULL,
  City VARCHAR(64) NOT NULL,
  house_no INT NOT NULL,
  road_no INT NOT NULL,
  Area_code INT NOT NULL,
  D_ID INT NOT NULL,
  DArea_code INT NOT NULL,
  PRIMARY KEY (A_ID, Postcode, Area_code),
  FOREIGN KEY (D_ID, DArea_code) REFERENCES Delivery_boy(D_ID, DArea_code),
  UNIQUE (City)
);

CREATE TABLE discount
(
  Offer_Id INT NOT NULL,
  status VARCHAR(64) NOT NULL,
  PRIMARY KEY (Offer_Id)
);

CREATE TABLE Customer_Rank
(
  R_ID INT NOT NULL,
  Regular INT NOT NULL,
  golden INT NOT NULL,
  platinum INT NOT NULL,
  Offer_Id INT NOT NULL,
  PRIMARY KEY (R_ID, Offer_Id),
  FOREIGN KEY (Offer_Id) REFERENCES discount(Offer_Id)
);

CREATE TABLE Customer
(
  ID INT NOT NULL,
  Name VARCHAR(64) NOT NULL,
  Email VARCHAR(64) NOT NULL,
  City VARCHAR(64) NOT NULL,
  post_code INT NOT NULL,
  CA_id INT NOT NULL,
  street VARCHAR(64) NOT NULL,
  CArea_code INT NOT NULL,
  R_ID INT NOT NULL,
  Offer_Id INT NOT NULL,
  PRIMARY KEY (ID, post_code, CA_id, CArea_code, R_ID, Offer_Id),
  FOREIGN KEY (R_ID, Offer_Id) REFERENCES Customer_Rank(R_ID, Offer_Id)
);

CREATE TABLE Employee
(
  emp_id INT NOT NULL,
  emp_name VARCHAR(64) NOT NULL,
  phone INT NOT NULL,
  Adress VARCHAR(64) NOT NULL,
  salary NUMERIC(10,2) NOT NULL,
  A_ID INT NOT NULL,
  Postcode INT NOT NULL,
  Area_code INT NOT NULL,
  D_ID INT NOT NULL,
  DArea_code INT NOT NULL,
  PRIMARY KEY (emp_id),
  FOREIGN KEY (A_ID, Postcode, Area_code) REFERENCES Address(A_ID, Postcode, Area_code),
  FOREIGN KEY (D_ID, DArea_code) REFERENCES Delivery_boy(D_ID, DArea_code)
);

CREATE TABLE Payment
(
  P_ID INT NOT NULL,
  Card VARCHAR(64) NOT NULL,
  bkash INT NOT NULL,
  Offer_Id INT NOT NULL,
  PRIMARY KEY (P_ID),
  FOREIGN KEY (Offer_Id) REFERENCES discount(Offer_Id)
);

CREATE TABLE Customer_Phone
(
  Phone INT NOT NULL,
  ID INT NOT NULL,
  post_code INT NOT NULL,
  A_id INT NOT NULL,
  CArea_code INT NOT NULL,
  R_ID INT NOT NULL,
  Offer_Id INT NOT NULL,
  PRIMARY KEY (Phone),
  FOREIGN KEY (ID, post_code, A_id, CArea_code, R_ID, Offer_Id) REFERENCES Customer(ID, post_code, CA_id, CArea_code, R_ID, Offer_Id)
);

CREATE TABLE Orders
(
  O_ID INT NOT NULL,
  O__time INT NOT NULL,
  O__date INT NOT NULL,
  Total_parchase INT NOT NULL,
  Customer__id INT NOT NULL,
  Del_status VARCHAR(64) NOT NULL,
  CR_ID INT NOT NULL,
  C_ID INT NOT NULL,
  post_code INT NOT NULL,
  CA_id INT NOT NULL,
  CArea_code INT NOT NULL,
  R_ID INT NOT NULL,
  Offer_Id INT NOT NULL,
  P_ID INT NOT NULL,
  D_ID INT NOT NULL,
  DArea_code INT NOT NULL,
  A_ID INT NOT NULL,
  Postcode INT NOT NULL,
  Area_code INT NOT NULL,
  PRIMARY KEY (O_ID, Customer__id, CR_ID, C_ID, post_code, CA_id, CArea_code, R_ID, Offer_Id, P_ID, D_ID, DArea_code),
  FOREIGN KEY (C_ID, post_code, CA_id, CArea_code, R_ID, Offer_Id) REFERENCES Customer(ID, post_code, CA_id, CArea_code, R_ID, Offer_Id),
  FOREIGN KEY (P_ID) REFERENCES Payment(P_ID),
  FOREIGN KEY (D_ID, DArea_code) REFERENCES Delivery_boy(D_ID, DArea_code),
  FOREIGN KEY (A_ID, Postcode, Area_code) REFERENCES Address(A_ID, Postcode, Area_code)
);

CREATE TABLE Food_Item
(
  Item_ID INT NOT NULL,
  Item_name VARCHAR(64) NOT NULL,
  price NUMERIC(8,2) NOT NULL,
  Description VARCHAR(64) NOT NULL,
  Rating NUMERIC(3,1) NOT NULL,
  O_ID INT NOT NULL,
  Customer__id INT NOT NULL,
  CR_ID INT NOT NULL,
  C_ID INT NOT NULL,
  post_code INT NOT NULL,
  CA_id INT NOT NULL,
  CArea_code INT NOT NULL,
  R_ID INT NOT NULL,
  Offer_Id INT NOT NULL,
  P_ID INT NOT NULL,
  D_ID INT NOT NULL,
  DArea_code INT NOT NULL,
  PRIMARY KEY (Item_ID, Item_name),
  FOREIGN KEY (O_ID, Customer__id, CR_ID, C_ID, post_code, CA_id, CArea_code, R_ID, Offer_Id, P_ID, D_ID, DArea_code) REFERENCES Orders(O_ID, Customer__id, CR_ID, C_ID, post_code, CA_id, CArea_code, R_ID, Offer_Id, P_ID, D_ID, DArea_code)
);