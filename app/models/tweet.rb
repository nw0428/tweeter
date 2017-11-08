class Tweet < ApplicationRecord
  validates :content, presence: true, length: {minimum: 1, maximum: 256}
  before_save :generate_hashtags

  belongs_to :user
  has_and_belongs_to_many :hashtags

  def generate_hashtags
    content.scan(/#\w+/).each do |tag|
        hashtag = Hashtag.find_or_create_by(tag: tag)
        self.hashtags << hashtag
    end
  end
end
