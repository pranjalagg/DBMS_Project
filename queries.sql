--QUERY - 5

SELECT v.* FROM T11_VEHICLE AS v, T11_Customer AS c,
T11_PREMIUM_PAYMENT AS pp
WHERE c.T11_Cust_Id = v.T11_Cust_Id AND c.T11_Cust_Id = pp.T11_Cust_Id AND
v.T11_Vehicle_Number < pp.T11_Premium_Payment_amount
ORDER BY v.T11_Vehicle_Id ASC;



--QUERY - 1
 SELECT cust.*, v.* FROM T11_Customer AS cust,
 T11_Vehicle AS v,
 T11_Incident_Report AS ir,
T11_Claim AS c
WHERE ir.T11_Cust_Id = cust.T11_Cust_Id
AND c.T11_Cust_Id = cust.T11_Cust_Id AND c.T11_Claim_Status = 'Pending';



-- QUERY 6
SELECT cust.* , c.t11_claim_amount , cov.t11_coverage_amount,cs.T11_Claim_Id, cs.T11_Coverage_Id,cs.T11_Claim_Settlement_Id,cs.T11_Vehicle_Id FROM T11_Customer AS cust,
	T11_Claim_Settlement AS cs,
    T11_Claim AS c,
    T11_Coverage AS cov
	WHERE cust.T11_Cust_Id = cs.T11_Cust_Id
	AND cs.T11_Claim_Id = c.T11_Claim_Id
	AND cs.T11_Coverage_Id = cov.T11_Coverage_Id
	AND c.T11_Claim_Amount < cov.T11_Coverage_Amount
	AND c.T11_Claim_Amount > (SELECT SUM(cs.T11_Claim_Id + 
								cs.T11_Coverage_Id +
								cs.T11_Claim_Settlement_Id
                                + cs.T11_Vehicle_Id)
                                FROM T11_Claim_Settlement AS cs);



-- QUERY 2
SELECT cust.*,pp.* FROM T11_Customer AS cust, T11_PREMIUM_PAYMENT AS pp
WHERE pp.T11_Cust_Id = cust.T11_Cust_Id 
HAVING (SELECT SUM(cust.T11_Cust_Id) FROM T11_Customer AS cust) < (T11_Premium_Payment_Amount);








-- QUERY 3


SELECT 
    *
FROM
    t11_INSURANCE_COMPANY
WHERE
        t11_Company_Name IN (SELECT 
            t11_DEPARTMENT.t11_Company_Name
        FROM
            t11_PRODUCT
                INNER JOIN
            t11_DEPARTMENT ON t11_DEPARTMENT.t11_Company_Name = t11_PRODUCT.t11_Company_Name
        GROUP BY t11_DEPARTMENT.t11_Company_Name
        HAVING COUNT(DISTINCT (t11_Product_Type)) > COUNT(DISTINCT (t11_Department_Name)));






