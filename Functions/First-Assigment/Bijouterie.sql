--1
CREATE VIEW V_Triangles AS
SELECT *, ROUND(SQRT(POWER(LegA, 2) + POWER(LegB, 2)), 2) AS [Hypotenuse]
FROM Triangles;

SELECT * FROM V_Triangles;

--2
SELECT *, LegA + LegB + Hypotenuse AS [Perimeter]
FROM V_Triangles;