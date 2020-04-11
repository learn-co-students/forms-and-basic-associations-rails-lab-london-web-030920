class Song < ActiveRecord::Base

  belongs_to :artist
  belongs_to :genre
  has_many :notes

  accepts_nested_attributes_for :notes, :reject_if => proc { |attrs| attrs[:content].blank? }

  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
 end

#  def genre_name=(name)
#   self.genre = Genre.find_or_create_by_name(name: name)
#  end

#  def genre_name
#   self.genre ? self.genre.name : nil
#  end

#  def note_ids=(ids)
#   # byebug
#   ids.each do |id|
#     note = Note.find(id)
#     self.notes << note
#   end
# end

# def self.note_ids
#   self.note ? self.notes.content : nil
# end

end
