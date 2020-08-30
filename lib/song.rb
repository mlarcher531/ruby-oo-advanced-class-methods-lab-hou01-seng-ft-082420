require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.create_by_name(song)
    self.new_by_name(song)
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    song_array = file.split(/ - |.mp3/)
    song = self.create
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end

  def self.destroy_all
    @@all.clear
  end





  #binding.pry
    
end
