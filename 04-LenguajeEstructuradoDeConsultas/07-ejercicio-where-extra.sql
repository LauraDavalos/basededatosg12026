USE NORTHWIND;

-- Mostrar las ventas realizadas en francia brasil y belgica del 10 de julio de 1996 a diciembre del 98, que tenga 
Region de envio, para los clientes VICTE HANNAR Y SUPRD y ordenados por la fecha de pedidio de las mas cercanas a las más antiguas

SELECT 
o. OrderID AS numero_orden,
o.Customer AS cliente,
o.ShipCountry AS pais_envio,
o.OrderDate AS fecha_orden,
UPPER(FORMAT(o.OrderDate, 'MMMM','es-ES')) AS [mes_orden],
UPPER(FORMAT(o.OrderDate, 'dddd','es-ES')) AS [dia_orden],
DATEPART(YEAR,o.OrderDate) AS [año_orden]
FROM Orders AS o;
WHERE o.ShipCountry IN ('France','Brazil','belgium');
AND
o.CustomerID IN ('VICTE','HANAR','SUPRD')
AND
o.OrderDate BETWEEN '1996-07-10 AND '1998-12-24';
ORDER BY or.OrderDate ASC;