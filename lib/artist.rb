class Artist
  
  attr_accessor :name, :songs
  @@all = []
  
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    new(name).tap {|n| n.save}
  end
  
  def add_song(song) #nope
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end
  
  def genres
    genres.artist
  end
  
  def genres
    self.songs.collect{|s| s.genre}.uniq
  end
    
end