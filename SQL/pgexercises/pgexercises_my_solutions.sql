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

	-- # you don't have every booking
    -- # nothing shared in cd.bookings
    -- you get all members regardless of members
    -- you also have all facilities

select concat(m.firstname, ' ', m.surname), f.name,
	case
		when m.memid != 0 then
			b.slots * f.membercost
		else
			b.slots * f.guestcost
	end as cost
from cd.members m
  inner join cd.bookings b
  	using(memid)
  inner join cd.facilities f
  	using(facid)
where
	b.starttime < '2012-09-15' and
	b.starttime >= '2012-09-14' and (
		(m.memid != 0 and f.membercost * b.slots > 30)
		or
		(m.memid = 0 and f.guestcost * b.slots > 30)
	  	);

