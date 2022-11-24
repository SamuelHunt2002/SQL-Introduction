
# file: app.rb
require_relative './lib/database_connection'
require_relative './lib/album_repository'
require_relative './lib/artist_repository'

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    # "Runs" the terminal application
    # so it can ask the user to enter some input
    # and then decide to run the appropriate action
    # or behaviour.

    # Use `@io.puts` or `@io.gets` to
    # write output and ask for user input.
    @io.puts "Welcome to the music library manager!"
    @io.puts "What would you like to do? 1 - List all Albums. 2 - List all Artists."
    @io.puts "Enter your choice:"
    user_choice = @io.gets.to_i
    if (user_choice == 1) 
      @album_repository.all.each do |selection| @io.puts "#{selection.id} - #{selection.title}" end 
      elsif (user_choice == 2)
      @artist_repository.all.each do |selection| @io.puts "#{selection.id} - #{selection.name}" end
      else 
        @io.puts "Put in valid number!" 
      end 
  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end
