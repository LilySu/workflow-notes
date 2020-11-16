SELECT    genre.NAME,
          Count(*) AS COUNT
FROM      genre
LEFT JOIN track
using    (genreid)
GROUP BY  genre.NAME
ORDER BY  count DESC;SELECT    artist.NAME,
          Count(*) AS albums
FROM      artist
LEFT JOIN album
using    (artistid)
GROUP BY  artist.NAME
ORDER BY  albums DESC limi :n; -- <----------anosql facility to namevariables
AND
weUSE limit :n
-- p. 47   string_agg instead of group_concat in postgres
-- array_to_string(array_agg(distinct "Actor"),',')
-- The USING clause is a shorthand that allows you to take advantage of the specific situation where both sides of the join use the same name for the joining column(s).SELECT     Group_concat(artist.NAME,', '),
           playlist.NAME                 AS playlist_appeared_in,
           genre.NAME                    AS Genre,
           Sum(playlisttrack.playlistid) AS total_in_playlist
FROM       artist
INNER JOIN album
ON         artist.artistid = album.artistid
INNER JOIN track
ON         album.albumid = track.albumid
INNER JOIN playlisttrack
ON         playlisttrack.trackid = track.trackid
INNER JOIN playlist
ON         playlisttrack.playlistid = playlist.playlistid
INNER JOIN genre
ON         track.genreid = genre.genreid
GROUP BY   track.genreid
ORDER BY   total_in_playlist DESC;