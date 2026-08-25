# taxi-business-relational-database
Real-world relational database model for a taxi fleet built in SQL Server. Includes master tables, business rules, and a modular 3NF structure for operations, history tracking, analytics, and documentation of the insights and improvements made throughout the project.


## 1.1	 Core entities:
### 1.1.1	CONCESSION
Attributes:
- Id_concession (ENTITY PK)
- Economic Number (UNIQUE NOT NULL)
- Authorization Number (UNIQUE NOT NULL)

### 1.1.2	PERSON
Atributtes: 
- Id_person (ENTITY PK)
- First Name
- Last Name
- CURP (UNIQUE NULLABLE)
- Birth_Date

### 1.1.3	CAR
Atributtes:
- Id_car (PK)
- VIN (UNIQUE NOT NULL)

## 1.2 RELATIONSHIP ENTITIES:

### 1.2.1	CONCESSION_OWNERSHIP
Atributtes: 
- Id_ownership (ENTITY PK)
- id_concession (FK)
- id_person (FK)
- start_date
- end_date (NULL = current)

### 1.2.2	Car_Driver_Assignment
Atributtes: 
- Id_car_driver_history(PK)
- Id_person (FK)
- Id_car (FK)
- start_date
- end_date (NULL = current)

### 1.2.3	CAR_CONCESSION_ASSIGNMENT
Atributtes: 
- Id_car_concession_history(PK)
- Id_car (FK)
- Id_concession (FK)
- start_date
- end_date (NULL = current)


