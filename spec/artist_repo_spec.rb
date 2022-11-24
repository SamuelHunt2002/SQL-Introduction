require "artist_repository"

def reset_students_table
  seed_sql = File.read("spec/seeds.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "music_library" })
  connection.exec(seed_sql)
end

describe ArtistRepository do
  before(:each) do
    reset_students_table
  end

  it "works for .all" do
    artist_repo = ArtistRepository.new()
    all_artists = artist_repo.all 
    expect(all_artists[0].id).to eq 1
    expect(all_artists[0].name).to eq "Pixies"
    expect(all_artists[2].name).to eq "Taylor Swift"
  end

end