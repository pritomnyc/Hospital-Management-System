--Insert into PERSON

Insert Into PERSON values (1111, 'Smith','Arnold' ,'Junior', '250 jay st','New York','NY',11013,'USA','01-APR-21','M',1111111111,'SJumior@etz.com', 'Y','N','N','N');
Insert Into PERSON values (2222, 'JOHN','RON' ,'POL', '350 banj st','New York','NY',11812,'USA','01-jun-12','F',3333333333,'Ssakfaklsr@etz.com', 'Y','N','N','N');
Insert Into PERSON values (3333, 'ANDY','JACK' ,'SAM', '100 brke st','New York','NY',11222,'USA','01-may-13','F',4444444444,'SsakfDSGDGsr@etz.com', 'Y','N','N','N');
Insert Into PERSON values (4444, 'MURRY','HAMR' ,'JEAMS', '225 BLAKE st','New York','NY',11225,'USA','02-APRIL-12','M',5555555555,'SDASGDGsr@etz.com', 'Y','N','N','N');
Insert Into PERSON values (5555, 'BENJY','DONALD' ,'KEN', '33 PITKIN st','New York','NY',11208,'USA','01-MAY-13','M',4747474747,'HHHHHH@etz.com', 'Y','N','N','N');
Insert Into PERSON values (6666, 'SIMON','ANDY' ,'JON', '150 brick st','New York','NY',11012,'USA','01-may-16','F',2222222222,'SABADBr@etz.com', 'N','Y','N','N');
Insert Into PERSON values (7777, 'RONY','AMY' ,'KELLY', '157 brOOK st','New York','NY',11014,'USA','01-may-17','M',1212121212,'SABAGGGr@etz.com', 'N','Y','N','N');
Insert Into PERSON values (8888, 'AMUN','DICKY' ,'ABU', '158 brOOK st','New York','NY',11015,'USA','01-may-15','F',2233445566,'VBVBVBV@etz.com', 'N','Y','N','N');
Insert Into PERSON values (9999, 'YOM','TOMY' ,'JELY', '159 brING st','New York','NY',11022,'USA','01-july-17','M',4545454545,'hwhwhwh@etz.com', 'N','Y','N','N');
Insert Into PERSON values (1010, 'ham','ken' ,'den', '145 jerold st','New York','NY',11033,'USA','01-may-11','F',6565656565,'JDJDSJ@etz.com', 'N','Y','N','N');



--Insert Into PHYSICIAN

Insert Into PHYSICIAN values (6666, 'PN12', 'DN12');
Insert Into PHYSICIAN values (7777, 'PN13', 'DN13');
Insert Into PHYSICIAN values (8888, 'PN14', 'DN14');
Insert Into PHYSICIAN values (9999, 'PN15', 'DN15');
Insert Into PHYSICIAN values (1010, 'PN16', 'DN16');



--Insert Into PATIENT

Insert Into PATIENT values (1111, '01-may-20', 'JOHN AROLD',1515151515,'O',6666);
Insert Into PATIENT values (2222, '01-JUN-20', 'RONY AMY',5151515151,'R',7777);
Insert Into PATIENT values (3333, '07-JULY-20', 'AMAN YOSI',1214252829,'O',8888);
Insert Into PATIENT values (4444, '01-AUGUST-20', 'MAN AMOR',1478963214,'R',9999);
Insert Into PATIENT values (5555, '01-JUN-19', 'CAMEL JO',1236547893,'O',1010);


--Insert Into CREDIT_CARD

Insert Into CREDIT_CARD values (1234567891234567, 'ARNOLD JOHN ', 'Wells Fargo Platinum card','01-may-21');
Insert Into CREDIT_CARD values (1122334455667788, 'SAMY JOHNES ', 'Chase Freedom Unlimited','01-JUN-22');
Insert Into CREDIT_CARD values (9988774455661122, 'ARON DON ', 'Capital One Visa','07-APRIL-22');
Insert Into CREDIT_CARD values (3322116655449988, 'RON PAUL ', 'Chase Freedom Visa','08-JUN-23');
Insert Into CREDIT_CARD values (7788445566991122, 'DON SAM ', 'Chase Diamond','09-MAY-21');


--Insert Into PATIENT_CREDIT_CARD

Insert Into PATIENT_CREDIT_CARD values (1234567891234567, 1111);
Insert Into PATIENT_CREDIT_CARD values (1122334455667788, 2222);
Insert Into PATIENT_CREDIT_CARD values (9988774455661122, 3333);
Insert Into PATIENT_CREDIT_CARD values (3322116655449988, 4444);
Insert Into PATIENT_CREDIT_CARD values (7788445566991122, 5555);


--Insert Into INSURANCE_COMPANY

Insert Into INSURANCE_COMPANY values (2211, 'United Health', 'DCV1234',1234125632);
Insert Into INSURANCE_COMPANY values (4321, 'Cigna Health', 'DCV3333',3698521479);
Insert Into INSURANCE_COMPANY values (3698, 'Blue Shield', 'DCV5896',9865321478);
Insert Into INSURANCE_COMPANY values (7894, 'Aetna', 'DCV4575',1472365984);
Insert Into INSURANCE_COMPANY values (8521, 'Metro Plus', 'ABC1236',9895624568);


--Insert Into PATIENT_INSURANCE_COVERAGE

Insert Into PATIENT_INSURANCE_COVERAGE values (1111, 2211);
Insert Into PATIENT_INSURANCE_COVERAGE values (2222, 4321);
Insert Into PATIENT_INSURANCE_COVERAGE values (3333, 3698);
Insert Into PATIENT_INSURANCE_COVERAGE values (4444, 7894);
Insert Into PATIENT_INSURANCE_COVERAGE values (5555, 8521);



--Insert into INTEREST

Insert Into INTEREST values (9, 'EMERGENCY ROOM');
Insert Into INTEREST values (10, 'PATIENT WARD');
Insert Into INTEREST values (11, 'ADMINISTRATIVE WORK');
Insert Into INTEREST values (12, 'RADIOLOGY WORK');
Insert Into INTEREST values (13, 'OUTPATIENT ROOM');