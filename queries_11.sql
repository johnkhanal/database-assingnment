/*
DATABASE 2 ASSIGNMENT

GROUP MEMBER'S
AAYUSH SHERPA 18406507
JOHN KHANAL 18406497
ROJEN TAMANG 18419711
SUSHANT ADHIKARI 18413691
*/


-- CREATE TABLE COMMANDS
-- @C:\Temp\CSY2038(RM)\ASSIGNMENT\create_11.sql


-- formatting columns 
SET LINESIZE 220;
SET PAGESIZE 100;

-- query to view all tables
SELECT * FROM TAB;

-- query to view constraints
SELECT constraint_name FROM user_constraints;

--query to view objects
SELECT object_name, object_type FROM user_objects;

--query to view data of addresses
COLUMN city FORMAT A20
COLUMN street FORMAT A20
COLUMN country FORMAT A20
COLUMN postal_code FORMAT A15
SELECT * FROM addresses;

-- viewing data of audit_festival_staff
SELECT * FROM audit_festival_staff;

-- viewing data of audit_festival_staff
COLUMN event_type FORMAT A15
COLUMN logon_date FORMAT A15
COLUMN logon_time FORMAT A15
COLUMN logoff_date FORMAT A15
COLUMN logoff_time FORMAT A15
SELECT * FROM audit_user_event;

-- viewing data of festivals
COLUMN festival_name FORMAT A20
COLUMN date_description FORMAT A50
SELECT * FROM festivals;

-- viewing data of festival_natures
COLUMN nature_type FORMAT A20
COLUMN category FORMAT A20
SELECT * FROM festival_natures;

-- viewing data of festival_staff
COLUMN festival_staff_date FORMAT A10
SELECT f.festival_staff_id festival_staff_id, f.staff_id staff_id, f.nature_id nature_id, f.ward_id ward_id, f.festival_staff_date festival_staff_date, 
s.staff_id staff_id, s.hours_worked hours_worked
FROM festival_staff f, TABLE(f.staff_pay) s;

-- viewing data of locations
COLUMN WardNo FORMAT A12
COLUMN Address FORMAT A15
COLUMN City FORMAT A15
COLUMN Country FORMAT A12
COLUMN Theme FORMAT A20
COLUMN Description FORMAT A25
SELECT l.ward_id WardId, l.ward.ward_no WardNo, l.ward.address Address, h.address.city City, h.address.country Country, h.theme Theme, h.area Area, h.hall.capacity Capacity, h.hall.description Description
FROM locations l,TABLE(l.hall) h;

-- viewing data of staff
COLUMN staff_id FORMAT 9999
COLUMN FirstName FORMAT A15
COLUMN LastName FORMAT A15
COLUMN gender FORMAT A6
COLUMN Email FORMAT A25
COLUMN phonenumber1 FORMAT A14
COLUMN phonenumber2 FORMAT A14
COLUMN fax FORMAT A15
COLUMN date_of_birth FORMAT A15
COLUMN Role FORMAT A12
SELECT s.staff_id, s.staff_first_name FirstName, s.staff_last_name LastName, s.gender, s.email_id Email, s.contact.phone_number1 phonenumber1, s.contact.phone_number2 phonenumber2,s.contact.fax_no fax, s.date_of_birth, s.instructor_id Instructor, s.role Role, s.pay_rate
FROM staff s;

-- describing all tables
DESC addresses;
DESC audit_festival_staff;
DESC audit_user_event;
DESC festivals;
DESC festival_natures;
DESC festival_staff;
DESC locations;
DESC location_table;
DESC staff;

