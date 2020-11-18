class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: true
  validates_length_of :content, minimum: 250, if: Proc.new { | post | post.content.present? }
  validates_length_of :summary, maximum: 250, if: Proc.new { | post | post.summary.present? }
  validates :category, inclusion: { within: %w(Fiction Non-Fiction), 
    message: "%{value} is not included in the list."}
  validate :is_clickbait?

  PATTERNS_FOR_CLICKBAIT = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i,
    /Unbelievable [0-9]*/i, 
    /Life Changing/i,
    /Life Altering/i,
    /Mind Blowing/i
  ]

  def is_clickbait?
    if PATTERNS_FOR_CLICKBAIT.none? { |pattern| pattern.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
