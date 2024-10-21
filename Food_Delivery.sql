CREATE TABLE Restaurants(
	RestaurantId INT PRIMARY KEY,
	Name VARCHAR(30),
	Email VARCHAR(50),
	PhoneNumber VARCHAR(12),
	City VARCHAR(30),
	Street VARCHAR(30),
	Country VARCHAR(30)
);

CREATE TABLE MenuItems(
	MenuItemId INT PRIMARY KEY,
	RestaurantId INT,
	FoodType VARCHAR(10),
	FoodCategory VARCHAR(40),
	FoodItem VARCHAR(30),
	Price DECIMAL(10,2),
	FOREIGN KEY (RestaurantId) REFERENCES Restaurants(RestaurantId)
);

CREATE TABLE Customers(
	CustomerId INT PRIMARY KEY,
	Name VARCHAR(30),
	Email VARCHAR(50),
	PhoneNumber VARCHAR(12),
	City VARCHAR(30),
	Street VARCHAR(30),
	Country VARCHAR(30)
);

CREATE TABLE Customizations (
    CustomizationID INT PRIMARY KEY,
    MenuItemID INT,
    CustomizationName VARCHAR(100),
    AdditionalCost DECIMAL(10, 2),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerId INT,
    CustomizationID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(20), 
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
    FOREIGN KEY (CustomizationID) REFERENCES Customizations(CustomizationID),
    CHECK (Status IN ('Pending', 'Delivered', 'Cancelled')) 
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    MenuItemId INT,
    Quantity INT,
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemId) REFERENCES MenuItems(MenuItemId),
);

CREATE TABLE RatingsAndReviews (
    ReviewID INT PRIMARY KEY,
    CustomerID INT,
    RestaurantID INT,
    Rating DECIMAL(3,1),
    Review TEXT,
    ReviewDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);


CREATE TABLE Promotions (
    PromotionID INT PRIMARY KEY,
    RestaurantID INT,
    PromoCode VARCHAR(50) UNIQUE,
    DiscountPercentage DECIMAL(5, 2),
    ValidFrom DATE,
    ValidTo DATE,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

CREATE TABLE DeliveryDrivers (
    DriverID INT PRIMARY KEY,
    Name VARCHAR(100),
    PhoneNumber VARCHAR(15),
    VehicleDetails VARCHAR(100),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE LoyaltyPrograms (
    ProgramID INT PRIMARY KEY,
    CustomerID INT,
    PointsEarned INT DEFAULT 0,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE Rewards (
    RewardID INT PRIMARY KEY,
    ProgramID INT,
    RewardDescription VARCHAR(255),
    PointsRequired INT,
    FOREIGN KEY (ProgramID) REFERENCES LoyaltyPrograms(ProgramID)
);
