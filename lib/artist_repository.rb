require_relative "./artist"

class ArtistRepository
    def all
        artist_array = []
        sql = "SELECT * FROM artists"
        result_set = DatabaseConnection.exec_params(sql, [])
        result_set.each do |selected| 
            chosen_artist = Artist.new
            chosen_artist.id = selected['id'].to_i
            chosen_artist.name = selected['name']
            chosen_artist.genre = selected['genre']
            artist_array << chosen_artist 
        end 
        return artist_array
    end 

 
end 