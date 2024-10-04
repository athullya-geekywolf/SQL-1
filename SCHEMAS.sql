"SCHEMA FOR BOOKMYSHOW"

CREATE TABLE USERS(
    USERID INT IDENTITY(1,1) PRIMARY KEY ,
    NAME VARCHAR(50),
    EMAIL VARCHAR(50) UNIQUE,
    PHONENUMBER VARCHAR(13),
    PASSWORD VARCHAR(12),
    REGISTRATIONDATE DATETIME DEFAULT CURRENT_TIMESTAMP
  );

CREATE TABLE MOVIES(
    MOVIEID INT IDENTITY(1,1) PRIMARY KEY,
    MOVIENAME VARCHAR(200),
    MOVIEGENRE VARCHAR(100),
    DURATION TIME,
    LANGUAGE VARCHAR(50),
    RELEASEDATE DATE,
    RATING DECIMAL(3,1),
    DESCRIPTION TEXT
);

CREATE TABLE THEATRES(
    THEATREID INT IDENTITY(1,1) PRIMARY KEY,
    NAME VARCHAR(200),
    CITY VARCHAR(100),
    STATE VARCHAR(100),
    ZIPCODE VARCHAR(30),
    TOTALSCREENS INT,
    PHONENUMBER VARCHAR(13)
);

CREATE TABLE SCREENS (
    SCREENID INT IDENTITY(1,1) PRIMARY KEY ,
    THEATREID INT,
    SCREENNUMBER INT,
    SEATINGCAPACITY INT,
    FOREIGN KEY (THEATREID) REFERENCES THEATRES(THEATREID)
);

CREATE TABLE SHOW (
    SHOWID INT IDENTITY(1,1) PRIMARY KEY ,
    MOVIEID INT,
    SCREENID INT,
    SHOWDATETIME DATETIME,
    AVAILABLESEATS INT,
    FOREIGN KEY (MOVIEID) REFERENCES MOVIES(MOVIEID),
    FOREIGN KEY (SCREENID) REFERENCES SCREENS(SCREENID)
);

CREATE TABLE BOOKINGS (
    BOOKINGID INT IDENTITY(1,1) PRIMARY KEY ,
    USERID INT,
    SHOWTIMEID INT,
    BOOKINGDATE DATETIME DEFAULT CURRENT_TIMESTAMP,
    TOTALAMOUNT DECIMAL(10, 2),
    FOREIGN KEY (USERID) REFERENCES USERS(USERID),
    FOREIGN KEY (SHOWTIMEID) REFERENCES SHOW(SHOWID)
);

CREATE TABLE TICKETS (
    TICKETID INT IDENTITY(1,1) PRIMARY KEY,
    BOOKINGID INT,
    SEATNUMBER VARCHAR(10),
    PRICE DECIMAL(10, 2),
    FOREIGN KEY (BOOKINGID) REFERENCES BOOKINGS(BOOKINGID)
);

CREATE TABLE SEAT (
    SEATID INT IDENTITY(1,1) PRIMARY KEY,
    SHOWID INT,
    SEATNUMBER VARCHAR(10),
    SEATTYPE VARCHAR(20),
    PRICE DECIMAL(10, 2),
    FOREIGN KEY (SHOWID) REFERENCES SHOW(SHOWID)
);

CREATE TABLE BOOKEDSEAT (
    BOOKINGID INT,
    SEATID INT,
    PRIMARY KEY (BOOKINGID, SEATID),
    FOREIGN KEY (BOOKINGID) REFERENCES BOOKINGS(BOOKINGID),
    FOREIGN KEY (SEATID) REFERENCES SEAT(SEATID)
);

------------------------------------------------------------------------------------------------------------

"SCHEMA FOR AMAZON"

  CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    Password VARCHAR(100),
    RegistrationDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Addresses (
    AddressID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    Street VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    ZipCode VARCHAR(20),
    Country VARCHAR(100),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY identity(1,1),
    CategoryName VARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    StockQuantity INT,
    CategoryID INT,
    Brand VARCHAR(50),
    Rating DECIMAL(3, 2),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(20), 
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CHECK (Status IN ('Pending', 'Shipped', 'Delivered', 'Canceled')) 
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ShoppingCart (
    CartID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE CartItems (
    CartItemID INT PRIMARY KEY IDENTITY(1,1),
    CartID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (CartID) REFERENCES ShoppingCart(CartID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE WishList (
    WishListID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE WishListItems (
    WishListItemID INT PRIMARY KEY IDENTITY(1,1),
    WishListID INT,
    ProductID INT,
    FOREIGN KEY (WishListID) REFERENCES WishList(WishListID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ShippingDetails (
    ShippingID INT PRIMARY KEY identity(1,1),
    OrderID INT,
    Street VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100),
    ShippingDate DATETIME,
    DeliveryDate DATETIME,
    ShippingMethod VARCHAR(50),
    TrackingNumber VARCHAR(100),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CHECK (ShippingMethod IN ('Standard Shipping', 'Overnight Shipping', 'Two-Day Shipping', 'Free Shipping', 'International Shipping'))
);

CREATE TABLE OrderHistory (
    HistoryID INT PRIMARY KEY identity(1,1),
    OrderID INT,
    Status VARCHAR(20),
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CHECK (Status IN ('Pending', 'Processing', 'Shipped', 'Delivered', 'Returned', 'Cancelled', 'Refunded', 'On Hold'))
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    PaymentStatus VARCHAR(20), 
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CHECK (PaymentMethod IN ('Credit Card', 'Cash', 'Bank Transfer','UPI')), 
    CHECK (PaymentStatus IN ('Pending', 'Completed', 'Failed', 'Refunded')) 
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    UserID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    ReviewDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);





------------------------------------------------------------------------------------------------------------

"SCHEMA FOR UBER"
  
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY ,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    Password VARCHAR(100),
    RegistrationDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Drivers (
    DriverID INT IDENTITY(1,1) PRIMARY KEY ,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    Password VARCHAR(100),
    RegistrationDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Vehicles (
    VehicleID INT IDENTITY(1,1) PRIMARY KEY,
    DriverID INT,
    LicensePlate VARCHAR(20) UNIQUE,
    Make VARCHAR(50),
    Model VARCHAR(50),
    ModelYear INT,
    Color VARCHAR(20),
    Capacity INT,
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

CREATE TABLE Rides (
    RideID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    DriverID INT,
    PickupLocation VARCHAR(255),
    DropoffLocation VARCHAR(255),
    StartTime DATETIME,
    EndTime DATETIME,
    RideStatus VARCHAR(20), 
    Fare DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID),
    CHECK (RideStatus IN ('Pending', 'In Progress', 'Completed', 'Cancelled'))
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    RideID INT,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(20), 
    paymentStatus varchar(20),
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (RideID) REFERENCES Rides(RideID),
    CHECK (PaymentMethod IN ('Credit Card', 'UPI', 'Cash')) ,
    CHECK (RideStatus IN ('Pending', 'Completed', 'Cancelled'))
);

CREATE TABLE Ratings (
    RatingID INT PRIMARY KEY IDENTITY(1,1),
    RideID INT,
    UserID INT,  
    DriverID INT,     
    DriverRating INT CHECK (DriverRating BETWEEN 1 AND 5),
    PassengerRating INT CHECK (PassengerRating BETWEEN 1 AND 5),
    Comment TEXT,
    FOREIGN KEY (RideID) REFERENCES Rides(RideID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID), 
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);




