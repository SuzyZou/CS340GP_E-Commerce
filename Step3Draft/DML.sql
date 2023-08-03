-- To continue the example from above, if you have 5 tables in your schema, then at a minimum, we expect you to implement 5 SELECTs, 5 INSERTs, 1 UPDATE (M:N), 1 DELETE (M:N; causing no data anomalies), 1 NULLable relationship, and 1 Search/Dynamic for a total of 14 functions.

-- Our tables:  categories, cutstomers, Items, Orders, Reviews


-- --------------------------------------------------------------------------------------------
-- ---------------------------------Select Statements------------------------------------------
SELECT firstName, lastName 
FROM Customers 
Where customerID = :selected_customer_id;

SELECT categoryName 
FROM Categories 
WHERE categoryID = :selected_category_id;

SELECT itemName, price 
FROM Items 
WHERE itemID = :selected_item_id;

SELECT orderDate, numOrderedItems, pricePaid 
FROM Orders 
WHERE orderID = :selected_order_id;

SELECT overallRating, feedback 
FROM Reviews 
WHERE reviewID = :selected_review_id;


-- --------------------------------------------------------------------------------------------
-- ---------------------------------Insert  Statements------------------------------------------

INSERT INTO Customers(lastName, firstName, emailAddress, address, city)
VALUES
(:lastName_input, :firstName_input, :emailAddress_input, :address_input, :city_input);

INSERT INTO Categories(categoryName)
VALUES
(:categoryName_input);

INSERT INTO Items(reviewID,	categoryID,	itemName,	price)
VALUES
(:reviewID_input, :categoryID_input_dropdown, :itemName_input, :price_input);

INSERT INTO Orders(customerID, orderDate, creditCardNumb, creditCardExpDate, numOrderedItems, pricePaid)
VALUES
(:customerID_input_dropdown, :orderDate_input, :creditCardNumb_input, :creditCardExpDate_input, :numOrderedItems_input, :pricePaid_input);

INSERT into Reviews(customerID, overallRating, feedback)
VALUES
(:customerID_input_dropdown, overallRating_input, feedback_input);

-- --------------------------------------------------------------------------------------------
-- ---------------------------------Delete Statements------------------------------------------

DELETE from Items where itemName = :itemName_input;
Update orderItems
set itemID, totalNumItems = NULL
where itemID = (select itemID from Items where itemName = :itemName_input)

DELETE FROM Categories
WHERE categoryID = :categoryID_input_dropdown;

DELETE FROM Customers
WHERE customerID = :customerID_input_dropdown;


-- --------------------------------------------------------------------------------------------
-- -----------------------------Update  Statements---------------------------------------------

update Customers
set address = :address_input
where customerID  = :customerID_input_dropdown


-- filter Reviews

select * from Reviews 
where overallRating >= :overallRating_input_dropdown
and
overallRating < (:overallRating_input_dropdown + 1)











