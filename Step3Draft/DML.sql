#To continue the example from above, if you have 5 tables in your schema, then at a minimum, we expect you to implement 5 SELECTs, 5 INSERTs, 1 UPDATE (M:N), 1 DELETE (M:N; causing no data anomalies), 1 NULLable relationship, and 1 Search/Dynamic for a total of 14 functions.

#categories, cutstomers, Items, Orders, Reviews
#do select statements
SELECT firstName, lastName from Customers where customerID = :selected_customer_id;
SELECT categoryName from Categories where categoryID = :selected_category_id;
SELECT itemName, price from Items where itemID = :selected_item_id;
SELECT orderDate, numOrderedItems, pricePaid from Orders where orderID = :selected_order_id;
SELECT overallRating, feedback from Reviews where reviewID = :selected_review_id;

#insert statements
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

#delete

DELETE from Items where itemName = :itemName_input;
Update orderItems
set itemID, totalNumItems = NULL
where itemID = (select itemID from Items where itemName = :itemName_input)

DELETE FROM Categories
WHERE categoryID = :categoryID_input_dropdown;

DELETE FROM Customers
where customerID = :customerID_input_dropdown;

#update customers address
update Customers
set address = :address_input
where customerID  = :customerID_input_dropdown









