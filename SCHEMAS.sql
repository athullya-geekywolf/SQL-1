"Schema for BookMyShow"

CREATE TABLE Users (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50) UNIQUE,
    PhoneNumber VARCHAR(13),
    Password VARCHAR(12),
    RegistrationDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Movies (
    MovieId INT IDENTITY(1,1) PRIMARY KEY,
    MovieName VARCHAR(200),
    Duration TIME,
    ReleaseDate DATE,
    Rating DECIMAL(3,1),
    Description TEXT
);

CREATE TABLE Genres (
    GenreId INT IDENTITY(1,1) PRIMARY KEY,
    GenreName VARCHAR(100) UNIQUE
);

CREATE TABLE Languages (
    LanguageId INT IDENTITY(1,1) PRIMARY KEY,
    LanguageName VARCHAR(50) UNIQUE
);

CREATE TABLE MovieGenres (
    MovieId INT,
    GenreId INT,
    PRIMARY KEY (MovieId, GenreId),
    FOREIGN KEY (MovieId) REFERENCES Movies(MovieId),
    FOREIGN KEY (GenreId) REFERENCES Genres(GenreId)
);

CREATE TABLE MovieLanguages (
    MovieId INT,
    LanguageId INT,
    PRIMARY KEY (MovieId, LanguageId),
    FOREIGN KEY (MovieId) REFERENCES Movies(MovieId),
    FOREIGN KEY (LanguageId) REFERENCES Languages(LanguageId)
);


CREATE TABLE Theatres (
    TheatreId INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(200),
    City VARCHAR(100),
    State VARCHAR(100),
    ZipCode VARCHAR(30),
    TotalScreens INT,
    PhoneNumber VARCHAR(13)
);

CREATE TABLE Screens (
    ScreenId INT IDENTITY(1,1) PRIMARY KEY,
    TheatreId INT,
    ScreenNumber INT,
    SeatingCapacity INT,
    FOREIGN KEY (TheatreId) REFERENCES Theatres(TheatreId)
);

CREATE TABLE Shows (
    ShowId INT IDENTITY(1,1) PRIMARY KEY,
    MovieId INT,
    ScreenId INT,
    ShowDateTime DATETIME,
    FOREIGN KEY (MovieId) REFERENCES Movies(MovieId),
    FOREIGN KEY (ScreenId) REFERENCES Screens(ScreenId)
);

CREATE TABLE Seats (
    SeatId INT IDENTITY(1,1) PRIMARY KEY,
    ShowId INT,
    SeatNumber VARCHAR(10),
    SeatType VARCHAR(20),
    Price DECIMAL(10, 2),
    FOREIGN KEY (ShowId) REFERENCES Shows(ShowId)
);


CREATE TABLE Bookings (
    BookingId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT,
    ShowId INT,
    BookingDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    FOREIGN KEY (ShowId) REFERENCES Shows(ShowId)
);

CREATE TABLE Tickets (
    TicketId INT IDENTITY(1,1) PRIMARY KEY,
    BookingId INT,
    SeatId INT,
    FOREIGN KEY (BookingId) REFERENCES Bookings(BookingId),
    FOREIGN KEY (SeatId) REFERENCES Seats(SeatId)
);


CREATE TABLE BookedSeats (
    BookingId INT,
    SeatId INT,
    PRIMARY KEY (BookingId, SeatId),
    FOREIGN KEY (BookingId) REFERENCES Bookings(BookingId),
    FOREIGN KEY (SeatId) REFERENCES Seats(SeatId)
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




