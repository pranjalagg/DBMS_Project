
DROP DATABASE IF EXISTS VEHICLE_INSURANCE;
CREATE DATABASE IF NOT EXISTS VEHICLE_INSURANCE;
-- USE vehicleinsurance;
USE  VEHICLE_INSURANCE;

CREATE TABLE T11_INCIDENT
(
T11_Incident_Id VARCHAR(20) NOT NULL ,
T11_Incident_Type VARCHAR(30) NULL ,
T11_Incident_Date DATE NOT NULL ,
T11_Description VARCHAR(1000) NULL ,
CONSTRAINT XPKINCIDENT_17 PRIMARY KEY (T11_Incident_Id)
);

CREATE UNIQUE INDEX XPKINCIDENT_17 ON T11_INCIDENT
(T11_Incident_Id ASC);

CREATE TABLE T11_CUSTOMER
(
T11_Cust_Id INTEGER NOT NULL ,
T11_Cust_FName VARCHAR(20) NOT NULL ,
T11_Cust_LName VARCHAR(20) NOT NULL ,
T11_Cust_DOB DATE NOT NULL ,
T11_Cust_Gender CHAR(2) NOT NULL ,
T11_Cust_Address VARCHAR(20) NOT NULL ,
T11_Cust_MOB_Number bigint NOT NULL ,
T11_Cust_Email VARCHAR(100) NULL ,
T11_Cust_Passport_Number VARCHAR(20)  NULL ,
T11_Cust_Marital_Status CHAR(8) NULL ,
T11_Cust_PPS_Number INTEGER NULL ,
CONSTRAINT XPKCUSTOMER_1 PRIMARY KEY (T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKCUSTOMER_1 ON T11_CUSTOMER
(T11_Cust_Id ASC);




CREATE TABLE T11_INCIDENT_REPORT
( 
T11_Incident_Report_Id VARCHAR(20) NOT NULL ,

T11_Incident_Type CHAR(30) NULL , 
T11_Incident_Inspector VARCHAR(20) NULL ,
T11_Incident_Report_Date DATETIME NOT NULL, 
T11_Incident_Cost INTEGER NULL , 
T11_Incident_Report_Description VARCHAR(100) NULL , 
CONSTRAINT XPKINCIDENT_REPORT_18 PRIMARY KEY (T11_Incident_Report_Id)
);

CREATE TABLE T11_CUSTOMER_INCIDENT_INCIDENT_REPORT (
	T11_Incident_Report_Id VARCHAR(20) NOT NULL,
    T11_Incident_Id VARCHAR(20) NOT NULL ,
    T11_Cust_Id INTEGER NOT NULL ,
    CONSTRAINT XPKINCIDENT_11_REPORT_18 PRIMARY KEY (T11_Incident_Report_Id,T11_Incident_Id,T11_Cust_Id),
    CONSTRAINT R_83 FOREIGN KEY (T11_Incident_Id) REFERENCES T11_INCIDENT (T11_Incident_Id),
    CONSTRAINT R_86 FOREIGN KEY (T11_Cust_Id) REFERENCES T11_CUSTOMER (T11_Cust_Id),
    CONSTRAINT R_820 FOREIGN KEY (T11_Incident_Report_Id) REFERENCES T11_INCIDENT_REPORT (T11_Incident_Report_Id)
);

CREATE UNIQUE INDEX XPKINCIDENT_REPORT_18 ON T11_INCIDENT_REPORT (T11_Incident_Report_Id ASC);



CREATE TABLE T11_INSURANCE_COMPANY
(
T11_Company_Name	VARCHAR(100) NOT NULL ,
T11_Company_Address	VARCHAR(300) NULL ,
T11_Company_Contact_Number BIGINT NULL ,
T11_Company_Fax	BIGINT NULL ,
T11_Company_Email	VARCHAR(100) NULL ,
T11_Company_Website	VARCHAR(100) NULL ,
-- T11_Company_Location	VARCHAR(100) NULL ,
-- T11_Company_Department_Name VARCHAR(100) NULL , 
T11_Company_Office_Name VARCHAR(100) NULL ,
CONSTRAINT XPKINSURANCE_COMPANY_15 PRIMARY KEY
(T11_Company_Name)
);



CREATE UNIQUE INDEX XPKINSURANCE_COMPANY_15 ON T11_INSURANCE_COMPANY
(T11_Company_Name ASC);

CREATE TABLE T11_DEPARTMENT (
-- T11_Department_Name	VARCHAR(100) NOT NULL , 
T11_Department_ID CHAR(18) NOT NULL , 
T11_Department_Staff VARCHAR(100) NULL , 
T11_Department_Offices VARCHAR(100) NULL , 
T11_Company_Name VARCHAR(100) NOT NULL ,
CONSTRAINT XPKDEPARTMENT PRIMARY KEY(T11_Department_ID,T11_Company_Name),
CONSTRAINT R_56 FOREIGN KEY (T11_Company_Name) REFERENCES T11_INSURANCE_COMPANY (T11_Company_Name)
);

CREATE TABLE T11_DEPARTMENT_NAME_ID(
	
T11_Department_Name	VARCHAR(100) NOT NULL , 
T11_Department_ID CHAR(18) NOT NULL ,
CONSTRAINT XPKDEPARTMENT11 PRIMARY KEY(T11_Department_ID,T11_Department_Name)
);



CREATE UNIQUE INDEX XPKDEPARTMENT ON T11_DEPARTMENT
(T11_Department_ID ASC,T11_Company_Name ASC);

CREATE TABLE T11_VEHICLE_SERVICE (
T11_Department_Name	VARCHAR(100) NOT NULL , 
T11_Vehicle_Service_Company_Name VARCHAR(100) NOT NULL , 
T11_Vehicle_Service_Address VARCHAR(100) NULL , 
T11_Vehicle_Service_Contact VARCHAR(100) NULL ,
T11_Vehicle_Service_Incharge VARCHAR(100) NULL , 
T11_Vehicle_Service_Type VARCHAR(100) NULL ,
-- Department_Id VARCHAR(20) NOT NULL , 
T11_Company_Name VARCHAR(100) NOT NULL ,
CONSTRAINT XPKVEHICLE_SERVICE PRIMARY KEY (T11_Vehicle_Service_Company_Name,T11_Department_Name),
CONSTRAINT R_50 FOREIGN KEY (T11_Department_Name, T11_Company_Name) REFERENCES T11_DEPARTMENT (T11_Department_Name, T11_Company_Name)
);

CREATE UNIQUE INDEX XPKVEHICLE_SERVICE ON T11_VEHICLE_SERVICE
(T11_Vehicle_Service_Company_Name ASC,T11_Department_Name ASC);

CREATE TABLE T11_VEHICLE (
T11_Vehicle_Id VARCHAR(20) NOT NULL , 
T11_Policy_Id VARCHAR(20) NULL ,
T11_Vehicle_Registration_Number VARCHAR(20) NOT NULL , 
T11_Vehicle_Value INTEGER NULL ,
T11_Vehicle_Type VARCHAR(20) NOT NULL , 
T11_Vehicle_Size INTEGER NULL , 
T11_Vehicle_Number_Of_Seat INTEGER NULL , 
T11_Vehicle_Manufacturer VARCHAR(20) NULL , 
T11_Vehicle_Engine_Number INTEGER NULL , 
T11_Vehicle_Chasis_Number INTEGER NULL , 
T11_Vehicle_Number INTEGER NULL , 
T11_Vehicle_Model_Number VARCHAR(20) NULL , 
T11_Cust_Id	INTEGER NOT NULL ,
CONSTRAINT XPKVEHICLE_6 PRIMARY KEY (T11_Vehicle_Id,T11_Cust_Id),
CONSTRAINT R_92 FOREIGN KEY (T11_Cust_Id) REFERENCES T11_CUSTOMER(T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKVEHICLE_6 ON T11_VEHICLE(T11_Vehicle_Id ASC,T11_Cust_Id ASC);

CREATE TABLE T11_PREMIUM_PAYMENT (
T11_Premium_Payment_Id VARCHAR(20) NOT NULL , 
T11_Policy_Number VARCHAR(20) NOT NULL , 
T11_Premium_Payment_Amount INTEGER NOT NULL , 
T11_Premium_Payment_Schedule DATE NULL , 
T11_Receipt_Id VARCHAR(20) NOT NULL , 
T11_Cust_Id	INTEGER NOT NULL ,
CONSTRAINT XPKPREMIUM_PAYMENT_5 PRIMARY KEY(T11_Premium_Payment_Id,T11_Cust_Id),
CONSTRAINT R_85 FOREIGN KEY (T11_Cust_Id) REFERENCES T11_CUSTOMER(T11_Cust_Id)
);
CREATE UNIQUE INDEX XPKPREMIUM_PAYMENT_5 ON T11_PREMIUM_PAYMENT
(T11_Premium_Payment_Id ASC,T11_Cust_Id ASC);

CREATE TABLE T11_RECEIPT (
T11_Receipt_Id VARCHAR(20) NOT NULL , 
T11_Time_rec DATE NOT NULL ,
T11_Cost INTEGER NOT NULL ,
T11_Premium_Payment_Id VARCHAR(20) NOT NULL , 
T11_Cust_Id	INTEGER NOT NULL ,
CONSTRAINT  XPKRECEIPT_21 PRIMARY KEY(T11_Receipt_Id,T11_Premium_Payment_Id,T11_Cust_Id),
CONSTRAINT R_84 FOREIGN KEY (T11_Premium_Payment_Id, T11_Cust_Id) REFERENCES T11_PREMIUM_PAYMENT(T11_Premium_Payment_Id, T11_Cust_Id)
);
CREATE UNIQUE INDEX XPKRECEIPT_21 ON T11_RECEIPT
(T11_Receipt_Id ASC,T11_Premium_Payment_Id ASC,T11_Cust_Id ASC);


CREATE TABLE T11_APPLICATION (
T11_Application_Id VARCHAR(20) NOT NULL , 
T11_Vehicle_Id	VARCHAR(20) NOT NULL ,
T11_Application_Status CHAR(8) NOT NULL , 
T11_Coverage VARCHAR(50) NOT NULL , 
T11_Cust_Id	INTEGER NOT NULL ,
CONSTRAINT XPKAPPLICATION_2 PRIMARY KEY (T11_Application_Id,T11_Cust_Id), 
CONSTRAINT R_93 FOREIGN KEY (T11_Cust_Id) REFERENCES T11_CUSTOMER(T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKAPPLICATION_2 ON T11_APPLICATION
(T11_Application_Id ASC,T11_Cust_Id ASC);

CREATE TABLE T11_INSURANCE_POLICY (
T11_Agreement_id VARCHAR(200) NOT NULL , 
T11_Department_Name VARCHAR(200) NULL , 
T11_Policy_Number VARCHAR(200) NULL , 
T11_Start_Date	DATE NULL ,
T11_Expiry_Date DATE NULL , 
T11_Term_Condition_Description VARCHAR(200) NULL , 
T11_Application_Id VARCHAR(200) NOT NULL , 
T11_Cust_Id	INTEGER NOT NULL ,
CONSTRAINT XPKINSURANCE_POLICY_4 PRIMARY KEY(T11_Agreement_id,T11_Application_Id,T11_Cust_Id),
CONSTRAINT R_95 FOREIGN KEY (T11_Application_Id, T11_Cust_Id) REFERENCES T11_APPLICATION (T11_Application_Id, T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKINSURANCE_POLICY_4 ON T11_INSURANCE_POLICY
(T11_Agreement_id ASC,T11_Application_Id ASC,T11_Cust_Id ASC);


CREATE TABLE T11_POLICY_RENEWABLE(
T11_Policy_Renewable_Id VARCHAR(20) NOT NULL ,
T11_Date_Of_Renewal	DATE NOT NULL ,
T11_Type_Of_Renewal	CHAR(15) NOT NULL ,
T11_Agreement_id VARCHAR(20) NOT NULL ,
T11_Application_Id VARCHAR(20) NOT NULL ,
T11_Cust_Id	INTEGER  NOT NULL ,
CONSTRAINT XPKPOLICY_RENEWABLE_16 PRIMARY KEY(T11_Policy_Renewable_Id,T11_Agreement_id,T11_Application_Id,T11_Cust_Id),
CONSTRAINT R_101 FOREIGN KEY (T11_Agreement_id, T11_Application_Id, T11_Cust_Id) REFERENCES T11_INSURANCE_POLICY (T11_Agreement_id, T11_Application_Id, T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKPOLICY_RENEWABLE_16 ON T11_POLICY_RENEWABLE
(T11_Policy_Renewable_Id ASC,T11_Agreement_id ASC,T11_Application_Id
ASC,T11_Cust_Id ASC);


CREATE TABLE T11_MEMBERSHIP
(
T11_Membership_Id VARCHAR(20) NOT NULL ,
T11_Membership_Type	CHAR(15) NOT NULL ,
T11_Organisation_Contact VARCHAR(20) NULL ,
T11_Cust_Id	INTEGER NOT NULL ,
CONSTRAINT XPKMEMBERSHIP_12 PRIMARY KEY (T11_Membership_Id,T11_Cust_Id),
CONSTRAINT R_91 FOREIGN KEY (T11_Cust_Id) REFERENCES T11_CUSTOMER (T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKMEMBERSHIP_12 ON T11_MEMBERSHIP
(T11_Membership_Id ASC,T11_Cust_Id ASC);

CREATE TABLE T11_QUOTE (
T11_Quote_Id VARCHAR(20) NOT NULL ,
T11_Issue_Date	DATE NOT NULL ,
T11_Valid_From_Date	DATE NOT NULL ,
T11_Valid_Till_Date	DATE NOT NULL ,
T11_Description	VARCHAR(100) NULL ,
T11_Product_Id	VARCHAR(20) NOT NULL ,
T11_Coverage_Level	VARCHAR(20) NOT NULL ,
T11_Application_Id	VARCHAR(20) NOT NULL ,
T11_Cust_Id	INTEGER NOT NULL ,
CONSTRAINT XPKQUOTE_3 PRIMARY KEY (T11_Quote_Id,T11_Application_Id,T11_Cust_Id),
CONSTRAINT R_94 FOREIGN KEY (T11_Application_Id, T11_Cust_Id) REFERENCES T11_APPLICATION (T11_Application_Id, T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKQUOTE_3 ON T11_QUOTE
(T11_Quote_Id ASC,T11_Application_Id ASC,T11_Cust_Id ASC);

CREATE TABLE T11_STAFF
(
T11_Staff_Id VARCHAR(100) NOT NULL ,
T11_Staff_Fname	VARCHAR(100) NULL ,
T11_Staff_LName	VARCHAR(100) NULL ,
T11_Staff_Adress VARCHAR(100) NULL ,
T11_Staff_Contact BIGINT NULL ,
T11_Staff_Gender CHAR(2) NULL ,
T11_Staff_Marital_Status CHAR(30) NULL ,
T11_Staff_Nationality CHAR(20) NULL ,
T11_Staff_Qualification VARCHAR(100) NULL ,
T11_Staff_Allowance	BIGINT NULL ,
T11_Staff_PPS_Number BIGINT NULL ,
T11_Company_Name VARCHAR(100) NOT NULL ,
CONSTRAINT XPKSTAFF_9 PRIMARY KEY (T11_Staff_Id,T11_Company_Name),
CONSTRAINT R_105 FOREIGN KEY (T11_Company_Name) REFERENCES T11_INSURANCE_COMPANY (T11_Company_Name)
);

CREATE UNIQUE INDEX XPKSTAFF_9 ON T11_STAFF
(T11_Staff_Id ASC,T11_Company_Name ASC);

CREATE TABLE T11_NOK
(
T11_Nok_Id	VARCHAR(100) NOT NULL ,
T11_Nok_Name VARCHAR(100) NULL ,
T11_Nok_Address	VARCHAR(100) NULL ,
T11_Nok_Phone_Number BIGINT NULL ,
T11_Nok_Gender CHAR(30) NULL ,
T11_Nok_Marital_Status CHAR(20) NULL ,
T11_Agreement_id VARCHAR(100) NOT NULL ,
T11_Application_Id VARCHAR(100) NOT NULL ,
T11_Cust_Id	INTEGER NOT NULL ,
CONSTRAINT XPKNOK_14 PRIMARY KEY (T11_Nok_Id,T11_Agreement_id,T11_Application_Id,T11_Cust_Id),
CONSTRAINT R_99 FOREIGN KEY (T11_Agreement_id) REFERENCES T11_INSURANCE_POLICY (T11_Agreement_id),
CONSTRAINT U_98 FOREIGN KEY(T11_Application_Id) REFERENCES T11_APPLICATION (T11_Application_Id),
CONSTRAINT TU_100 FOREIGN KEY (T11_Cust_Id) REFERENCES  T11_CUSTOMER (T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKNOK_14 ON T11_NOK
(T11_Nok_Id ASC,T11_Agreement_id ASC,T11_Application_Id ASC,T11_Cust_Id ASC);

CREATE TABLE T11_PRODUCT
(
T11_Product_Price INTEGER NULL ,
T11_Product_Type CHAR(100) NULL ,
T11_Product_Number VARCHAR(100) NOT NULL ,
T11_Company_Name VARCHAR(100) NOT NULL ,
CONSTRAINT XPKPRODUCT_20 PRIMARY KEY (T11_Product_Number,T11_Company_Name),
CONSTRAINT R_107 FOREIGN KEY (T11_Company_Name) REFERENCES T11_INSURANCE_COMPANY (T11_Company_Name)
);

CREATE UNIQUE INDEX XPKPRODUCT_20 ON T11_PRODUCT
(T11_Product_Number ASC,T11_Company_Name ASC);

CREATE TABLE T11_OFFICE
(
T11_Office_Name	VARCHAR(100) NOT NULL ,
T11_Office_Leader VARCHAR(100) NOT NULL ,
T11_Contact_Information VARCHAR(100) NOT NULL ,
T11_Address	VARCHAR(100) NOT NULL ,
T11_Admin_Cost BIGINT NULL ,
T11_Staff VARCHAR(100) NULL ,
T11_Department_Name VARCHAR(100) NOT NULL ,
T11_Company_Name VARCHAR(100) NOT NULL ,
CONSTRAINT XPKOFFICE_11 PRIMARY KEY (T11_Office_Name,T11_Department_Name,T11_Company_Name),
CONSTRAINT R_104 FOREIGN KEY (T11_Department_Name) REFERENCES T11_DEPARTMENT (T11_Department_Name),
CONSTRAINT RE_67 FOREIGN KEY (T11_Company_Name) REFERENCES T11_INSURANCE_COMPANY (T11_Company_Name)
);

CREATE UNIQUE INDEX XPKOFFICE_11 ON T11_OFFICE
(T11_Office_Name ASC,T11_Department_Name ASC,T11_Company_Name ASC);

CREATE TABLE T11_COVERAGE
(
T11_Coverage_Id	VARCHAR(100) NOT NULL ,
T11_Coverage_Amount	INTEGER NOT NULL ,
T11_Coverage_Type	VARCHAR(100) NOT NULL ,
T11_Coverage_Level	VARCHAR(100) NOT NULL ,
T11_Product_Id	VARCHAR(100) NOT NULL ,
T11_Coverage_Description VARCHAR(200) NULL ,
T11_Covearge_Terms VARCHAR(100) NULL ,
T11_Company_Name VARCHAR(200) NOT NULL ,
CONSTRAINT XPKCOVERAGE_19 PRIMARY KEY(T11_Coverage_Id,T11_Company_Name),
CONSTRAINT R_102 FOREIGN KEY (T11_Company_Name) REFERENCES T11_INSURANCE_COMPANY (T11_Company_Name)
);

CREATE UNIQUE INDEX XPKCOVERAGE_19 ON T11_COVERAGE
(T11_Coverage_Id ASC,T11_Company_Name ASC);



CREATE TABLE T11_INSURANCE_POLICY_COVERAGE
(
T11_Agreement_id VARCHAR(100) NOT NULL ,
T11_Application_Id VARCHAR(100) NOT NULL ,
T11_Cust_Id	INTEGER NOT NULL ,
T11_Coverage_Id	VARCHAR(100) NOT NULL ,
T11_Company_Name VARCHAR(200) NOT NULL ,
CONSTRAINT XPKINSURANCE_POLICY_4_COVERAGE PRIMARY KEY (T11_Agreement_id,T11_Application_Id,T11_Cust_Id,T11_Coverage_Id,T11_Company_Name),
CONSTRAINT R_97 FOREIGN KEY (T11_Agreement_id) REFERENCES T11_INSURANCE_POLICY (T11_Agreement_id),
CONSTRAINT ED_09 FOREIGN KEY  (T11_Application_Id) REFERENCES T11_APPLICATION (T11_Application_Id),
CONSTRAINT PL_09 foreign key (T11_Cust_Id) REFERENCES T11_CUSTOMER(T11_Cust_Id),
CONSTRAINT R_98 FOREIGN KEY (T11_Coverage_Id) REFERENCES T11_COVERAGE (T11_Coverage_Id),
CONSTRAINT RO_102 FOREIGN KEY (T11_Company_Name) REFERENCES T11_INSURANCE_COMPANY (T11_Company_Name)
);

CREATE UNIQUE INDEX XPKINSURANCE_POLICY_4_COVERAGE ON T11_INSURANCE_POLICY_COVERAGE
(T11_Agreement_id ASC,T11_Application_Id ASC,T11_Cust_Id ASC,T11_Coverage_Id ASC,T11_Company_Name ASC);

CREATE TABLE T11_CLAIM
(
T11_Claim_Id VARCHAR(20) NOT NULL ,
T11_Agreement_Id VARCHAR(20) NOT NULL ,
T11_Claim_Amount INTEGER NOT NULL ,
T11_Incident_Id	VARCHAR(20) NOT NULL ,
T11_Damage_Type	VARCHAR(20) NOT NULL ,
T11_Date_Of_Claim DATE NOT NULL , 
T11_Claim_Status CHAR(10) NOT NULL , 
T11_Cust_Id	INTEGER NOT NULL ,
CONSTRAINT XPKCLAIM_7 PRIMARY KEY (T11_Claim_Id,T11_Cust_Id), 
CONSTRAINT R_88 FOREIGN KEY (T11_Cust_Id) REFERENCES T11_CUSTOMER (T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKCLAIM_7 ON T11_CLAIM
(T11_Claim_Id ASC,T11_Cust_Id ASC);

CREATE TABLE T11_CLAIM_SETTLEMENT (
T11_Claim_Settlement_Id VARCHAR(20) NOT NULL , 
T11_Vehicle_Id VARCHAR(20) NOT NULL ,
T11_Date_Settled DATE NOT NULL , 
T11_Amount_Paid INTEGER NOT NULL , 
T11_Coverage_Id VARCHAR(20) NOT NULL , 
T11_Claim_Id VARCHAR(20) NOT NULL , 
T11_Cust_Id	INTEGER NOT NULL ,
CONSTRAINT XPKCLAIM_SETTLEMENT_8 PRIMARY KEY (T11_Claim_Settlement_Id,T11_Claim_Id,T11_Cust_Id),
CONSTRAINT R_90 FOREIGN KEY (T11_Claim_Id) REFERENCES T11_CLAIM (T11_Claim_Id),
CONSTRAINT RB_90 FOREIGN KEY (T11_Cust_Id) REFERENCES T11_CUSTOMER (T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKCLAIM_SETTLEMENT_8 ON T11_CLAIM_SETTLEMENT
(T11_Claim_Settlement_Id ASC,T11_Claim_Id ASC,T11_Cust_Id ASC);

INSERT INTO T11_INCIDENT VALUES('101','Accident','1990-08-19','Accident by the party uintentionally');
INSERT INTO T11_INCIDENT VALUES('102','Property Damage','1990-08-19','Damage to the Vehicle by 3rd party');
INSERT INTO T11_INCIDENT VALUES('103','Personal accident','1990-08-19','The damage done to the vehicle is covered 50%');
INSERT INTO T11_INCIDENT VALUES('104','Earthquake','1990-08-19','100% of the damage done in case of Earthquake is covered by the company.');
INSERT INTO T11_INCIDENT VALUES('105','Cyclone','1990-08-19',"Any serious damage to the engine or exterior of the vehicle will be insured");
INSERT INTO T11_INCIDENT VALUES('106','Criminal Accident','1990-08-19',"Crimes including Theft, in hate damage or breaking due to anger is covered completely by Insurance company");
INSERT INTO T11_INCIDENT VALUES('107','Riots','1990-08-19', 'Any damage done to the vehicle by the people involved in riots will be covered 50% by the company');
INSERT INTO T11_INCIDENT VALUES('108','Engine overheating','1990-08-19', 'Overheating of the engine , in this the company is not liable to pay any amount');
INSERT INTO T11_INCIDENT VALUES('109','Landslide','1990-08-19','Any domage done to the vehicle in a land slide that occured unanimously is covered fully by the company.');
INSERT INTO T11_INCIDENT VALUES('110','Overspeeding','1990-08-19','Company is not liable to pay any amount in case of overspeeding by the driver of the vehicle');
INSERT INTO T11_INCIDENT VALUES('111','Fire','1990-08-19','If the fire is caused by some natural or by accident by a third party then only the insurance company is liable to pay.');
INSERT INTO T11_INCIDENT VALUES('112','Damage by 3rd party','1990-08-19','In case there is a conclusion that there is a conspiracy by the third party and the owner then no insurance will be covered , otherwise 100% is covered.');
INSERT INTO T11_INCIDENT VALUES('113','Animal attack','1990-08-19', '100% coverage by the company.');
INSERT INTO T11_INCIDENT VALUES('114','Engine Failure','1990-08-19','Overhead cost and the installation charges are covered by the company.');
INSERT INTO T11_INCIDENT VALUES('115','Collision','1990-08-19','light damages such as the damages to the hood or tire or windshield will be fully recoverable.');
INSERT INTO T11_INCIDENT VALUES('116','Injury of 3rd party','1990-08-19','Injury to the 3rd party if involves anyone other than the owner will not be recoverable.');
INSERT INTO T11_INCIDENT VALUES('117','Rust','1990-08-19','25% recoverable by the company.');
INSERT INTO T11_INCIDENT VALUES('118','Seizure of Engine','1990-08-19','If the engine is previously repaired by some 3rd party other than the show room then it will not be recovered.');
INSERT INTO T11_INCIDENT VALUES('119', 'Overheating','1990-08-19','100% recoverable.');
INSERT INTO T11_INCIDENT VALUES('120','Short circuit','1990-08-19','Any coverage cost for the repair will be insured by the company.');




-- SELECT * FROM T11_INCIDENT;




INSERT INTO T11_CUSTOMER VALUES (201, 'Paul', 'Walker', '1973-09-12', 'M', 'California', 8937629017, 'paulwalker@actor.com', 33694855, 'Married', 40 );
INSERT INTO T11_CUSTOMER VALUES (202, 'Jaspal', 'Bhatti','1955-03-03' ,'M','Amritsar', 6710947824 , 'jaspalbhatti@comedian.com', 7922033,'Married', 57);
INSERT INTO T11_CUSTOMER VALUES (203, 'Lady', 'Diana Spencer','1961-07-01' , 'F','Sandringham', 1111111111 ,'princessidana@wales.com', 125580, 'Divorced ', 36 );
INSERT INTO T11_CUSTOMER VALUES (204, 'Drazen', 'Petrovic','1964-10-22' ,'M', 'Croatia', 9178456927, 'drazen@nbabasketball.com', 49105443, 'Single', 28);
INSERT INTO T11_CUSTOMER VALUES (205, 'James', 'Dean','1931-02-08' ,'M','Indiana', 7826501975 , 'jamesdean@actor.com', 5468084, 'Single', 24);
INSERT INTO T11_CUSTOMER VALUES (206, 'John Fitzgerald', 'Kennedy','1917-05-29' ,'M', 'Brookline', 9825908717 , 'jfk@uspresident.com', 095084, 'Married', 46);
INSERT INTO T11_CUSTOMER VALUES (207, 'Sam', 'Kinison','1953-12-08' ,'M','Washington', 9027561813 , 'sam@comedian.com', 7721945, 'Divorced', 38);
INSERT INTO T11_CUSTOMER VALUES (208, 'Sonu', 'Sood','1973-07-30' ,'M','Moga', 9748632798, 'sonusood@actor.com', 354070, 'Married', 41);
INSERT INTO T11_CUSTOMER VALUES (209, 'Barack', 'Obama Sr.','1936-06-18 ','M','Kenya ', 9864276532, 'seniorobama@econimist.com', 8892341, 'Married', 46);
INSERT INTO T11_CUSTOMER VALUES (210, 'John', 'Denver','1943-12-31' ,'M','New Mexico', 8816354290 ,'johndenver@singer.com', 7321879, 'Divorced', 53);
INSERT INTO T11_CUSTOMER VALUES (211, 'Subhash Chandra', 'Bose','1897-01-23' ,'M','Cuttac', 8973526754, 'scbose@freedomfighter.com', 1897385, 'Married', 48);
INSERT INTO T11_CUSTOMER VALUES (212, 'Kalika Prasad', 'Bhattacharya','1970-09-11' ,'M', 'Silchar', 8927675517 ,'kpbhattacharya@folksinger.com', 782563, 'Divorced', 46);
INSERT INTO T11_CUSTOMER VALUES (213, 'Ryan', 'Dunn','1977-06-11 ','M','Ohio', 8927654891, 'dunn@stunts.com', 892764, 'Single', 34);
INSERT INTO T11_CUSTOMER VALUES (214, 'Pierre', 'Curie','1859-05-15' ,'M', 'Paris', 9830553876, 'curie@scientist.com', 765432, 'Married', 46);
INSERT INTO T11_CUSTOMER VALUES (215, 'Hema', 'Malini','1948-10-16' ,'F', 'Tamil Nadu', 8926778935 ,'hemamalini@actress.com', 897643, 'Married', 72);
INSERT INTO T11_CUSTOMER VALUES (216, 'Grace', 'Kelly','1929-11-12' ,'F','Pennsylvania', 79217654897, 'kelly@actress.com', 873078, 'Married', 52);
INSERT INTO T11_CUSTOMER VALUES (217, 'Sana', 'Iqbal','1987-01-16' ,'F','Hyderabad', 7908887689 ,'sana@biker.com', 7896736, 'Single', 30);
INSERT INTO T11_CUSTOMER VALUES (218, 'Sunil', 'Grover','1977-08-03' ,'M','Mandi', 8765997647, 'sunilgrover@actor.com', 683757, 'Married', 37);
INSERT INTO T11_CUSTOMER VALUES (219, 'Rajesh', 'Pilot', '1945-02-10', 'M', 'Ghaziabad', 789875783, 'rajesh@iaf.com', 672867, 'Married', 55);
INSERT INTO T11_CUSTOMER VALUES (220, 'Jayne', 'Mansfield','1933-04-19', 'F', 'Pennsylvania', 8975889764, 'jayne@actress.com', 768388, 'Married', 34);


-- SELECT * FROM T11_CUSTOMER;

-- table 3

INSERT INTO T11_INCIDENT_REPORT  VALUES('301','Fire','Deepanshu Sachdeva', '1990-08-19', 560000,'Severe fire caused due to accident, damage 90%','111',201);
INSERT INTO T11_INCIDENT_REPORT  VALUES('302','Cyclone',' Vinita Yadav', '1990-08-19', 890000,'Severe damage of about 85% dur to Cyclone Aila','105',203);
INSERT INTO T11_INCIDENT_REPORT  VALUES('303','Accident','Pranjal Aggarwal', '1990-08-19',12000000,'Damage of about 50% caused due to head in collision','101',203);
INSERT INTO T11_INCIDENT_REPORT  VALUES('304','Animal Attack','Shubham Sharma', '1990-08-19', 1850980,'Wild animal attack at the rear of the vehicle, damage 30%','113',204);
INSERT INTO T11_INCIDENT_REPORT  VALUES('305','Corrosion','Jagrut Nemade', '1990-08-19',450000,'Vehicle Damaged due to heavy corrosion','117',205);
INSERT INTO T11_INCIDENT_REPORT  VALUES('306','Riots','Kshitiz Michael', '1990-08-19', 3400500,'Vehicle flipped over and damaged during the Cambridge Riot','107',206);
INSERT INTO T11_INCIDENT_REPORT  VALUES('307','Drunken Driving','Kalin Sharma', '1990-08-19',76000,'Light damage to the vehicle caused due to collision with a drunk driver vehicle','103',207);
INSERT INTO T11_INCIDENT_REPORT  VALUES('308','Engine Overheating','Bitoo Bhaiya', '1990-08-19',45000,'Engine overheating caused due to parking in extreme sunlight','108',208);
INSERT INTO T11_INCIDENT_REPORT  VALUES('309','Property Damage','Aditya Katoch', '1990-08-19',765000,'Vehicle damaged during demolition work','102',209);
INSERT INTO T11_INCIDENT_REPORT  VALUES('310','Engine Overheating','Rajeevni Suryavanshi', '1990-08-19',980400,'Fuel Tank explosion due to overheating, damage 100%','108',210);
INSERT INTO T11_INCIDENT_REPORT  VALUES('311','Collision','Rakesh Kumar', '1990-08-19',8790050,'Damage due to head on collision with electricity pole, full frontal damage','115',211);
INSERT INTO T11_INCIDENT_REPORT  VALUES('312','Earthquake','Rahul Raghav', '1990-08-19',875000,'Vehicle buried under debris due to earthquake, damage 60%','104',212);
INSERT INTO T11_INCIDENT_REPORT  VALUES('313','Damage Caused Due to 3rd Party','Naman Kant', '1990-08-19',8798400,'Vehicle damaged during fight among two people','112',213);
INSERT INTO T11_INCIDENT_REPORT  VALUES('314','Engine Failure','Nayan Kant', '1990-08-19',6574500,'Vehicle damaged due to engine failure while driving, collision with vehicle coming from behind','114',214);
INSERT INTO T11_INCIDENT_REPORT  VALUES('315','Landslide','Avinash Singh', '1990-08-19',84900,'Vehicle slipped through the valley, during landslides','109',215);
INSERT INTO T11_INCIDENT_REPORT  VALUES('316','Overspeeding','Aman Yadav', '1990-08-19',12098500,'Partial Damage due to collision while overspeeding','110',216);
INSERT INTO T11_INCIDENT_REPORT  VALUES('317','Criminal Activity','Akshay Kumar', '1990-08-19',8795000,'Car stolen and damaged during a robbery','106',217);
INSERT INTO T11_INCIDENT_REPORT  VALUES('318','Short Circuit','Lakshya Chatrapati', '1990-08-19',6574500,'Damage due to short circuit, damage 65%','120',218);
INSERT INTO T11_INCIDENT_REPORT  VALUES('319','Seizure of Engine','Akarsh Maurya', '1990-08-19',5794000,'Unpredicted engine seizure, damage 45%','118',219);
INSERT INTO T11_INCIDENT_REPORT  VALUES('320','Fire','Mithil Anchan', '1990-08-19',5500000,'Damage due to car set on fire, damage 85%','111',220);


-- SELECT * FROM T11_INCIDENT_REPORT;
-- table 4

INSERT INTO T11_INSURANCE_COMPANY VALUES('Dun & Bradstreet Private Limited','103 JFK Parkway, Short Hills, Millburn, New Jersey', 9739215500, 08977109876, 'receivablequestions@dnb.com', 'https://www.dnb.com/','USA','Dun & Bradstree Vehicle Insurance Division', 'Dun & Bradstree Insurance');
INSERT INTO T11_INSURANCE_COMPANY VALUES('Reliance Life Insurance Corporation Limited','1st Floor, Atharva Building, Behind Payyade Residency, Off Mira Bhayander Road, Mira Road - East, Mumbai, Thane district', 022-28555240, 1800872555,'rnlife.customerservice@relianceada.com', 'https://www.reliancenipponlife.com/','Mumbai ','Reliance Vehicle Insurance Division','Reliance Life Insurance');
INSERT INTO T11_INSURANCE_COMPANY VALUES('Bupa Insurance Group','33 Exhibition Street, Melbourne, VIC 3000 Australia', 8947872827, 1800767628, 'info@bupa.com.au', 'https://www.bupa.com.au/', 'Australia', 'Bupa Vehicle Division', 'Bupa Insurance Company');
INSERT INTO T11_INSURANCE_COMPANY VALUES('Aviva Insurance Company Limited','Aviva plc, St Helens, 1 Undershaft, EC3P 3DQ, London', 1800897388, NULL, 'contact@aviva.co.uk', 'https://www.aviva,co.uk', 'United Kingdom', 'Aviva Vehicles Inusrance', 'Aviva Insurances');
INSERT INTO T11_INSURANCE_COMPANY VALUES('Birkshire Hathaway Inc.','Kiewit Plaza, 3555 Farnam St., Omaha, NE', 4023461400, NULL,'berkshire@berkshirehathaway.com', 'https://www.berkshirehathaway.com/', 'Nebraska', 'BH Vehicles','BH Insurance');
INSERT INTO T11_INSURANCE_COMPANY VALUES('The Hartford Financial Services Group, Inc.','The Hartford Financial Services Group, Inc., 690 Asylum Avenue, Hartford, CT', 8605475000, 08492145766, 'insurances@thehartford.com','https://www.thehartfors.com/','United States','Hartford Vehicles Division','The Hartford');
INSERT INTO T11_INSURANCE_COMPANY VALUES('Bharti AXA General Insurance Company Limited', 'First Floor Hosto Centre, No. 43, Millers Road, Vasanth Nagar', 1800975658,9685852555,'contact@bhartiaxa.com', 'https://www.bhartiaxa.com', 'Banglore', 'Bharti Vehicles','Bharti Insurances');
INSERT INTO T11_INSURANCE_COMPANY VALUES('PNB Insurance Company Limited','Unit No. 701, 702 & 703, 7th Floor, West Wing, Raheja Towers, 26/27 M G Road', 1800786668, 02241790000, 'indiaservice@pnbmetlife.co.in','https://www.pnbmetlife.co.in/', 'Mumbai','PNB Vehicles Division','PNB Insurances');
INSERT INTO T11_INSURANCE_COMPANY VALUES('AAR Insurance, Kenya','Real Tower, Upperhill, Kenya', 18006757383, NULL, 'info@aar.co.ke', 'https://www.aar.co.ke', 'Nairobi', 'AAR Veh Ins', 'AAR Insurance Solutions');
INSERT INTO T11_INSURANCE_COMPANY VALUES('American International Group, Inc.', '175, Water Street, New York', 1800498592, 0236645788,'info@aig.com', 'https://www.aig.com/', 'New York','AIG Vehicle Solutions', 'AIG Insurances');
INSERT INTO T11_INSURANCE_COMPANY VALUES('SBI Insurance Company Limited', 'SBI Corporate Solutions. 4th Floor, MV Road, Andheri (East)', 1899983766, NULL, 'info@sbiinsurance.com', 'https://www.sbiinsurance.com/', 'Mumbai', 'SBI Vehicle Solutions', 'SBI Insurance Company');
INSERT INTO T11_INSURANCE_COMPANY VALUES('Tata Insurance Company Limited', 'Tower A, Peninsula Business Park, Senapati Bapat Marg, Lower Parel', 1088997755, 0234888829,'info@tata.com', 'https://www.tata.com', 'Mumbai', 'Tata Vehicle Insurances','Tata Insurances');
INSERT INTO T11_INSURANCE_COMPANY VALUES('Reliance Vehicle Insurance Company Limited','Reliance Centre, 5th floor, Off Western Express Highway, Santacruz East', 1899007777, NULL, 'info@reliancelife.com','https://www.reliancelife.com', 'Mumbai','Reliance Vehicles','Reliance Solutions');
INSERT INTO T11_INSURANCE_COMPANY VALUES('Aegon Insurance Company Limited','2nd Floor, Aditya Trade Center, 7-1-618, Hyderabad', 1800977678, NULL, 'help@aegon.com','https://www.aegon.com/', 'Hyderabad','Aegon Vehicle Solutions','Aegon Insurances');
INSERT INTO T11_INSURANCE_COMPANY VALUES('Sharma Insurance Company Limited','4th Floor, Commerce Enclave, Financial District, Gachibowli', 1800976749, NULL, 'info@sharmainsurances.com','https://www.shramainsurances.com', 'Hyderabad','Sharma Insurances','Sharma Solutions');
INSERT INTO T11_INSURANCE_COMPANY VALUES('DP International Vehicle Insurance Limited','3rd Floor, RajMandir Bhavan, Begumpet', 1800678692, NULL, 'info@dpinternational.com', 'https://www.dpinternational.com', 'Kolkata','DP Vehicle Insurance','DP Insurances');
INSERT INTO T11_INSURANCE_COMPANY VALUES('DLF Pramerica Insurance Company Limited','5th floor, Bezzola Complex Ltd., Sion Trombay Road,', 18000784677, NULL, 'info@dlfpi.com','https://www.dlfpi.com/', 'Sion','DLF Vehicle Division', 'DLF Insurances');
INSERT INTO T11_INSURANCE_COMPANY VALUES('IDBI Insurance Company Limited','Office Building Near Narayanaguda Flyover, Hyderabad, Telangana', 1866798288, NULL,'contact@idbi.com', 'https://www.idbi.com/', 'Hyderabad','IDBI Vehicles Division','IDBI Insurace Office');
INSERT INTO T11_INSURANCE_COMPANY VALUES('Vehicles Association of India','5th Floor, VAI Complex, Industrial Estate, Mumbai', 18099489288, 028887927,'info@vai.com','https://www.vai.com','Mumbai','VAI Vehicles','VAI Solutions');
INSERT INTO T11_INSURANCE_COMPANY VALUES('Life Insurance Corporation of India Limited','3rd Floor, BSE Building, New Okhla Industrial Development Authority', 1804489999, NULL, 'info@lic.com','https://www.lic.com', 'Noida','LIC Vehicle Insurance','LIC Office');


-- SELECT * FROM T11_INSURANCE_COMPANY;
-- table 5





INSERT INTO T11_DEPARTMENT VALUES
      ('Dun & Bradstree Vehicle Insurance Division', '501', 'Kendra Castillo' ,'Dun & Bradstreet Private Limited','Dun & Bradstreet Private Limited'),
      ('Reliance Vehicle Insurance Division', '502', 'Elana Tyson', 'Reliance Life Insurance Corporation Limited','Reliance Life Insurance Corporation Limited'),
       ('Bupa Vehicle Division', '503', 'Hawa Ferrell', 'Bupa Insurance Group','Bupa Insurance Group'),
       ('Aviva Vehicles Inusrance', '504', 'Addie Estes', 'Aviva Insurance Company Limited','Aviva Insurance Company Limited'),
      ('BH Vehicles', '505', 'Pranav Gupta', 'Birkshire Hathaway Inc.','Birkshire Hathaway Inc.'),
      ('Hartford Vehicles Division', '506', 'Cinar Ratcliffe', 'The Hartford Financial Services Group','The Hartford Financial Services Group, Inc.'),
      ('Bharti Vehicles', '507', 'Elara Doyle','Bharti AXA General Insurance Company Limited','Bharti AXA General Insurance Company Limited'),
      ('PNB Vehicles Division', '508', 'Christine Smith', 'PNB Insurance Company Limited','PNB Insurance Company Limited'),
      ('AAR Veh Ins', '509', 'Benas Vinson', 'AAR Insurance, Kenya','AAR Insurance, Kenya'),
      ('AIG Vehicle Solutions', '510', 'Anabella Dickson','American International Group, Inc.','American International Group, Inc.'),
      ('SBI Vehicle Solutions', '511', 'Arnav Singh', 'SBI Insurance Company Limited','SBI Insurance Company Limited'),
      ('Tata Vehicle Insurances', '512', 'Sharon Lyon', 'Tata Insurance Company Limited','Tata Insurance Company Limited'),
      ('Reliance Vehicles', '513', 'Malikah Frederick', 'Reliance Vehicle Insurance Company Limited','Reliance Vehicle Insurance Company Limited'),
      ('Aegon Vehicle Solutions', '514', 'Connah Knight', 'Aegon Insurance Company Limited','Aegon Insurance Company Limited'),
      ('Sharma Insurances', '515', 'Jagoda Copeland', 'Sharma Insurance Company Limited','Sharma Insurance Company Limited'),
      ('DP Vehicle Insurance', '516', 'Kylo Vang', 'DP International Vehicle Insurance Limited','DP International Vehicle Insurance Limited'),
      ('DLF Vehicle Division', '517', 'Kobi Stott', 'DLF Pramerica Insurance Company Limited','DLF Pramerica Insurance Company Limited'),
      ('IDBI Vehicles Division', '518', 'Naseem Coleman', 'IDBI Insurance Company Limited','IDBI Insurance Company Limited'),
 	('VAI Vehicles', '519', 'Angelo Kouma', 'Vehicles Association of India','Vehicles Association of India'),
      ('LIC Vehicle Insurance', '520', 'Jo Schultz', 'Life Insurance Corporation of India Limited','Life Insurance Corporation of India Limited'),
      ('Dun & Bradstree Vehicle Insurance Division2', '501', 'Kendra Castillo' ,'Dun & Bradstreet Private Limited','Dun & Bradstreet Private Limited');


-- SELECT * FROM T11_DEPARTMENT;


-- table 6
 INSERT INTO T11_VEHICLE_SERVICE VALUES ('Reliance Vehicle Insurance Division','AB','Valencia','9933786475','Kendra Castillo','part-specific-service', 'Reliance Life Insurance Corporation Limited');
 INSERT INTO T11_VEHICLE_SERVICE VALUES ('Hartford Vehicles Division','CD','Shahkot','8977476654', 'Cinar Ratcliffe','full-service','The Hartford Financial Services Group, Inc.');
 INSERT INTO T11_VEHICLE_SERVICE VALUES ('Bharti Vehicles','EF','Paris','9088997266','Elara Doyle','minor-service',  'Bharti AXA General Insurance Company Limited');
 INSERT INTO T11_VEHICLE_SERVICE VALUES ('SBI Vehicle Solutions','GH','Germany','9083686266','Arnav Singh','part-specific-service', 'SBI Insurance Company Limited');
 INSERT INTO T11_VEHICLE_SERVICE VALUES ('Reliance Vehicles','IJ','California','9098287767', 'Malikah Frederick','full-service',  'Reliance Vehicle Insurance Company Limited');
 INSERT INTO T11_VEHICLE_SERVICE VALUES ('PNB Vehicles Division','KL','Dallas','9093874666','Christine Smith','half-service',  'PNB Insurance Company Limited');
 INSERT INTO T11_VEHICLE_SERVICE VALUES ('Bupa Vehicle Division','MN','California','9093874666', 'Hawa Ferrell','full-major-service', 'Bupa Insurance Group');
 INSERT INTO T11_VEHICLE_SERVICE VALUES ('Dun & Bradstree Vehicle Insurance Division','OP','Mumbai','9090938888', 'Kendra Castillo','half-service','Dun & Bradstreet Private Limited');
 INSERT INTO T11_VEHICLE_SERVICE VALUES ('Aviva Vehicles Inusrance','QR','Nairobi','8902667477','Addie Estes','partial-service',  'Aviva Insurance Company Limited');
 INSERT INTO T11_VEHICLE_SERVICE VALUES ('DLF Vehicle Division','ST','California','8978889978','Kobi Stott','full-service', 'DLF Pramerica Insurance Company Limited');
 INSERT INTO T11_VEHICLE_SERVICE VALUES ('IDBI Vehicles Division','UV','Taiwan','9093875995','Naseem Coleman','partial-service','IDBI Insurance Company Limited');
 -- INSERT INTO T11_VEHICLE_SERVICE VALUES ('IDBI Vehicles Division','WX','Hooghly','9094978577','Angelo Kouma','minor-service', 'Vehicles Association of India');
 INSERT INTO T11_VEHICLE_SERVICE VALUES ('Tata Vehicle Insurances','YZ','Pennsylvania','9095999954','Sharon Lyon','major-service', 'Tata Insurance Company Limited');
 INSERT INTO T11_VEHICLE_SERVICE VALUES ('AAR Veh Ins','AA','Paris', '9094877758','Benas Vinson','full-service',  'AAR Insurance, Kenya');
 INSERT INTO T11_VEHICLE_SERVICE VALUES ('AIG Vehicle Solutions','BB','Mumbai','9093875766', 'Anabella Dickson','half-service', 'American International Group, Inc.');
 INSERT INTO T11_VEHICLE_SERVICE VALUES ('Aegon Vehicle Solutions','CC','Monaco','9093875893', 'Connah Knight', 'part-specific-service', 'Aegon Insurance Company Limited');
 INSERT INTO T11_VEHICLE_SERVICE VALUES ('DP Vehicle Insurance','DD','Hyderabad','9080949898','Kylo Vang', 'full-service', 'DP International Vehicle Insurance Limited');
 INSERT INTO T11_VEHICLE_SERVICE VALUES ('Sharma Insurances','EE','Lousiana','8989488849', 'Jagoda Copeland','minor-service', 'Sharma Insurance Company Limited');


-- SELECT * FROM T11_VEHICLE_SERVICE;



INSERT INTO T11_VEHICLE VALUES 
('101', '1101', 'UP 11 MZ 8709', 302002, 'Car', 20, 6, 'Corolla', 454545, 858585, 652, 'A2020', 202),
('102', '1102', 'UP 14 AM 8222', 50000, 'Bike', 10, 2, 'Honda', 654556, 858586, 856, 'B2020', 203),
('103', '1103', 'HR 04 KT 8975', 20000, 'Bike', 8, 2, 'Tata', 854545, 65857, 362, 'C2020', 202),
('104', '1104', 'KX 45 JG 8754', 100000, 'Truck', 40, 2, 'Mahindra', 954545, 968585, 123, 'D2020', 204),
('105', '1105', 'UP 14 GS 5729', 600000, 'Car', 23, 4, 'Hyundai', 104545, 63524, 124, 'E2020', 205),
('106', '1106', 'MH 25 OF 4587', 52300, 'Bike', 11, 2, 'Corolla', 114545, 09645, 125, 'F2020', 206),
('107', '1107', 'HR 56 GH 4568', 800000, 'Car', 25, 4, 'Tata', 124545, 123561, 126, 'G2020', 207),
('108', '1108', 'TD 21 LK 8976', 456220, 'Car', 24, 4, 'Mahindra', 134545, 74864, 127, 'H2020', 204),
('109', '1109', 'MH 23 DC 7412', 40000, 'Bike', 10, 2, 'TVS', 144545, 12345, 128, 'I2020', 202),
('110', '1110', 'PB 89 CD 1234', 60000, 'Bike', 10, 2, 'BAJAJ', 154545, 54321, 129, 'J2020', 208),
('111', '1111', 'HP 14 KL 5678', 2000000, 'Truck', 35, 2, 'TATA', 164545, 12534, 223, 'K2020', 203),
('112', '1112', 'AP 53 HG 7777', 55000, 'Bike', 9, 2, 'Honda', 174545, 56325, 224, 'L2020', 209),
('113', '1113', 'KA 74 LM 5698', 450000, 'Car', 22, 6, 'Mahindra', 184545, 32561, 225, 'M2020', 210),
('114', '1114', 'KA 35 MN 6325', 6500000, 'Car', 21, 4, 'Corolla', 194545, 63522, 226, 'N2020', 211),
('115', '1115', 'UP 96 PQ 7845', 563300, 'Car', 20, 4, 'Hyundai', 204545, 23652, 227, 'O2020', 212);

-- SELECT * FROM T11_VEHICLE;


-- Table-8

INSERT INTO T11_PREMIUM_PAYMENT VALUES
('1001', '78901', 10000, '2021-11-22', '901', 201),
('1002', '78902', 100000, '2022-09-12', '902', 202),
('1003', '78903', 3256, '2021-06-30', '903', 203),
('1004', '78904', 10, '2022-10-16', '904', 204),
('1005', '78905', 6598, '2022-02-21', '905', 205),
('1006', '78906', 7000, '2022-03-19', '906', 206),
('1007', '78907', 8000, '2020-04-15', '907', 207),
('1008', '78908', 9031, '2020-05-29', '908', 208),
('1009', '78909', 1235, '2017-09-12', '909', 209),
('1010', '78910', 9696, '2020-07-09', '910', 210),
('1011', '78911', 3500, '2020-10-07', '911', 211),
('1012', '78912', 4500, '2020-11-01', '912', 212),
('1013', '78913', 5000, '2019-03-03', '913', 213),
('1014', '78914', 6000, '2020-10-05', '914', 214),
('1015', '78915', 7500, '2018-03-29', '915', 215),
('1016', '78916', 9900, '2020-04-22', '916', 216),
('1017', '78917', 10000, '2020-10-11', '917', 217),
('1018', '78918', 1000, '2019-10-12', '918', 218),
('1019', '78919', 6666, '2019-06-14', '919', 219),
('1020', '78920', 9450, '2020-05-23', '920', 220);





-- SELECT * FROM T11_PREMIUM_PAYMENT;
-- Table-9 

INSERT INTO T11_RECEIPT VALUES
 ('901', '2020-11-22', 1000, '1001', 201),
('902', '2019-09-12', 2000, '1002', 202),
('903', '2020-06-30', 3256, '1003', 203),
('904', '2018-10-16', 235, '1004', 204),
('905', '2019-02-21', 6598, '1005', 205),
('906', '2020-03-19', 7000, '1006', 206),
('907', '2020-04-15', 8000, '1007', 207),
('908', '2020-05-29', 9031, '1008', 208),
('909', '2017-09-12', 1235, '1009', 209),
('910', '2020-07-09', 9696, '1010', 210),
('911', '2020-10-07', 3500, '1011', 211),
('912', '2020-11-01', 4500, '1012', 212),
('913', '2019-03-03', 5000, '1013', 213),
('914', '2020-10-05', 6000, '1014', 214),
('915', '2018-03-29', 7500, '1015', 215),
('916', '2020-04-22', 9900, '1016', 216),
('917', '2020-10-11', 10000, '1017', 217),
('918', '2019-10-12', 1000, '1018', 218),
('919', '2019-06-14', 6666, '1019', 219),
('920', '2020-05-23', 9450, '1020', 220);

-- SELECT * FROM T11_RECEIPT;

-- Table-10 

INSERT INTO T11_APPLICATION VALUES 
('701', '801', 'Accepted', 'Collision Coverage', 201),
('702', '802', 'Pending', 'Personal Injury Coverage', 202),
('703', '803', 'Rejected', 'Uninsured Motorist Coverage', 203),
('704', '804', 'Accepted', 'Comprehensive Coverage', 204),
('705', '805', 'Pending', 'Liability Coverage', 205),
('706', '806', 'Pending', 'Bodily Injury Liability Coverage', 206),
('707', '807', 'Accepted', 'Liability Coverage', 207),
('708', '808', 'Accepted', 'Comprehensive Coverage', 208),
('709', '809', 'Pending', 'Personal Injury Coverage', 209),
('710', '810', 'Accepted', 'Personal Injury Coverage', 210),
('711', '811', 'Accepted', 'Collision Coverage', 211),
('712', '812', 'Pending', 'Liability Coverage', 212),
('713', '813', 'Pending', 'Bodily Injury Liability Coverage', 213),
('714', '814', 'Accepted', 'Personal Injury Coverage', 214),
('715', '815', 'Rejected', 'Liability Coverage', 215),
('716', '816', 'Accepted', 'Collision Coverage', 216),
('717', '817', 'Pending', 'Comprehensive Coverage', 217),
('718', '818', 'Rejected', 'Personal Injury Coverage', 218),
('719', '819', 'Pending', 'Bodily Injury Liability Coverage', 219),
('720', '820', 'Rejected', 'Personal Injury Coverage', 220);


-- SELECT * FROM T11_APPLICATION;
-- Table-11

INSERT INTO T11_INSURANCE_POLICY VALUES 
('601','Dun & Bradstree Vehicle Insurance Division' ,'78901','2016-11-22', '2026-07-30', 'Covers the damage or loss to the insured vehicle along with 3rd party liability for property damage, injury or death.','701' ,201),
('602','Reliance Vehicle Insurance Division' ,'78902','2015-12-23', '2022-12-31',  'This coverage pays for any damage to 3rd party property, vehicle, or person. This cover does not benefit the car owner in any way.','702' ,202),
('603','Bupa Vehicle Division' ,'78903','2019-02-24', '2027-10-25',  'Coverage includes an explosion, fire, lightning, earthquake, riot, landslide, terrorist activity, and much more.','703' ,203),
('604','Aviva Vehicles Inusrance' ,'78904','2020-01-08', '2028-01-23',  'In case if you do not file any claim throughout the period of the insurance, you receive a bonus for the same.','704' ,204),
('605','BH Vehicles' ,'78905','2018-02-07', '2022-05-09',  'In case if you do not file any claim throughout the period of the insurance, you receive a bonus for the same is 70% of the expenses, market value of vehicle if stolen.','705' ,205),
('606','The Hartford Financial Services Group, Inc.' ,'78906','2010-03-06', '2021-06-07',  'Covers the damage or loss to the insured vehicle along with 3rd party liability for property damage, injury or death.','706' ,206),
('607','Bharti Vehicles' ,'78907','2012-05-05', '2021-04-11',  'Coverage includes an explosion, fire, lightning, earthquake, riot, landslide, terrorist activity, and much more.','707' ,207),
('608','PNB Vehicles Division' ,'78908','2013-07-15', '2023-05-13',  'In case if you do not file any claim throughout the period of the insurance, you receive a bonus for the same.','708' ,208),
('609','AAR Veh Ins' ,'78909','2014-08-08', '2024-07-14',  'Covers the damage or loss to the insured vehicle along with 3rd party liability for property damage, injury or death.','709' ,209),
('610','AIG Vehicle Solutions' ,'78910','2015-06-13', '2030-11-17',  'In case if you do not file any claim throughout the period of the insurance, you receive a bonus for the same.','710' ,210),
('611','SBI Vehicle Solutions' ,'78911','2019-09-09', '2031-03-15',  'In case if you do not file any claim throughout the period of the insurance, you receive a bonus for the same.','711' ,211),
('612','Tata Vehicle Insurances' ,'78912','2020-10-29', '2027-02-22',  'Coverage includes an explosion, fire, lightning, earthquake, riot, landslide, terrorist activity, and much more.','712' ,212),
('613','Reliance Vehicles' ,'78913','2018-11-30', '2023-09-21',  'This coverage pays for any damage to 3rd party property, vehicle, or person. This cover does not benefit the car owner in any way.','713' ,213),
('614','Aegon Vehicle Solutions' ,'78914','2016-06-02', '2020-10-27',  'In case if you do not file any claim throughout the period of the insurance, you receive a bonus for the same is 70% of the expenses, market value of vehicle if stolen.','714' ,214),
('615','Sharma Insurances' ,'78915','2009-04-03', '2024-12-01',  'Coverage includes an explosion, fire, lightning, earthquake, riot, landslide, terrorist activity, and much more.','715' ,215),
('616','DP Vehicle Insurance' ,'78916','2008-02-08', '2026-11-02',  'In case if you do not file any claim throughout the period of the insurance, you receive a bonus for the same.','716' ,216),
('617','DLF Vehicle Division' ,'78917','2014-12-06', '2028-10-29',  'In case if you do not file any claim throughout the period of the insurance, you receive a bonus for the same.','717' ,217),
('618','IDBI Vehicles Division' ,'78918','2017-04-01', '2025-02-08',  'Covers the damage or loss to the insured vehicle along with 3rd party liability for property damage, injury or death.','718' ,218),
('619','VAI Vehicles' ,'78919','2019-03-24', '2022-02-04',  'This coverage pays for any damage to 3rd party property, vehicle, or person. This cover does not benefit the car owner in any way.','719' ,219),
('620','LIC Vehicle Insurance' ,'78920','2020-05-25', '2024-01-08',  'In case if you do not file any claim throughout the period of the insurance, you receive a bonus for the same is 70% of the expenses, market value of vehicle if stolen.','720' ,220);

-- SELECT * FROM T11_INSURANCE_POLICY;

-- Table-12 

INSERT INTO T11_POLICY_RENEWABLE VALUES
('201','2025-11-11', 'Offline',  '601','701' ,201),
('202','2026-07-30', 'Online',  '602','702' ,202),
('203','2022-12-31', 'Online',  '603','703' ,203),
('204','2027-10-25', 'Online',  '604','704' ,204),
('205','2028-01-23', 'Offline',  '605','705' ,205),
('206','2022-05-09', 'Offline',  '606','706' ,206),
('207','2021-06-07', 'Online',  '607','707' ,207),
('208','2021-04-11', 'Online',  '608','708' ,208),
('209','2023-05-13', 'Offline',  '609','709' ,209),
('210','2024-07-14', 'Online',  '610','710' ,210),
('211','2030-11-17', 'Offline',  '611','711' ,211),
('212','2031-03-15', 'Online',  '612','712' ,212),
('213','2027-02-22', 'Online',  '613','713' ,213),
('214','2023-09-21', 'Offline',  '614','714' ,214),
('215','2020-10-27', 'Offline',  '615','715' ,215),
('216','2024-12-01', 'Offline',  '616','716' ,216),
('217','2026-11-02', 'Online',  '617','717' ,217),
('218','2028-10-29', 'Online',  '618','718' ,218),
('219','2022-02-04', 'Online',  '619','719' ,219),
('220','2024-01-08', 'Offline',  '620','720' ,220);

-- SELECT * FROM T11_POLICY_RENEWABLE;
-- Table-13

INSERT INTO T11_MEMBERSHIP VALUES
('301', 'LMBNG1245600', '9658615469', 202),
('302', 'LMBNG1245601', '9874589898', 203),
('303', 'LMBNG1245602', '9856315478', 204),
('304', 'LMBNG1245603', '7584898987', 205),
('305', 'LMBNG1245604', '6547898745', 206),
('306', 'LMBNG1245605', '9874114789', 207),
('307', 'LMBNG1245606', '6547887456', 208),
('308', 'LMBNG1245607', '8741214785', 209),
('309', 'LMBNG1245608', '8963236985', 210),
('310', 'LMBNG1245609', '8585874747', 211),
('311', 'LMBNG1245610', '9696985748', 212),
('312', 'LMBNG1245611', '8574365987', 213),
('313', 'LMBNG1245612', '9654785236', 214),
('314', 'LMBNG1245613', '9685123647', 215),
('315', 'LMBNG1245614', '9654785236', 216),
('316', 'LMBNG1245615', '3698745632', 217),
('317', 'LMBNG1245616', '9658745632', 218),
('318', 'LMBNG1245617', '9654774569', 219),
('319', 'LMBNG1245618', '9658412365', 220),
('320', 'LMBNG1245619', '6987458963', 201);

-- SELECT * FROM T11_MEMBERSHIP;
--  Table-14

INSERT INTO T11_QUOTE VALUES
('401', '2016-11-22', '2016-11-22', '2026-07-30',  'Honda Civic', 'KLMA2564', '12666', '701', 201), 
('402', '2015-12-23', '2015-12-23', '2022-12-31',  'Buggati Veyron', 'KLMA6589', '23666', '702', 202),
('403', '2019-02-24', '2019-02-24', '2027-10-25',  'Honda City', 'KLMA2365', '69555', '703', 203),
('404', '2020-01-08', '2020-01-08', '2028-01-23',  'McLaren V5', 'KLMA9874', '70000', '704', 204),
('405', '2018-02-07', '2018-02-07', '2022-05-09',  'Chevrolet Cruze', 'KLMA2365', '666000', '705', 205),
('406', '2010-03-06', '2010-03-06', '2021-06-07',  'Activa 5G', 'KLMA6655', '69585', '706', 206),
('407', '2012-05-05', '2012-05-05', '2021-04-11',  'Chevrolet Covette', 'KLMA5641', '12000', '707', 207),
('408', '2013-07-15', '2013-07-15', '2023-05-13',  'McLaren Senna', 'KLMA3322', '99663', '708', 208),
('409', '2014-08-08', '2014-08-08', '2024-07-14',  'Aston Martin Vanquish', 'KLMA6699', '20000', '709', 209),
('410', '2015-06-13', '2015-06-13', '2030-11-17',  'Volkswagen Beetle', 'KLMA6325', '200000', '710', 210),
('411', '2019-09-09', '2019-09-09', '2031-03-15',  'Ford Raptor', 'KLMA4586', '63000', '711', 211),
('412', '2020-10-29', '2020-10-29', '2027-02-22',  'Triumph SpitFire', 'KLMA3625', '360000', '712', 212),
('413', '2018-11-30', '2018-11-30', '2023-09-21',  'AMC Gremlin', 'KLMA2525', '990000', '713', 213),
('414', '2016-06-02', '2016-06-02', '2020-10-27',  'Bentley Mulsanne', 'KLMA2222', '330000', '714', 214),
('415', '2009-04-03', '2009-04-03', '2024-12-01',  'Ford Thunderbird', 'KLMA3636', '690000', '715', 215),
('416', '2008-02-08', '2008-02-08', '2026-11-02',  'Porsche Carrera', 'KLMA2658', '100000', '716', 216),
('417', '2014-12-06', '2014-12-06', '2028-10-29',  'Dodge Viper', 'KLMA2659', '100000', '717', 217),
('418', '2017-04-01', '2017-04-01', '2025-02-08',  'Ferrari Testarossa', 'KLMA6984', '3600000', '718', 218),
('419', '2019-03-24', '2019-03-24', '2022-02-04',  'Rolls-Royce Silver Cloud', 'KLMA2569', '30000', '719', 219),
('420', '2020-05-25', '2020-05-25', '2024-01-08',  'Ford Mustang', 'KLMA6698', '101000', '720', 220);


-- SELECT * FROM T11_QUOTE;
-- Table-15

INSERT INTO T11_STAFF VALUES 
('501','Deepanshu','Sachdeva','Ghaziabad',7126589754,'M','Unmarried','Indian','B.Tech',125000, 665897, 'Dun & Bradstreet Private Limited' ),
('502','Harley','Mcquiene','Hyderabad',9784632589,'F','Married','Indian','B.Sc',170000, 568947, 'Reliance Life Insurance Corporation Limited' ),
('503','Pranjal','Aggarwal','Varanasi',9874535698,'M','Unmarried','Indian','B.Tech',200000, 365478, 'Bupa Insurance Group' ),
('504','Shubham','Sharma','Gwalior',8974632859,'M','Unmarried','Indian','B.Tech',300000, 698421, 'Aviva Insurance Company Limited' ),
('505','Nikita','Reddy','Lucknow',8974536254,'F','Unmarried','Indian','B.Tech',50000, 369857, 'Birkshire Hathaway Inc.' ),
('506','Vinita','Yadav','Hyderabad',8945623485,'F','Unmarried','Indian','MBA',90000, 321457, 'The Hartford Financial Services Group, Inc.' ),
('507','Arjun','Gupta','Delhi',8974536589,'M','Unmarried','Indian','B.Tech',658000, 321123, 'Bharti AXA General Insurance Company Limited' ),
('508','Raksha','Saxena','Bhopal',5647896325,'F','Married','Indian','BCom',456000, 987789, 'PNB Insurance Company Limited' ),
('509','Rohan','Jain','Indore',8974569354,'M','Married','Indian','B.Tech',985000, 369852, 'AAR Insurance, Kenya' ),
('510','Tauheed','Ahmed','Srinagar',8974652389,'M','Unmarried','Indian','B.Tech',23000, 123854, 'American International Group, Inc.' ),
('511','Rohit','Maheshwari','Ludhiana',9635478512,'M','Married','Indian','BCom',990000, 369159, 'SBI Insurance Company Limited' ),
('512','Vikas','Singh','Mumbai',6578963245,'M','Married','Indian','B.Tech',569800, 987412, 'Tata Insurance Company Limited' ),
('513','Raghav','Jain','Patna',8974563287,'M','Unmarried','Indian','B.Sc',695000, 366221, 'Reliance Vehicle Insurance Company Limited' ),
('514','Kaustub','Rawat','Mirzapur',8974563287,'F','Married','Indian','B.Tech',50000, 125698, 'Aegon Insurance Company Limited' ),
('515','Malay','Sharma','Ghaziabad',8974562375,'M','Married','Indian','B.Com',70000, 363363, 'Sharma Insurance Company Limited' ),
('516','Kratika','Parashar','Pune',8974563874,'M','Married','Indian','B.Tech',690000, 984562,'DP International Vehicle Insurance Limited' ),
('517','Sameer','Verma','Gangtok',9874563285,'M','Unmarried','Indian','B.Tech',658000, 321111, 'DLF Pramerica Insurance Company Limited' ),
('518','Hritika','Sharma','Chennai',8974563278,'F','Married','Indian','MBA',63000, 156987, 'IDBI Insurance Company Limited' ),
('519','Sonalika','Bhide','Pune',8974563874,'F','Married','Indian','MBA',650000, 235694, 'Vehicles Association of India' ),
('520','Ayush','Khanna','Hubballi',9857463248,'M','Married','Indian','B.Tech',56000, 123123, 'Life Insurance Corporation of India Limited' );

-- SELECT * FROM T11_STAFF;









INSERT INTO T11_PRODUCT values
(500000, 'Car','101' ,'Dun & Bradstreet Private Limited'),
(65322, 'Bike','102' ,'Dun & Bradstreet Private Limited'),
(1000000, 'Truck','103' ,'Dun & Bradstreet Private Limited'),
(800000, 'Car','101' ,'Reliance Life Insurance Corporation Limited'),
(9600000, 'Car','101' ,'The Hartford Financial Services Group, Inc.'),
('50000', 'Bike','102' ,'Bharti AXA General Insurance Company Limited'),
('350000', 'Car','101' ,'AAR Insurance, Kenya'),
('42000', 'Bike', '102' ,'American International Group, Inc.'),
('30000', 'Bike', '102' ,'SBI Insurance Company Limited'),
('100000', 'Truck', '103' ,'Tata Insurance Company Limited'),
('96000', 'Bike', '102' ,'Reliance Life Insurance Corporation Limited'),
('22000', 'Bike', '102' ,'Aegon Insurance Company Limited'),
('1200000', 'Car', '101' ,'Sharma Insurance Company Limited'),
('3200000', 'Truck', '103' ,'DP International Vehicle Insurance Limited'),
('6600000', 'Car', '101' ,'DLF Pramerica Insurance Company Limited'),
('35000', 'Bike', '102' ,'IDBI Insurance Company Limited'),
('360000', 'Car', '101' ,'Vehicles Association of India'),
('520000', 'Car', '101' ,'Life Insurance Corporation of India Limited');

-- SELECT * FROM T11_PRODUCT;


INSERT INTO T11_NOK VALUES 
('101','Deepanshu Sachdeva','Uttar Pradesh','999663552','Male', 'Married','601' ,'702' ,201),
('102','Pranjal Aggarwal','Andhra Pradesh','9253641112','Male', 'Single','602' ,'702' ,202),
('103','Arrohi Shindey','Himachal pradesh','8569452361','Female', 'Married','603' ,'703' ,203),
('104','Vinita Yadav','Uttarakhand','9632584113','Female', 'Married','604' ,'704' ,203),
('105','Shubham Sharma','Madhya Pradesh','7459632145','Male', 'Single','605' ,'705' ,203),
('106','Virat Kohli','Hyderabad','6569658475','Male', 'Married','606' ,'706' ,204),
('107','Rajeev kumar','Banglore','8456974125','Male', 'Single','607' ,'706' ,205),
('108','Rakesh Roshan','Kolkata','8569745896','Male', 'Divorced','608' ,'706' ,206),
('109','Babu Bhaiya','Jaipur','9685741256','Male', 'Divorced','609' ,'706' ,207),
('110','Rajeev Aggarwal','Mussorie','7458963256','Male', 'Single','607' ,'707' ,210),
('111','Shilpa Shetty','Mysore','9658632569','Female', 'Married','608' ,'710' ,211),
('112','Arvind Kumar','Hyderabad','9685741256','Male', 'Divorced','609' ,'710' ,212),
('113','Riya Sharma','Banglore','8536952145','Female', 'Single','610' ,'711' ,213),
('114','Simran Sachdeva','Himachal Pradesh','8542369685','Female', 'Married','612' ,'711' ,214),
('115','Divyanshi Lal','Kolkata','6352968574','Female', 'Single','612' ,'712' ,215),
('116','Tannu Mehta','Ghaziabad','7425369854','Male', 'Divorced','612' ,'713' ,213),
('117','Sonu Yadav','Meerut','7456985632','Male', 'Married','615' ,'713' ,214),
('118','Hitesh Chauhan','Hyderabad','8569632541','Male', 'Single','614' ,'715' ,213);


-- SELECT * FROM T11_NOK;







INSERT INTO T11_OFFICE VALUES 
 ('Central Perk', 'Bimad Ranar', '1212121212', 'Beirut', '1205000','201', 'Dun & Bradstree Vehicle Insurance Division','Dun & Bradstreet Private Limited'),
 ('VIP Lane', 'Taimur', '2323232323', 'Dehradun', '5300000','202','Reliance Vehicle Insurance Division', 'Reliance Life Insurance Corporation Limited'),
 ('CentralPerk', 'Rai Chand', '5858585858', 'Bangalore', '6600000','203', 'Bupa Vehicle Division','Bupa Insurance Group'),
 ('Gandhi Marg', 'Tej Bahadur', '3131311333', 'Dehradun', '95060000','204','Aviva Vehicles Inusrance','Aviva Insurance Company Limited'),
 ('Central', 'Danni', '4747474747', 'Beirut', '1600000','205', 'BH Vehicles', 'Birkshire Hathaway Inc.'),
 ('KM Office', 'Danzzongpa', '3245678541', 'Beirut', '10099000','206', 'Hartford Vehicles Division','The Hartford Financial Services Group, Inc.'),
 ('SR marg', 'Rawat', '8769543211', 'Raichur', '1800000','207', 'Bharti Vehicles','Bharti AXA General Insurance Company Limited'),
 ('OP chaudhary', 'KR Bhatt', '2341675897', 'Dehradun', '61900000','208', 'PNB Vehicles Division', 'PNB Insurance Company Limited'),
 ('Taj', 'Kotwal', '9876987652', 'Raichur', '1100000','209', 'AAR Veh Ins', 'AAR Insurance, Kenya'),
 ('Perk', 'Uma shankar', '4356273891', 'Delhi', '10008000','210', 'AIG Vehicle Solutions','American International Group, Inc.'),
 ('Centrol', 'Sherry Y', '678781155', 'Raichur', '7770000','211', 'SBI Vehicle Solutions','SBI Insurance Company Limited'),
('Hatti', 'Phulwa', '98483356733', 'Lucknow', '1340000','212', 'Tata Vehicle Insurances','Tata Insurance Company Limited'), 
('Swoosh', 'Reena Devi', '8900678456', 'Beirut', '1780000','213', 'Reliance Vehicles','Reliance Vehicle Insurance Company Limited'),
('CCD', 'Phoebe', '5678904357', 'Capetown', '560000','214', 'Aegon Vehicle Solutions','Aegon Insurance Company Limited'),
('KFC', 'Margaret', '9090887766', 'Bangalore', '150000','215', 'Sharma Insurances','Aegon Insurance Company Limited'), 
('Express', 'Hitler', '142543678', 'Hyderbad', '1870000','216', 'DP Vehicle Insurance', 'DP International Vehicle Insurance Limited'),
('TeaState', 'Kim Jong Yun', '7117171717', 'Dehradun', '1540000','217', 'DLF Vehicle Division', 'DLF Pramerica Insurance Company Limited'), 
('ChaiShai', 'Ashton', '8484884484', 'Capetown', '1670000','218', 'IDBI Vehicles Division','IDBI Insurance Company Limited'), 
('RK puram', 'Jaya', '9801111111', 'Delhi', '1900000','219','VAI Vehicles', 'Vehicles Association of India'),
('Moti bagh', 'Bahaduri', '6666000222', 'Beirut', '850000','220', 'LIC Vehicle Insurance','Life Insurance Corporation of India Limited'),
('Bakshi', 'B Birla', '6666000222', 'Dehradun', '150000','220', 'IDBI Vehicles Division','IDBI Insurance Company Limited');
-- ('Talab', 'B Birla', '6666000222', 'Pune', '185678','20', 'Audit Department','Future Generali India Insurance'),
-- ('MK gandhi', 'Mk gandhi', '6666000222', 'Dehradun', '8850000','51520', 'Legal Department','Geico'),
-- ('Nehru Marg', 'Satyam', '6666000222', 'Dehradun', '1850000','51520', 'Audit Department','Geico');

-- SELECT * FROM T11_OFFICE;


INSERT INTO T11_COVERAGE VALUES 
('1301', '4010000', 'Personal Injury Coverage', 'HIGH', 'SUV1201', 'Personal injury protection will cover all the costs associated with the accident', '1 Year', 'Dun & Bradstreet Private Limited'),
('1302', '2520000', 'Liability Coverage', 'HIGH', 'SUV1202', 'Covers the medical bills of the third party due to hospitalization or medical treatment', '8 Months', 'Reliance Life Insurance Corporation Limited'),
('1303', '350000', 'Personal Injury Coverage', 'LOW', '1203', 'Personal injury protection will cover all the costs associated with the accident', '8 Months', 'Bupa Insurance Group'),
('1304', '409000', 'Personal Injury Coverage', 'LOW', 'TS1204', 'Personal injury protection will cover all the costs associated with the accident', '2 Years', 'Aviva Insurance Company Limited'),
('1305', '180000', 'Liability Coverage', 'MEDIUM', 'TRYU1205', 'Covers the medical bills of the third party due to hospitalization or medical treatment', '8 Months', 'Birkshire Hathaway Inc.'),
('1306', '660000', 'Personal Injury Coverage', 'HIGH', 'SUV1206', 'Personal injury protection will cover all the costs associated with the accident', '13 Months', 'Aviva Insurance Company Limited'),
('1307', '970000', 'Collision Coverage', 'MEDIUM', 'TSC1207', 'the insurance company will bear your car repair expenses after the accident.', '18 Months', 'Birkshire Hathaway Inc.'),
('1308', '800000', 'Liability Coverage', 'MEDIUM', 'TRS1208', 'Covers the medical bills of the third party due to hospitalization or medical treatment', '15 Months', 'Birkshire Hathaway Inc.'),
('1309', '190000', 'Personal Injury Coverage', 'LOW', 'TFGH1209', 'Personal injury protection will cover all the costs associated with the accident', '5 Months', 'Aviva Insurance Company Limited'),
('1310', '150000', 'Comprehensive Coverage', 'LOW', 'YUHG1210', 'The comprehensive policy will cover various aspects which are outside the purview of the collision of the vehicle.', '8 Months', 'Birkshire Hathaway Inc.'),
('1311', '987000', 'Uninsured Motorist Protection', 'MEDIUM', 'SUV1211', 'If your vehicle is hit by another vehicle which is not covered by any insurance policy', '1 Year', 'Aviva Insurance Company Limited'),
('1312', '231000', 'Collision Coverage', 'MEDIUM', 'SUV1212', 'the insurance company will bear your car repair expenses after the accident.', '1 Months', 'Birkshire Hathaway Inc.'),
('1313', '553000', 'Personal Injury Coverage', 'HIGH', 'SUV1213', 'Personal injury protection will cover all the costs associated with the accident', '3 Years', 'Birkshire Hathaway Inc.'),
('1314', '700500', 'Personal Injury Coverage', 'MEDIUM', 'NX1214', 'Personal injury protection will cover all the costs associated with the accident', '1 Year', 'Aviva Insurance Company Limited'),
('1315', '659000', 'Liability Coverage', 'MEDIUM', 'NX1215', 'Covers the medical bills of the third party due to hospitalization or medical treatment', '18 Months', 'Aviva Insurance Company Limited'),
('1316', '504000', 'Comprehensive Coverage', 'LOW', 'NX1216', 'The comprehensive policy will cover various aspects which are outside the purview of the collision of the vehicle.', '8 Months', 'Birkshire Hathaway Inc.'),
('1317', '777000', 'Liability Coverage', 'LOW', 'LA1217', 'Covers the medical bills of the third party due to hospitalization or medical treatment', '8 Months', 'Aviva Insurance Company Limited'),
('1318', '111000', 'Collision Coverage', 'HIGH', 'TSV1218', 'the insurance company will bear your car repair expenses after the accident.', '15 Months', 'Birkshire Hathaway Inc.'),
('1319', '999000', 'Personal Injury Coverage', 'LOW', 'SUV1219', 'Personal injury protection will cover all the costs associated with the accident', '1 Year', 'Birkshire Hathaway Inc.'),
('1320', '1009000', 'Uninsured Motorist Protection', 'LOW', 'SUV1220', 'If your vehicle is hit by another vehicle which is not covered by any insurance policy', '1 Year', 'Birkshire Hathaway Inc.');

-- SELECT * FROM T11_COVERAGE;


#11_INSURANCE_POLICY_COVERAGE
INSERT INTO T11_INSURANCE_POLICY_COVERAGE VALUES
	-- ( '601','701', '201',1311,"Dun & Bradstreet Private Limited" );
    ( '601','701', 201,1301,"Reliance Life Insurance Corporation Limited"),
    ( '602','702', 202,1307,"Bupa Insurance Group"),
    ( '603','703', 203,1320,"Aviva Insurance Company Limited"),
    ( '604','704', 204,1316,"Birkshire Hathaway Inc."),
     ( '605','705', 205,1310,"Aviva Insurance Company Limited"),
     ( '606','707', 207,1312,"Birkshire Hathaway Inc."),
     ( '607','708', 208,1314,"Birkshire Hathaway Inc."),
     ( '608','709', 209,1317,"Aviva Insurance Company Limited"),
     ( '609','710', 210,1318,"Birkshire Hathaway Inc."),
     ( '610','711', 211,1319,"Aviva Insurance Company Limited"),
     ( '611','711', 211,1306,"Aviva Insurance Company Limited"),
     ( '612','712', 212,1308,"Birkshire Hathaway Inc."),
   ( '613','714', 214,1301,"Birkshire Hathaway Inc."),
     ( '614','714', 214,1302,"Aviva Insurance Company Limited"),
     ( '615','715', 215,1304,"Aviva Insurance Company Limited"),
     ( '616','716', 216,1315,"Birkshire Hathaway Inc."),
     ('617' ,'717', 217,1305,"Birkshire Hathaway Inc."),
     ( '618','717', 217,1313,"Birkshire Hathaway Inc.");
    
-- SELECT * FROM T11_INSURANCE_POLICY_COVERAGE;


INSERT INTO T11_CLAIM VALUES
	('1401','601' ,'650000','50101' ,'Windshield damage','1979-12-20','Approved',202),
    ('1402','602' ,'400000','50102' ,'Animal collisions','1999-02-27','Approved',204),
	('1403', '603','2000','50103' ,'Accident','1983-01-12','Approved',208),
	('1404', '604','180000','50104' ,'Windshield damage','2019-02-23','Rejected',212),
	('1405', '605','185000', '50105','Vandalism','1986-08-10','Approved',214),
	('1406', '606','270000','50106' ,'Animal collision','2024-08-23','Pending',217),
	('1407', '607','1255000','50107' ,'Accident','2005-10-04','Pending',219),
    ('1408','608' ,'400500','50101' ,'Windshield damage','1990-01-10','Rejected',202),
    ('1409','609' ,'270000','50102' ,'Animal collisions','1989-11-27','Rejected',204),
	('1410', '610','50000','50103' ,'Accident','1990-06-13','Approved',208),
	('1411', '611','65000000','50104' ,'Windshield damage','2018-09-19','Approved',205),
	('1412', '612','1200000', '50105','Vandalism','2001-02-05','Approved',214),
	('1413', '613','270000','50106' ,'Animal collision','2024-08-20','Pending',216),
	('1414', '614','197800','50107' ,'Accident','2002-10-15','Pending',219),
	('1415', '615','450000', '50105','Vandalism','2019-03-09','Approved',214),
	('1416', '616','108000','50106' ,'Animal collision','1989-01-09','Approved',216),
	('1417', '617','450000','50107' ,'Accident','2019-12-19','Rejected',219),
	('1418', '618','4005500', '50105','Vandalism','2010-02-11','Rejecetd',214);
	-- ('1419', '619','270000','50106' ,'Animal collision','2024-08-23','Rejected','50216'),
-- 	('1420', '620','350000','50107' ,'Accident','2010-04-12','Rejected','50219');


-- SELECT * FROM T11_CLAIM;


INSERT INTO T11_CLAIM_SETTLEMENT VALUES
	('1501','108','1980-12-23','650000', '1301', '1401', 204),
	('1502','105','1983-05-02','200500', '1302', '1403',208),
	('1503','102','1987-08-10','185000', '1313', '1405',214),
	('1504','114','1989-04-29','108000', '1304', '1416',219),
	('1505','119','1990-10-25','400500', '1315', '1408',202),
	('1506','116','1990-09-17','270000', '13014', '1409',204),
	('1507','113','1990-11-30','50000', '1307', '1410',208),
	('1508','102','1999-07-09','400000', '1308', '1402',214),
	('1509','111','2004-11-03','197800', '1309', '1414',219),
	('1510','113','2004-02-18','1200000', '1310', '1412',214),
	('1511','107','2005-11-24','1255000', '1311', '1407',219),
	('1512','120','2010-08-01','4005500', '1312', '1418',214),
	('1513','117','2011-04-12','350000', '1305', '1418',219),
    ('1514','111','2019-09-09','65000000', '1320', '1411', 202);



-- SELECT * FROM T11_CLAIM_SETTLEMENT;








