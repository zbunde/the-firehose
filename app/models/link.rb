class Link < ActiveRecord::Base
  acts_as_taggable_on :tags
  belongs_to :user

  def printable_url
    if self.url.include?("http://")
      return self.url
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
