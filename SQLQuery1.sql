CREATE TABLE Products(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(150) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Category NVARCHAR(100),
    Description NVARCHAR(500)
);
