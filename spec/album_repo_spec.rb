require "album_repository"
def reset_students_table
    seed_sql = File.read("spec/seeds.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "music_library" })
    connection.exec(seed_sql)
  end
  
  describe AlbumRepository do
    before(:each) do
      reset_students_table
    end
  
    it "works for .all" do
      album_repo = AlbumRepository.new()
      all_albums = album_repo.all 
      expect(all_albums[0].id).to eq 1
      expect(all_albums[0].title).to eq "Doolittle"
      expect(all_albums[0].release_year).to eq 1989
      expect(all_albums[0].artist_id).to eq 1
      expect(all_albums[2].title).to eq "Waterloo"
    end
end 