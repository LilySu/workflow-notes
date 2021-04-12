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
-- The USING clause is a shorthand that allows you to take advantage of the specific situation where both sides of the join use the same name for the joining column(s).

select artist.name, Playlist.name as playlist_appeared_in, genre.Name as Genre, sum(playlisttrack.playlistId) as total_in_playlist from artist
inner join Album
on artist.ArtistId = Album.ArtistId
inner join Track
on album.AlbumId = track.AlbumId
inner join PlaylistTrack
on PlaylistTrack.TrackId = Track.TrackId
inner join Playlist
on PlaylistTrack.PlaylistId = Playlist.PlaylistId
inner join Genre
on track.GenreId = Genre.GenreId
group by track.GenreId, artist.name
order by genre, total_in_playlist desc;