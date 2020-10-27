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
    song = self.new
    @@all << song
    song
  end 

  def self.new_by_name(song_title)
    new_song = self.new
    new_song.name = song_title
    new_song
  end 

  def self.create_by_name(song_title)
    new_song = self.new
    new_song.name = song_title
    @@all << new_song
    new_song
  end 

  def self.find_by_name(song_name)
    self.all.detect { |song| song.name == song_name}
  end 

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)

  end 

  def self.alphabetical
    @@all.sort_by! { |song| song.name}
  end 

  def self.new_from_filename(file_name)
    new_song = self.new
    new_song.name = file_name.split(" - ")[1].split(".")[0]
    new_song.artist_name = file_name.split(" - ")[0]
    new_song
  end

  def self.create_from_filename(file_name)
    split_filename = file_name.chop.chop.chop.chop.split(" - ")
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song

  end

  def self.destroy_all
    @@all = []

  end


  song = Song.create

  Song.all.include?(song)

song = Song.new_by_name("wonderwall")
song.name

song = Song.create_by_name("wonderwall")
song
Song.all.include?(song)

wonderwall = Song.create_by_name("wonderwall")

song = Song.new_from_filename("Oasis - Wonderwall.mp3")
song.name
song.artist_name



end
