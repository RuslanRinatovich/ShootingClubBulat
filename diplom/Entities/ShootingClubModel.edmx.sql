
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/22/2023 19:23:23
-- Generated from EDMX file: C:\DIPLOMS\Хабибуллин\diplom\Entities\ShootingClubModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ShootingClubBD];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Order_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_User];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderService_Order]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderService] DROP CONSTRAINT [FK_OrderService_Order];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderService_Pricelist]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderService] DROP CONSTRAINT [FK_OrderService_Pricelist];
GO
IF OBJECT_ID(N'[dbo].[FK_Pricelist_Service]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pricelist] DROP CONSTRAINT [FK_Pricelist_Service];
GO
IF OBJECT_ID(N'[dbo].[FK_Pricelist_Weapon]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pricelist] DROP CONSTRAINT [FK_Pricelist_Weapon];
GO
IF OBJECT_ID(N'[dbo].[FK_User_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Role];
GO
IF OBJECT_ID(N'[dbo].[FK_Weapon_WeaponType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Weapon] DROP CONSTRAINT [FK_Weapon_WeaponType];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Order]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order];
GO
IF OBJECT_ID(N'[dbo].[OrderService]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderService];
GO
IF OBJECT_ID(N'[dbo].[Pricelist]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pricelist];
GO
IF OBJECT_ID(N'[dbo].[Role]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Role];
GO
IF OBJECT_ID(N'[dbo].[Service]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Service];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO
IF OBJECT_ID(N'[dbo].[Weapon]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Weapon];
GO
IF OBJECT_ID(N'[dbo].[WeaponType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WeaponType];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [OrderID] int IDENTITY(1,1) NOT NULL,
    [OrderCreationDateTime] datetime  NOT NULL,
    [OrderFulfillmentDateTime] datetime  NOT NULL,
    [OrderCost] decimal(20,2)  NOT NULL,
    [UserID] int  NOT NULL
);
GO

-- Creating table 'OrderServices'
CREATE TABLE [dbo].[OrderServices] (
    [OrderServiceID] int IDENTITY(1,1) NOT NULL,
    [OrderID] int  NOT NULL,
    [PricelistID] int  NOT NULL,
    [Count] tinyint  NOT NULL
);
GO

-- Creating table 'Pricelists'
CREATE TABLE [dbo].[Pricelists] (
    [PricelistID] int IDENTITY(1,1) NOT NULL,
    [WeaponID] int  NOT NULL,
    [ServiceID] int  NOT NULL,
    [Price] decimal(20,2)  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [RoleID] int IDENTITY(1,1) NOT NULL,
    [RoleName] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'Services'
CREATE TABLE [dbo].[Services] (
    [ServiceID] int IDENTITY(1,1) NOT NULL,
    [ServiceName] nvarchar(100)  NOT NULL,
    [ServiceDescription] nvarchar(max)  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserID] int IDENTITY(1,1) NOT NULL,
    [UserLogin] nvarchar(max)  NOT NULL,
    [UserPassword] nvarchar(max)  NOT NULL,
    [UserName] nvarchar(100)  NOT NULL,
    [UserSurname] nvarchar(100)  NOT NULL,
    [UserPatronymic] nvarchar(100)  NULL,
    [RoleID] int  NOT NULL
);
GO

-- Creating table 'Weapons'
CREATE TABLE [dbo].[Weapons] (
    [WeaponID] int IDENTITY(1,1) NOT NULL,
    [WeaponName] nvarchar(100)  NOT NULL,
    [WeaponDescription] nvarchar(max)  NULL,
    [WeaponWeight] int  NOT NULL,
    [WeaponCaliber] nvarchar(100)  NOT NULL,
    [WeaponClipSize] smallint  NOT NULL,
    [WeaponTypeID] int  NOT NULL,
    [WeaponImage] nvarchar(100)  NULL
);
GO

-- Creating table 'WeaponTypes'
CREATE TABLE [dbo].[WeaponTypes] (
    [WeaponTypeID] int IDENTITY(1,1) NOT NULL,
    [WeaponTypeName] nvarchar(100)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [OrderID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([OrderID] ASC);
GO

-- Creating primary key on [OrderServiceID] in table 'OrderServices'
ALTER TABLE [dbo].[OrderServices]
ADD CONSTRAINT [PK_OrderServices]
    PRIMARY KEY CLUSTERED ([OrderServiceID] ASC);
GO

-- Creating primary key on [PricelistID] in table 'Pricelists'
ALTER TABLE [dbo].[Pricelists]
ADD CONSTRAINT [PK_Pricelists]
    PRIMARY KEY CLUSTERED ([PricelistID] ASC);
GO

-- Creating primary key on [RoleID] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([RoleID] ASC);
GO

-- Creating primary key on [ServiceID] in table 'Services'
ALTER TABLE [dbo].[Services]
ADD CONSTRAINT [PK_Services]
    PRIMARY KEY CLUSTERED ([ServiceID] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [UserID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- Creating primary key on [WeaponID] in table 'Weapons'
ALTER TABLE [dbo].[Weapons]
ADD CONSTRAINT [PK_Weapons]
    PRIMARY KEY CLUSTERED ([WeaponID] ASC);
GO

-- Creating primary key on [WeaponTypeID] in table 'WeaponTypes'
ALTER TABLE [dbo].[WeaponTypes]
ADD CONSTRAINT [PK_WeaponTypes]
    PRIMARY KEY CLUSTERED ([WeaponTypeID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_Order_User]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Order_User'
CREATE INDEX [IX_FK_Order_User]
ON [dbo].[Orders]
    ([UserID]);
GO

-- Creating foreign key on [OrderID] in table 'OrderServices'
ALTER TABLE [dbo].[OrderServices]
ADD CONSTRAINT [FK_OrderService_Order]
    FOREIGN KEY ([OrderID])
    REFERENCES [dbo].[Orders]
        ([OrderID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderService_Order'
CREATE INDEX [IX_FK_OrderService_Order]
ON [dbo].[OrderServices]
    ([OrderID]);
GO

-- Creating foreign key on [PricelistID] in table 'OrderServices'
ALTER TABLE [dbo].[OrderServices]
ADD CONSTRAINT [FK_OrderService_Pricelist]
    FOREIGN KEY ([PricelistID])
    REFERENCES [dbo].[Pricelists]
        ([PricelistID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderService_Pricelist'
CREATE INDEX [IX_FK_OrderService_Pricelist]
ON [dbo].[OrderServices]
    ([PricelistID]);
GO

-- Creating foreign key on [ServiceID] in table 'Pricelists'
ALTER TABLE [dbo].[Pricelists]
ADD CONSTRAINT [FK_Pricelist_Service]
    FOREIGN KEY ([ServiceID])
    REFERENCES [dbo].[Services]
        ([ServiceID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Pricelist_Service'
CREATE INDEX [IX_FK_Pricelist_Service]
ON [dbo].[Pricelists]
    ([ServiceID]);
GO

-- Creating foreign key on [WeaponID] in table 'Pricelists'
ALTER TABLE [dbo].[Pricelists]
ADD CONSTRAINT [FK_Pricelist_Weapon]
    FOREIGN KEY ([WeaponID])
    REFERENCES [dbo].[Weapons]
        ([WeaponID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Pricelist_Weapon'
CREATE INDEX [IX_FK_Pricelist_Weapon]
ON [dbo].[Pricelists]
    ([WeaponID]);
GO

-- Creating foreign key on [RoleID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_User_Role]
    FOREIGN KEY ([RoleID])
    REFERENCES [dbo].[Roles]
        ([RoleID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_User_Role'
CREATE INDEX [IX_FK_User_Role]
ON [dbo].[Users]
    ([RoleID]);
GO

-- Creating foreign key on [WeaponTypeID] in table 'Weapons'
ALTER TABLE [dbo].[Weapons]
ADD CONSTRAINT [FK_Weapon_WeaponType]
    FOREIGN KEY ([WeaponTypeID])
    REFERENCES [dbo].[WeaponTypes]
        ([WeaponTypeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Weapon_WeaponType'
CREATE INDEX [IX_FK_Weapon_WeaponType]
ON [dbo].[Weapons]
    ([WeaponTypeID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------