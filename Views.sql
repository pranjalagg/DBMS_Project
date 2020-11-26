USE Vehicle_Insurance;

-- View for Company Insurance Employee 

CREATE VIEW T11_Company_Insurance_Employee_View AS
SELECT c.T11_Cust_FNAME, c.T11_Cust_LNAME, ip.* FROM T11_Customer AS c
INNER JOIN T11_Insurance_Policy AS ip
ON ip.T11_Cust_Id = ip.T11_Cust_Id;

SELECT * FROM T11_Company_Insurance_Employee_View;

-- View For Head of Department

CREATE VIEW T11_HOD_View AS
SELECT s.T11_Staff_Id, s.T11_Staff_FName, s.T11_Staff_LName, 
s.T11_Staff_Adress, s.T11_Staff_Allowance, s.T11_Company_Name
FROM T11_Staff AS s;

SELECT * FROM T11_HOD_View;