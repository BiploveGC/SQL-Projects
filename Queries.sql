SELECT CountryCode, CountryName, AverageIncome, EmploymentRate, TotalColleges
FROM Economy 
WHERE TotalColleges > 200;

SELECT CountryCode, CountryName, EmploymentRate, AverageIncome
FROM Economy
WHERE AverageIncome > 30000 ORDER BY AverageIncome DESC;

SELECT CountryCode, CountryName, Tanks, Aircrafts, MilitarySpending
FROM MILITARY
Where MilitarySpending > 100000 ORDER BY MilitarySpending DESC;

SELECT CountryCode, CountryName, InfantMortalityRate, Hospitals
FROM Health
WHERE Hospitals < 600 ORDER BY Hospitals ASC;

SELECT CountryCode, CountryName, Obesity, FreeHealthCare
FROM Health
WHERE FreeHealthCare = 'T';

SELECT Code, Name, Population, LifeExpectancy, GNP
FROM Country
WHERE Continent = 'South America';

SELECT Continent, AVG(LifeExpectancy) AS AvgLifeExpectancy
FROM country
GROUP BY Continent
LIMIT 5;

SELECT c.Name AS Country
FROM country c
JOIN economy e ON c.Code = e.CountryCode
WHERE e.EmploymentRate > 70;

SELECT c.Name AS Country, ci.Name AS Capital
FROM country c
JOIN City ci ON c.Capital = ci.ID;

SELECT c.Name AS Country, cl.Language, cl.Percentage
FROM country c
JOIN CountryLanguage cl ON c.Code = cl.CountryCode
ORDER BY Percentage DESC;

SELECT Name AS Country, GNP
FROM country
WHERE GNP = (SELECT MAX(GNP) FROM country)
ORDER BY GNP DESC;

SELECT c.Name AS Country
FROM Country c
JOIN Economy e ON c.Code = e.CountryCode
WHERE e.MainExports = 'Petroleum';

SELECT Continent, (SUM(Population) / (SELECT SUM(Population) FROM country)) * 100 AS PercentagePopulation
FROM country
GROUP BY Continent;


SELECT SUM(c.Population) AS TotalPopulation
FROM Country c
JOIN CountryLanguage cl ON c.Code = cl.CountryCode
WHERE cl.Language != 'English' AND cl.IsOfficial = 'T';

SELECT c.Name AS Country, c.SurfaceArea, c.Population, (c.Population / c.SurfaceArea) AS PopulationDensity
FROM Country c
ORDER BY PopulationDensity DESC;

SELECT c.Continent, AVG(e.AverageIncome) AS AverageIncome
FROM Country c
JOIN Economy e ON c.Code = e.CountryCode
GROUP BY c.Continent;

SELECT c.Name AS Country
FROM Country c
JOIN Health h ON c.Code = h.CountryCode
ORDER BY h.Hospitals / c.Population DESC
LIMIT 1;

SELECT CountryName, Hospitals
FROM HEALTH
WHERE Hospitals > (
    SELECT AVG(Hospitals / Population)
    FROM HEALTH AS h
    JOIN Country AS c ON h.CountryCode = c.Code
);

SELECT Name AS Country
FROM country
WHERE LifeExpectancy > (SELECT AVG(LifeExpectancy) FROM country);


SELECT c.Name AS Country
FROM Country c
JOIN Economy e ON c.Code = e.CountryCode
WHERE e.EmploymentRate > 70;



