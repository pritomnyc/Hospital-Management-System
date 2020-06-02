--Create Table Person
--New
CREATE TABLE PERSON
(
 Person_ID      NUMBER (4)    PRIMARY KEY,
 First_Name     VARCHAR2 (20) NOT NULL,
 Last_Name      VARCHAR2 (20) NOT NULL,
 Middle_Name    VARCHAR2 (20) NOT NULL,
 Street_Address VARCHAR2 (25) NOT NULL,
 City           VARCHAR2 (20) NOT NULL,
 State          VARCHAR2 (2)  NOT NULL,
 Zip_Code       VARCHAR2 (5)  NOT NULL,
 Country        VARCHAR2 (20) NOT NULL,
 Birth_Date     DATE          NOT NULL,
 Gender         VARCHAR2 (1)  NOT NULL,
 Phone          VARCHAR2 (10) NOT NULL,
 Email          VARCHAR2 (50) NULL,
 Is_Patient     VARCHAR2 (1)  NOT NULL,
 Is_Physician   VARCHAR2 (1)  NOT NULL,
 Is_Employee    VARCHAR2 (1)  NOT NULL,
 Is_Volunteer   VARCHAR2 (1)  NOT NULL
);


--Create Table PHYSICIAN

CREATE TABLE PHYSICIAN
(
 PHPerson_ID            NUMBER (4)    NOT NULL,
 Physician_Page_Number  VARCHAR2 (4)  NOT NULL,
 Physician_DEA_Number   VARCHAR2 (4)  NOT NULL UNIQUE,
 
 CONSTRAINT  PHPerson_ID_PK    PRIMARY KEY (PHPerson_ID),

 CONSTRAINT  PHPerson_ID_FK
 FOREIGN KEY (PHPerson_ID)
 REFERENCES  PERSON(Person_ID)
);

-- Create Table EMPLOYEE

CREATE TABLE EMPLOYEE
(
 EMPerson_ID            NUMBER (4)    NOT NULL,
 Date_Hired             DATE          NOT NULL,
 Employee_Type          VARCHAR2 (20) NOT NULL,

 CONSTRAINT  EMPerson_ID_PK    PRIMARY KEY (EMPerson_ID),

 CONSTRAINT  EMPerson_ID_FK
 FOREIGN KEY (EMPerson_ID)
 REFERENCES  PERSON(Person_ID)
);

-- Create Table INTEREST


CREATE TABLE INTEREST
(
 Interest_ID           NUMBER (2)    PRIMARY KEY,
 Interest_Description  VARCHAR2 (20) NOT NULL
);

-- Create Table Credit_Card


CREATE TABLE CREDIT_CARD
(
 Credit_Card_Number           NUMBER (16)     PRIMARY KEY,
 Owner_Name                   VARCHAR2 (50)   NOT NULL,
 Merchant_Name                VARCHAR2 (50)   NOT NULL,
 Exp_Date                     DATE            NOT NULL
);

-- Create Table Patient

CREATE TABLE PATIENT
(
 PAPerson_ID                NUMBER (4)     NOT NULL,
 First_Cotact_Date          DATE           NOT NULL,
 Emergency_Contact_Name     VARCHAR2 (50)  NOT NULL,
 Emergency_Contact_Number   VARCHAR2 (10)  NOT NULL,
 Patient_Type               VARCHAR2 (1)   NOT NULL,
 PHPerson_ID                NUMBER (4)     NOT NULL,

 CONSTRAINT  PAPerson_ID_PK    PRIMARY KEY (PAPerson_ID),
 

 CONSTRAINT  PAPerson_ID_FK
 FOREIGN KEY (PAPerson_ID)
 REFERENCES  PERSON(Person_ID),
 
 FOREIGN KEY (PHPerson_ID)
 REFERENCES  PHYSICIAN(PHPerson_ID)
);

-- Create Table PATIENT_CREDIT_CARD

CREATE TABLE PATIENT_CREDIT_CARD
(
 Credit_Card_Number         NUMBER (16)    NOT NULL,
 PAPerson_ID                NUMBER (4)     NOT NULL,
 
 
 PRIMARY KEY (Credit_Card_Number,PAPerson_ID),

 FOREIGN KEY (Credit_Card_Number)
 REFERENCES  CREDIT_CARD(Credit_Card_Number),
 
 FOREIGN KEY (PAPerson_ID)
 REFERENCES  PATIENT(PAPerson_ID)

);

