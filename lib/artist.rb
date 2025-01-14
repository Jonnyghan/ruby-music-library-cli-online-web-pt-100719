require_relative "./concerns.rb"
require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  
    @@all = []
  
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
    new = Artist.new(name)
    new.save
    new
  end
  
  def add_song(song)
    if !@songs.include?(song)
    @songs << song
    end
    if song.artist == nil 
    song.artist = self
    end 
  end
  
  def songs 
    @songs 
  end
  
  def genres
    songs.collect do |song|
   song.genre 
    end
    .uniq
  #binding.pry
  end

end
