# taxi-business-relational-database
Real-world relational database model for a taxi fleet built in SQL Server. Includes master tables, business rules, and a modular 3NF structure for operations, history tracking, analytics, and documentation of the insights and improvements made throughout the project.


## 1.1	 Core entities:
### 1.1.1	CONCESSION
Attributes:
o	Id_concession (ENTITY PK)
o	Economic Number (UNIQUE NOT NULL)
o	Authorization Number (UNIQUE NOT NULL)

### 1.1.2	PERSON
Atributtes: 
a.	Id_person (ENTITY PK)
b.	First Name 
c.	Last Name
d.	CURP (UNIQUE NULLABLE)
e.	Birth_Date

### 1.1.3	CAR
Atributtes:
f.	Id_car (PK)
g.	VIN (UNIQUE NOT NULL)

## 1.2 RELATIONSHIP ENTITIES:

### 1.2.1	CONCESSION_OWNERSHIP
Atributtes: 
o	Id_ownership (ENTITY PK)
o	 id_concession (FK)
o	id_person (FK)
o	start_date
o	end_date (NULL = current)

### 1.2.2	Car_Driver_Assignment
Atributtes: 
o	Id_car_driver_history(PK)
o	Id_person (FK)
o	Id_car (FK)
o	start_date
o	end_date (NULL = current)

### 1.2.3	CAR_CONCESSION_ASSIGNMENT
Atributtes: 
o	Id_car_concession_history(PK)
o	Id_car (FK)
o	Id_concession (FK)
o	start_date
o	end_date (NULL = current)


