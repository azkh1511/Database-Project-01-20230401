USE LittleLemonDB;


DROP PROCEDURE GetMaxQuantity;
DROP PROCEDURE CancelOrder;
DROP PREPARE GetOrderDetail;

CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(order_quantity) AS 'Max Quantity in Order'
FROM Orders;



CREATE PROCEDURE CancelOrder(IN ID INT)
DELETE FROM Orders
WHERE order_id = ID;




PREPARE GetOrderDetail FROM 
"SELECT order_id AS OrderID, 
        order_quantity AS Quantity, 
        total_cost AS Cost 
FROM Orders
WHERE order_id = ?"