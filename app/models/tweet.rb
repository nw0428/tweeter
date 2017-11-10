class Tweet < ApplicationRecord
  validates :content, presence: true, length: {minimum: 1, maximum: 256}
  before_save :generate_hashtags

  belongs_to :user
  has_and_belongs_to_many :hashtags

  def generate_hashtags
    content.scan(/#\w+/).each do |tag|
      if not Hashtag.exists?(tag: tag)
        hashtag = Hashtag.new(tag: tag)
        hashtag.save
        self.hashtags << hashtag
      end
    end
  end

end