-- Create Table INSURANCE_COMPANY

CREATE TABLE INSURANCE_COMPANY
(
 Insurance_Company_ID      NUMBER (4)    PRIMARY KEY,
 Insurance_Company_Name    VARCHAR2 (30) NOT NULL,
 Policy_Number             VARCHAR2 (7)  NOT NULL,
 Insurance_Phone_Number    VARCHAR2 (10)  NOT NULL
);

-- Create Table PATIENT_STUDENT_COVERAGE

CREATE TABLE PATIENT_INSURANCE_COVERAGE
(
 PAPerson_ID            NUMBER (4)    NOT NULL,
 Insurance_Company_ID   NUMBER (4)    NOT NULL,

 PRIMARY KEY (PAPerson_ID,Insurance_Company_ID),

 FOREIGN KEY (PAPerson_ID)
 REFERENCES  PATIENT(PAPerson_ID),
 
 FOREIGN KEY (Insurance_Company_ID)
 REFERENCES  INSURANCE_COMPANY(Insurance_Company_ID)

);

-- Create Table Volunteer

CREATE TABLE VOLUNTEER
(
 VOPerson_ID            NUMBER (4)     NOT NULL,
 Interest_ID            NUMBER (4)     NOT NULL,
 
 CONSTRAINT  VOPerson_ID_PK    PRIMARY KEY (VOPerson_ID),
 
 CONSTRAINT  VOPerson_ID_FK
 FOREIGN KEY (VOPerson_ID)
 REFERENCES  PERSON(Person_ID),
 
 FOREIGN KEY (Interest_ID)
 REFERENCES  INTEREST(Interest_ID)
);

-- Create Table Skill

CREATE TABLE SKILL
(
 VOPerson_ID         NUMBER (4)     NOT NULL,
 Skill_ID            NUMBER (4)     NOT NULL,

 PRIMARY KEY (VOPerson_ID,Skill_ID),
 
 FOREIGN KEY (VOPerson_ID)
 REFERENCES  VOLUNTEER(VOPerson_ID)
);

-- Create Table OUTPATIENT

CREATE TABLE OUTPATIENT
(
 OPAPerson_ID            NUMBER (4)    NOT NULL,
 Check_Back_DATE         DATE          NOT NULL,
 
 CONSTRAINT  OPAPerson_ID_PK    PRIMARY KEY (OPAPerson_ID),

 CONSTRAINT  OPAPerson_ID_FK
 FOREIGN KEY (OPAPerson_ID)
 REFERENCES  PATIENT(PAPerson_ID)
);

-- Create Table VISIT
CREATE TABLE VISIT
(
 OPAPerson_ID        NUMBER (4)     NOT NULL,
 Visit_Number        NUMBER (4)     NOT NULL,
 Visit_Date          DATE           NOT NULL,
 Visit_Time          NUMBER (4)     NOT NULL,


 PRIMARY KEY (OPAPerson_ID,Visit_Number),

 FOREIGN KEY (OPAPerson_ID)
 REFERENCES  OUTPATIENT(OPAPerson_ID)
);

-- Create Table CARE_CENTER

CREATE TABLE CARE_CENTER
(
 Care_Center_ID             NUMBER (4)     NOT NULL,
 Care_Center_Name           VARCHAR2 (50)  NOT NULL,
 Care_Center_Address        VARCHAR2 (50)  NOT NULL,
 EMPerson_ID                NUMBER (4)     NOT NULL,

 CONSTRAINT  Care_Center_ID_PK    PRIMARY KEY (Care_Center_ID),
  
 FOREIGN KEY (EMPerson_ID)
 REFERENCES  EMPLOYEE(EMPerson_ID)
);

-- Create Table VISIT_CARE_CENTER

CREATE TABLE VISIT_CARE_CENTER
(
 OPAPerson_ID            NUMBER (4)    NOT NULL,
 Visit_Number            NUMBER (4)    NOT NULL,
 Care_Center_ID          NUMBER (4)    NOT NULL,

 PRIMARY KEY (OPAPerson_ID,Visit_Number,Care_Center_ID),

 FOREIGN KEY (OPAPerson_ID,Visit_Number)
 REFERENCES  VISIT(OPAPerson_ID,Visit_Number),
 
 FOREIGN KEY (Care_Center_ID)
 REFERENCES  CARE_CENTER(Care_Center_ID)

);