-- viewing data of staff with instructor name and surname
COLUMN staff_id FORMAT 9999
COLUMN FirstName FORMAT A15
COLUMN LastName FORMAT A15
COLUMN gender FORMAT A6
COLUMN Email FORMAT A25
COLUMN phonenumber1 FORMAT A14
COLUMN date_of_birth FORMAT A15
COLUMN Instructor FORMAT A12
COLUMN Surname FORMAT A12
COLUMN Role FORMAT A12
SELECT s.staff_id, s.staff_first_name FirstName, s.staff_last_name LastName, s.gender, s.email_id Email, s.contact.phone_number1 phonenumber1, i.staff_first_name Instructor, i.staff_last_name Surname, s.role Role, s.pay_rate
FROM staff s
JOIN staff i ON s.instructor_id=i.staff_id;


-- viewing pay rate of staff
COLUMN staff_id FORMAT 9999
COLUMN FirstName FORMAT A15
COLUMN LastName FORMAT A15
COLUMN gender FORMAT A6
SELECT i.staff_first_name FirstName, SUM(s.pay_rate)
FROM staff s
JOIN staff i ON s.instructor_id=i.staff_id
GROUP BY i.staff_first_name
HAVING SUM(s.pay_rate)>&pay_rate;

-- viewing staffs whose name start with A
COLUMN staff_id FORMAT 9999
COLUMN FirstName FORMAT A15
COLUMN LastName FORMAT A15
COLUMN gender FORMAT A6
COLUMN Email FORMAT A25
COLUMN phonenumber1 FORMAT A14
COLUMN phonenumber2 FORMAT A14
COLUMN fax FORMAT A15
COLUMN date_of_birth FORMAT A15
COLUMN Role FORMAT A12
SELECT s.staff_id, s.staff_first_name FirstName, s.staff_last_name LastName, s.gender, s.email_id Email, s.contact.phone_number1 phonenumber1, s.contact.phone_number2 phonenumber2,s.contact.fax_no fax, s.date_of_birth, s.instructor_id Instructor, s.role Role, s.pay_rate
FROM staff s
WHERE staff_first_name LIKE 'A%';

-- viewing staff details from staff id
COLUMN staff_id FORMAT 9999
COLUMN staff_first_name FORMAT A20
COLUMN staff_last_name FORMAT A20
SELECT staff_id, staff_first_name, staff_last_name
FROM staff
WHERE staff_id LIKE '&staff_id';

-- viewing  location with rent more than or euqal to 15000
SELECT ward_id, rent
FROM locations
WHERE rent >= 15000;

-- viewing rent which isn't 15000 from table locations
SELECT ward_id, rent
FROM locations
WHERE rent != 15000;

--  viewing staffs whose payrate is 25
SELECT staff_id, staff_first_name, pay_rate
FROM staff
WHERE pay_rate = 25;

-- viewing staffs whose payrate isn't 35
SELECT staff_id, staff_first_name, pay_rate
FROM staff
WHERE pay_rate <> 35;

-- viewing female staff
SELECT staff_id, staff_first_name, gender
FROM staff
WHERE gender IN ('F');

-- viewing male staff
SELECT staff_id, staff_first_name, gender
FROM staff
WHERE gender NOT IN ('F');

-- viewing staffs whose pay_rate is between 18 and 27
SELECT staff_id, staff_first_name, pay_rate
FROM staff
WHERE pay_rate BETWEEN '18' AND '27';

-- viewing staffs whose pay_rate isn't between 18 and 27
SELECT staff_id, staff_first_name, pay_rate
FROM staff
WHERE pay_rate NOT BETWEEN '18' AND '27';

-- viewing festivals which start from B to J
SELECT nature_id, festival_name
FROM festivals
WHERE festival_name BETWEEN 'B%' AND 'J%';

-- viewing staffs whose last name starts from O or more
SELECT staff_id, staff_first_name, staff_last_name
FROM staff
WHERE staff_last_name > 'O%';

-- viewing male staffs whose role second letter is A
SELECT staff_id, staff_first_name, role, gender 
FROM staff
WHERE role LIKE '_A%'
AND gender ='M';

