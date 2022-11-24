require_relative "./album"

class AlbumRepository
    def all
        album_array = []
        sql = "SELECT * FROM albums"
        result_set = DatabaseConnection.exec_params(sql, [])
        result_set.each do |selected| 
            chosen_album = Album.new
            chosen_album.id = selected['id'].to_i
            chosen_album.title = selected['title']
            chosen_album.release_year = selected['release_year'].to_i
            chosen_album.artist_id = selected['artist_id'].to_i
            album_array << chosen_album 
        end 
        return album_array
    end 
end 