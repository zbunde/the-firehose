class Link < ActiveRecord::Base
  acts_as_taggable_on :tags
  belongs_to :user
  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
  validates :description, presence: true


  def printable_url
    if /(https:\/\/)/.match(self.url) != nil
      self.url
    elsif /(http:\/\/)/.match(self.url) != nil
      self.url
    else
      "http://#{self.url}"
    end
  end

  def tag_links
    self.tag_list_on(:tags).each do |tag|
      return "<a href='links/tagged/#{tag}'>#{tag}</a>"
    end
  end

end
