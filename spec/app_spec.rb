require './app.rb'
require 'album_repository'
require 'artist_repository'

RSpec.describe "App test" do
    it "Prints out a list of albums" do
        io = double (:fake_io)
        album_repository = AlbumRepository.new
        artist_repository = ArtistRepository.new 
        db = "music_library"
        
        expect(io).to receive(:puts).with("Welcome to the music library manager!")
        expect(io).to receive(:puts).with("What would you like to do? 1 - List all Albums. 2 - List all Artists.")
        expect(io).to receive(:puts).with("Enter your choice:")
        expect(io).to receive(:gets).and_return(1)
        expect(io).to receive(:puts).with("1 - Doolittle")
        expect(io).to receive(:puts).with("2 - Surfer Rosa")
        expect(io).to receive(:puts).with("3 - Waterloo")
        expect(io).to receive(:puts).with("4 - Super Trouper")
        expect(io).to receive(:puts).with("5 - Bossanova")
        expect(io).to receive(:puts).with("6 - Lover")
        expect(io).to receive(:puts).with("7 - Folklore")
        expect(io).to receive(:puts).with("8 - I Put a Spell on You")
        expect(io).to receive(:puts).with("9 - Baltimore")
        expect(io).to receive(:puts).with("10 - Here Comes the Sun")
        expect(io).to receive(:puts).with("11 - Fodder on My Wings")
        expect(io).to receive(:puts).with("12 - Ring Ring")
        app = Application.new(db, io, album_repository, artist_repository)
        app.run
    end

    it "Prints out a list of artists" do
        io = double (:fake_io)
        album_repository = AlbumRepository.new
        artist_repository = ArtistRepository.new 
        db = "music_library"
        
        expect(io).to receive(:puts).with("Welcome to the music library manager!")
        expect(io).to receive(:puts).with("What would you like to do? 1 - List all Albums. 2 - List all Artists.")
        expect(io).to receive(:puts).with("Enter your choice:")
        expect(io).to receive(:gets).and_return(2)
        expect(io).to receive(:puts).with("1 - Pixies")
        expect(io).to receive(:puts).with("2 - ABBA")
        expect(io).to receive(:puts).with("3 - Taylor Swift")
        expect(io).to receive(:puts).with("4 - Nina Simone")
        app = Application.new(db, io, album_repository, artist_repository)
        app.run
    end
end