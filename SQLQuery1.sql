WITH tablex AS
  (SELECT oi.id,o.orderDate,ci.gameId,ci.quantity,oi.price*ci.quantity AS 'money'
   FROM OrderItems oi
   INNER JOIN Orders o ON oi.orderId = o.id
   INNER JOIN CartItems ci ON ci.id = oi.cartItemId
   WHERE O.orderDate >= DATEADD(DAY, -7, GETDATE()) AND (
		EXISTS (SELECT * from Game_Category gc 
				where gc.gameId = ci.gameId and gc.categoryId = 2)		
		)
   )
SELECT gameId,
       sum(quantity) AS 'sold',
       sum(MONEY) AS 'total'
FROM tablex
GROUP BY gameId