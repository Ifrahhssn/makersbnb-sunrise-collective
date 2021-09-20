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


