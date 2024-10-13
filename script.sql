
CREATE DATABASE Teste
GO
USE Teste
GO


CREATE TABLE Dim_Business (
                Sk_Bisness VARCHAR(5) NOT NULL,
                Pk_Bisness VARCHAR(5) NOT NULL,
                Source VARCHAR(15) NOT NULL,
                Category VARCHAR(25) NOT NULL,
                Industries VARCHAR(15) NOT NULL,
                Organization VARCHAR(15) NOT NULL,
                Version INT NOT NULL,
                Valido_Hasta DATETIME NOT NULL,
                Valido_Desde DATETIME NOT NULL,
                CONSTRAINT Dim_Business_pk PRIMARY KEY (Sk_Bisness)
)

CREATE TABLE Dim_Persona (
                Sk_PersonName VARCHAR(5) NOT NULL,
                Pk_PersonName VARCHAR(5) NOT NULL,
                Country_Residence VARCHAR(15) NOT NULL,
                Country_Citizenship VARCHAR(15) NOT NULL,
                Status CHAR(1) NOT NULL,
                Gender CHAR(1) NOT NULL,
                FirstName VARCHAR(15) NOT NULL,
                LastName VARCHAR(15) NOT NULL,
                Title VARCHAR(15) NOT NULL,
                Version INT NOT NULL,
                Valido_Desde DATETIME NOT NULL,
                Valido_Hasta DATETIME NOT NULL,
                CONSTRAINT Dim_Persona_pk PRIMARY KEY (Sk_PersonName)
)

CREATE TABLE Facts_Billonario (
                Sk_PersonName VARCHAR(5) NOT NULL,
                Sk_Residence VARCHAR(5) NOT NULL,
                Final_Worth INT NOT NULL,
                Age INT NOT NULL,
                Rank INT NOT NULL,
                Cpi_country DECIMAL(2) NOT NULL,
                Gdp_Country DECIMAL(2) NOT NULL,
                Total_Tax_Rate_Country DECIMAL(2) NOT NULL,
                CONSTRAINT Facts_Billonario_pk PRIMARY KEY (Sk_PersonName, Sk_Residence)
)

ALTER TABLE Facts_Billonario ADD CONSTRAINT Dim_Business_Facts_Billonario_fk
FOREIGN KEY (Sk_Residence)
REFERENCES Dim_Business (Sk_Bisness)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Facts_Billonario ADD CONSTRAINT Dim_Persona_Facts_Billonarie_fk
FOREIGN KEY (Sk_PersonName)
REFERENCES Dim_Persona (Sk_PersonName)
ON DELETE NO ACTION
ON UPDATE NO ACTION
