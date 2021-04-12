select name,
  case
    when genre = 'romance' or
      genre = 'comedy' then
      'Chill'
      else
      'Intense'
    end as 'Mood'
from movies;