-- Create Table BED_TYPE

CREATE TABLE BED_TYPE
(
 Bed_Type_ID              NUMBER (2)    PRIMARY KEY,
 Bed_Type_Description     VARCHAR2 (20) NOT NULL
);

-- Create Table BED
CREATE TABLE BED
(
 Bed_Number               NUMBER (4)     NOT NULL,
 Room_Number              NUMBER (4)     NOT NULL,
 Care_Center_ID           NUMBER (4)     NOT NULL,
 Bed_Type_ID              NUMBER (4)     NOT NULL,

 PRIMARY KEY (Bed_Number,Room_Number),
  
 FOREIGN KEY (Care_Center_ID)
 REFERENCES  CARE_CENTER(Care_Center_ID),

 FOREIGN KEY (Bed_Type_ID)
 REFERENCES  BED_TYPE(Bed_Type_ID)
);

-- Create Table Resident_Patient

CREATE TABLE RESIDENT_PATIENT
(
 RPAPerson_ID            NUMBER (4)    NOT NULL,
 Date_Admitted           DATE          NOT NULL,
 Date_Discharge          DATE          NOT NULL,
 Bed_Number              NUMBER (4)    NOT NULL,
 Room_Number             NUMBER (4)    NOT NULL,

 CONSTRAINT  RPAPerson_ID_PK    PRIMARY KEY (RPAPerson_ID),

 CONSTRAINT  RPAPerson_ID_FK
 FOREIGN KEY (RPAPerson_ID)
 REFERENCES  PATIENT(PAPerson_ID),

 FOREIGN KEY (Bed_Number,Room_Number)
 REFERENCES  BED(Bed_Number,Room_Number)
);

-- Create Table EMPLOYEE_ASSIGNED_CARE_CENTER
CREATE TABLE EMPLOYEE_ASSIGNED_CARE_CENTER
(
 EMPerson_ID            NUMBER (4)    NOT NULL,
 Care_Center_ID         NUMBER (4)    NOT NULL,
 Hours_Worked           VARCHAR2 (8)  NOT NULL,

 PRIMARY KEY (EMPerson_ID,Care_Center_ID),

 FOREIGN KEY (EMPerson_ID)
 REFERENCES  EMPLOYEE(EMPerson_ID),
 
 FOREIGN KEY (Care_Center_ID)
 REFERENCES  CARE_CENTER(Care_Center_ID)
);

-- Create Table VOLUNTEER_CARE_ASSIGNED_CENTER
CREATE TABLE VOLUNTEER_ASSIGNED_CARE_CENTER
(
 VOPerson_ID            NUMBER (4)    NOT NULL,
 Care_Center_ID         NUMBER (4)    NOT NULL,
 
 PRIMARY KEY (VOPerson_ID,Care_Center_ID),

 FOREIGN KEY (VOPerson_ID)
 REFERENCES  VOLUNTEER(VOPerson_ID),
 
 FOREIGN KEY (Care_Center_ID)
 REFERENCES  CARE_CENTER(Care_Center_ID)
);

-- Create Table WORK_UNIT
CREATE TABLE WORK_UNIT
(
 Work_Unit_ID           NUMBER (2)    PRIMARY KEY,
 Work_Unit_Description  VARCHAR2 (25) NOT NULL
);

-- Create Table VOLUNTEER_SUPERVISOR
CREATE TABLE VOLUNTEER_SUPERVISOR
(
PHPerson_ID NUMBER (4) NOT NULL,
EMPerson_ID NUMBER (4) NOT NULL,
VOPerson_ID NUMBER (4) NOT NULL,
Begin_Date DATE NOT NULL,
End_Date DATE NOT NULL,
Hours_Worked VARCHAR2 (8) NOT NULL,
Work_Unit_ID NUMBER (4) NOT NULL,
PRIMARY KEY (PHPerson_ID,VOPerson_ID,EMPerson_ID),
FOREIGN KEY (PHPerson_ID)
REFERENCES PHYSICIAN(PHPerson_ID),
FOREIGN KEY (EMPerson_ID)
REFERENCES EMPLOYEE(EMPerson_ID),
FOREIGN KEY (VOPerson_ID)
REFERENCES VOLUNTEER(VOPerson_ID),
FOREIGN KEY (Work_Unit_ID)
REFERENCES WORK_UNIT(Work_Unit_ID)
);

