WITH Managers AS 
( 
--initialization 
SELECT StaffId, FirstName + ' ' + LastName FullName, CAST(FirstName + ' ' + LastName AS VARCHAR(500)) EmployeeHierarchy
FROM [dbo].[Staff]
WHERE ManagerId IS NULL 
UNION ALL 
--recursive execution 
SELECT e.StaffId, e.FirstName + ' ' + e.LastName FullName, CAST(m.EmployeeHierarchy + ',' + e.FirstName + ' ' + e.LastName AS VARCHAR(500)) EmployeeHierarchy
FROM [dbo].[Staff] e INNER JOIN Managers m  
ON e.ManagerId = m.StaffId 
) 
SELECT * FROM Managers  