-- viewing staffs who wore born after 1-MAR-1996
SELECT staff_id, staff_first_name, staff_last_name, date_of_birth
FROM staff 
WHERE date_of_birth>'1-MAR-1995' OR date_of_birth<'1-MAR-1990';

-- viewing staffs who wore born between 1-JAN-1991 and 1-JAN-1999
SELECT staff_id, staff_first_name, staff_last_name, date_of_birth
FROM staff 
WHERE date_of_birth BETWEEN'1-JAN-1991' AND '1-JAN-1999';

-- viewing the birth day staffs who wore born between 1-JAN-1991 and 1-JAN-1999
SELECT staff_id, staff_first_name, staff_last_name, to_char(date_of_birth,'DAY')
FROM staff
WHERE date_of_birth BETWEEN'1-JAN-1991' AND '1-JAN-1999';

-- viewing all different category of festivals
SELECT DISTINCT (category)
FROM festival_natures;

-- viewing how many different roles are there in table staff
SELECT COUNT(*) AS  number_of_roles
FROM (SELECT DISTINCT role FROM staff);

-- viewing minimum pay rate of table staff
SELECT MIN(pay_rate)
FROM staff;

-- viewing maximum rent of table locations
SELECT MAX(rent)
FROM locations;

-- viewing the sum of all pay rate from table staff
SELECT SUM(pay_rate) AS total_pay_rate
FROM staff;


-- using CONCAT, DREF
SELECT staff_id, CONCAT(staff_first_name, CONCAT(' ', staff_last_name)), DEREF(address) Name
FROM staff;

-- using CARTESSIAN PRODUCT
SELECT * FROM festival_natures, festivals;


-- querying organised festivals
SELECT nature_id, ward_id FROM festivals
INTERSECT
SELECT nature_id, ward_id FROM festival_staff;

-- querying all organised and non-organised festivals
SELECT nature_id, ward_id FROM festivals
UNION
SELECT nature_id, ward_id FROM festival_staff;

-- querying non-organised festivals
SELECT nature_id, ward_id FROM festivals
MINUS
SELECT nature_id, ward_id FROM festival_staff;

-- using FLOOR function
SELECT instructor_id, FLOOR(AVG(pay_rate))
FROM staff
GROUP BY instructor_id;

-- using FLOOR function
SELECT instructor_id, CEIL(AVG(pay_rate)) "Average Pay Rate"
FROM staff
GROUP BY instructor_id;

-- querying common data from festivals and festival_staff
SELECT f.festival_name 
FROM festivals f
WHERE f.nature_id = ANY (SELECT fs.nature_id 
					   FROM festival_staff fs);
					   
					  
-- querying common data from festivals and festival_staff
SELECT s1.instructor_id, s1.pay_rate 
FROM staff s1
WHERE s1.pay_rate > ALL (SELECT s.pay_rate 
					   FROM staff s WHERE s1.instructor_id != s1.staff_id);

-- querying staff who has organised atleast one event
SELECT fs.staff_id FROM festival_staff fs
WHERE fs.staff_id IN (SELECT s.instructor_id FROM staff s);


-- querying staff who has not organised atleast one event
SELECT DISTINCT(s.instructor_id) FROM staff s
WHERE s.instructor_id NOT IN (SELECT fs.staff_id FROM festival_staff fs);





-- for table 'audit_user_event'
COLUMN logon_date FORMAT A30;
COLUMN logon_t
ime FORMAT A30;
COLUMN logoff_date FORMAT A30;
COLUMN logoff_time FORMAT A30;

-- for table 'audit_festival_staff'
COLUMN user_name FORMAT A30;
COLUMN audit_date FORMAT A30;
COLUMN audit_operation FORMAT A30;

-- for table 'festival_staff'
COLUMN site_id FORMAT 999999;
COLUMN address FORMAT A55;
COLUMN classroom FORMAT A75;

-- for table 'staff'
COLUMN site_id FORMAT 999999;
COLUMN address FORMAT A55;
COLUMN classroom FORMAT A75;

