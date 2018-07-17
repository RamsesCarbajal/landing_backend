class Customer < ApplicationRecord
  validates :name,  presence: true, format: {with: /\A[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ.-]+\z/}
  validates :last_name,  presence: true, format: {with: /\A[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ.-]+\z/}
  validates :phone,  presence: true, format: {with: /\A[0-9]{10}\z/}
  validates :email, presence: true
  validates_email_format_of :email, :message => 'invalid format'
  validates :comment, presence: true, format: {with: /\A[a-zA-Z0-9@=\-'"áéíóú\ ]+\z/ }
  validate :validate_size_of_comment

  def validate_size_of_comment
    return if comment.nil?
    if comment.length < 10
       errors.add(:comment, "have_to_be_greater_than_10")
    elsif comment.length > 200
       errors.add(:comment, "have_to_be_less_than_200")
    end
  end
end
