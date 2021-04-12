TABLE A    JOIN   TABLE B
(Left outer Join)
TABLE A -> will get all of its rows outputted, and THEN any matching rows of B get attached, according to the “ON” statement

joins - what table 

select is output

cardinality - is join

left and right is what comes first

select *
	from cd.members m
	left outer join cd.bookings b
		on m.memid = b.memid
	right outer join cd.facilities f
		on b.facid = f.facid
	limit 10;
	
	# you don't have every booking
    # nothing shared in cd.bookings
    you get all members regardless of members
    you also have all facilities

From Minh Pham to Everyone:  12:18 PM
TABLE A    JOIN   TABLE B
(Left outer Join)
TABLE A -> will get all of its rows outputted, and THEN any matching rows of B get attached, according to the “ON” statement
TABLE A Left Outer Join TABLE B
TABLE A <JOIN> TABLE B
RECS JOIN MEM
FROM <RECS JOIN MEM>
FROM MEM JOIN RECS
FROM cd.members JOIN cd.bookings JOIN cd.facilities
FROM cd.members LEFT OUTER JOIN cd.bookings RIGHT OUTER JOIN cd.facilities
From Minh Pham to Everyone:  12:38 PM
Rock-AC/DC
Rock-Aaron Copland
Rock-Marcos Valle
