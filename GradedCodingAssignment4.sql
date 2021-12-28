Create database TravelOnTheGo;
Use TravelOnTheGo;
Drop table if exists PASSENGER;
Create table PASSENGER(Passenger_name varchar(25),
					   Category varchar(10),
                       Gender varchar(1),
                       Boarding_city varchar(25),
                       Destination_city varchar(25),
                       Distance int,
                       Bus_Type varchar(25)
                       );
                       
Drop table if exists PRICE;
Create table PRICE(Bus_Type varchar(25),
                       Distance int,
                       Price int
                       );

Insert into PASSENGER values('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
Insert into PASSENGER values('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
Insert into PASSENGER values('Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper');
Insert into PASSENGER values('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
Insert into PASSENGER values('Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper');
Insert into PASSENGER values('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
Insert into PASSENGER values('Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper');
Insert into PASSENGER values('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');
Insert into PASSENGER values('Piyush','AC','M','Pune','Nagpur',700,'Sitting');

Insert into PRICE values('Sleeper',350,770);
Insert into PRICE values('Sleeper',500,1100);
Insert into PRICE values('Sleeper',600,1320);
Insert into PRICE values('Sleeper',700,1540);
Insert into PRICE values('Sleeper',1000,2200);
Insert into PRICE values('Sleeper',1200,2640);
Insert into PRICE values('Sleeper',350,434);
Insert into PRICE values('Sitting',500,620);
Insert into PRICE values('Sitting',500,620);
Insert into PRICE values('Sitting',600,744);
Insert into PRICE values('Sitting',700,868);
Insert into PRICE values('Sitting',1000,1240);
Insert into PRICE values('Sitting',1200,1488);
Insert into PRICE values('Sitting',1500,1860);

Select Gender,count(Passenger_name) from PASSENGER where Distance>600 group by Gender;

Select Bus_type,min(Price) from PRICE where BUs_type='Sleeper';

Select Passenger_name from PASSENGER where Passenger_name like 'S%';

Select Passenger_name,Boarding_city,Destination_city,PASSENGER.Bus_type,Price from PASSENGER,PRICE where PASSENGER.Bus_type=PRICE.Bus_type AND PASSENGER.Distance=PRICE.Distance;

Select Passenger_name,Price from PASSENGER,PRICE where PASSENGER.Bus_type=PRICE.Bus_type AND PASSENGER.Distance=PRICE.Distance AND PASSENGER.Bus_type='Sitting' AND PASSENGER.Distance=1000 ;

Select Passenger_name,PRICE.Bus_Type,Price from PASSENGER,PRICE where PASSENGER.Distance=PRICE.Distance AND Passenger_name='Pallavi';

Select Distance from PASSENGER group by distance having count(Distance)=1  order by Distance desc; 

SELECT Passenger_name, Distance * 100.0/(SELECT SUM(Distance) FROM PASSENGER) as Percentage FROM PASSENGER GROUP BY Distance;

Select Distance,Price, 
             CASE WHEN Price>1000 THEN 'Expensive'
				  WHEN Price>500 AND Price<1000 THEN 'Average_cost'
				  ELSE 'Cheap'
			 END as Category
        from PRICE group by Price;