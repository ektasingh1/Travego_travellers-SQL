use travego;

-- a.How many females and how many male passengers traveled a minimum distance of 600 KMs?

select count(*) as no_of_females from passenger where gender ='F' and distance >= 600;
select count(*) as no_of_males from passenger where gender ='M' and distance >= 600;

-- b.Find the minimum ticket price of a Sleeper Bus. 

select min(price) from price where bus_type='sleeper';

-- c.Select passenger names whose names start with character 'S' 

select distinct passenger_name from passenger where passenger_name like's%';

-- d.Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City,
--   Bus_Type, Price in the output

select p.Passenger_name, p.Boarding_City, p.Destination_City,p.Bus_Type, pr.Price 
from passenger p join price pr
ON p.Bus_Type = pr.Bus_Type AND p.Distance = pr.Distance;

-- e.What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?

select p.Passenger_name, pr.Price 
from passenger p join price pr
ON p.Bus_Type = pr.Bus_Type AND p.Distance = pr.Distance
where pr.distance = 1000 and pr.bus_type='sitting';

  
-- f.What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?

-- Distance from Bangalore to Panaji is 600 km and the bus charge depends on distance between the 
-- boarding city and destination city and the bus_type.

select Distance, bus_type, Price
from price 
where Distance = 600 and bus_type in('sitting','sleeper');

-- g.List the distances from the "Passenger" table which are unique (non-repeated distances) in 
-- descending order. 

select distinct distance from passenger order by distance desc;

-- h.Display the passenger name and percentage of distance traveled by that passenger from the total 
-- distance traveled by all passengers without using user variables 

select passenger_name, (sum(distance)/(select sum(distance) from passenger))*100 as percentage_of_distance_travelled
from passenger
group by passenger_name;





