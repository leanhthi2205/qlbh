-- Tạo cơ sở dữ liệu quản lý nhà hàng
CREATE DATABASE RestaurantManagement;
GO

USE RestaurantManagement;
GO

-- Bảng danh mục món ăn
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Bảng món ăn
CREATE TABLE Foods (
    FoodID INT PRIMARY KEY IDENTITY(1,1),
    FoodName NVARCHAR(100) NOT NULL,
    CategoryID INT,
    Description NVARCHAR(255),
    Price DECIMAL(10, 2) NOT NULL,
    ImageURL VARCHAR(255),
    IsAvailable BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
GO

-- Bảng khách hàng
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Address NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Bảng nhân viên
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Position NVARCHAR(50),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Bảng bàn ăn
CREATE TABLE Tables (
    TableID INT PRIMARY KEY IDENTITY(1,1),
    TableName NVARCHAR(50) NOT NULL,
    Capacity INT NOT NULL,
    Status NVARCHAR(20) DEFAULT N'Trống',
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Bảng đặt bàn
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    TableID INT,
    ReservationDate DATETIME NOT NULL,
    NumberOfGuests INT NOT NULL,
    Status NVARCHAR(20) DEFAULT N'Đã đặt',
    Notes NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (TableID) REFERENCES Tables(TableID)
);
GO

-- Bảng hóa đơn
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    TableID INT,
    EmployeeID INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10, 2) DEFAULT 0,
    Status NVARCHAR(20) DEFAULT N'Mới',
    PaymentMethod NVARCHAR(50),
    Notes NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (TableID) REFERENCES Tables(TableID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
GO

-- Bảng chi tiết hóa đơn
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    FoodID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    Discount DECIMAL(10, 2) DEFAULT 0,
    Notes NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (FoodID) REFERENCES Foods(FoodID)
);
GO

-- Bảng đặt món trước
CREATE TABLE PreOrders (
    PreOrderID INT PRIMARY KEY IDENTITY(1,1),
    ReservationID INT,
    FoodID INT,
    Quantity INT NOT NULL,
    Notes NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID),
    FOREIGN KEY (FoodID) REFERENCES Foods(FoodID)
);
GO

-- Bảng quảng cáo món ăn
CREATE TABLE Promotions (
    PromotionID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    DiscountPercent DECIMAL(5, 2),
    DiscountAmount DECIMAL(10, 2),
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Bảng chi tiết quảng cáo món ăn
CREATE TABLE PromotionDetails (
    PromotionDetailID INT PRIMARY KEY IDENTITY(1,1),
    PromotionID INT NOT NULL,
    FoodID INT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (PromotionID) REFERENCES Promotions(PromotionID),
    FOREIGN KEY (FoodID) REFERENCES Foods(FoodID)
);
GO

-- Bảng tài khoản người dùng
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    EmployeeID INT,
    Role NVARCHAR(20) NOT NULL,
    IsActive BIT DEFAULT 1,
    LastLogin DATETIME,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
GO