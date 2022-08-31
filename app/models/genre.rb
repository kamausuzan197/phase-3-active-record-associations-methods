class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    self.songs.count
  end

  def artist_array
    artists = []
    self.songs.each do |song|
      if artists.include?(song.artist)
        return false
      else 
        artists << song.artist
      end
    end
    artists
  end


  def artist_count
    # return the number of artists associated with the genre
self.artist_array.count
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    self.artist_array.map {|a| a.name}
  end
end
