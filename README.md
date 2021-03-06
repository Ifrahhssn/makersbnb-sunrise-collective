# makersbnb-sunrise-collective

### User Stories

```
As a host 
I want to be able to sign up
so that I can be signed up
```

```
As a host
I want to be able to create an entry
so that I can list a new space
```

```
As a host 
I want to be able to log in 
So that I don’t have to sign up each time 
```

```
As a host 
I want to be able to list multiple spaces 
So that customers can view all my spaces
```

```
As a host
I want to provide the details of my space
so that I can provide the right details to a potential customer
```

```
As a host
I want to be able to provide availability of my spaces
So the customer can see the availability
```

```
As a customer
I want to be able to book a space for one night
So that I can hire a space
```

```
As a host
I want to be able to approve a booking
So that I can rent out my space 
```

```
As a host
I want to be able to let customers know when space not available? 
So that customers cannot double book
```

```
As a host
I want it to be made available until the booking is confirmed?
So that I can rent out my space
```

### Domain Models

Class : Host 

Variables :
* Name

Methods : 
* list_space()
* sign_up()
* log_in()
* approve_booking()

****

Class : Space 

Variables : 
* Boolean
* Space Description

Methods : 
* view_spaces()
* show_availability()
* spaces_available?()
* booking_confirmed?()

**** 

Class : Customer 

Variables : 

Methods :
* book_a_space()



<img width="1100" alt="Screenshot 2021-09-20 at 16 50 23" src="https://user-images.githubusercontent.com/54316167/134090156-f2922b2e-a489-4f27-b8ee-35ad57f64f66.png">


<img width="644" alt="Screenshot 2021-09-20 at 16 19 33" src="https://user-images.githubusercontent.com/54316167/134090326-77c8a0e8-3b82-4144-9a06-effb5f28f911.png">

### Intructions on creating database

CREATE DATABASE sunrise_bnb_manager;

CREATE TABLE accounts (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
        last_login TIMESTAMP 
);

CREATE TABLE listings(id SERIAL PRIMARY KEY, listing_name VARCHAR(280));

### Instructions on creating test database

CREATE DATABASE sunrise_bnb_manager_test;

CREATE TABLE accounts (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
        last_login TIMESTAMP 
);

CREATE TABLE listings(id SERIAL PRIMARY KEY, listing_name VARCHAR(280));


