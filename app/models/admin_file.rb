class AdminFile < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  has_attached_file :attachment

  validates_presence_of :permission, :user_id
  validates_attachment_presence :attachment

  def title_or_name
    return self.title unless self.title.blank?
    self.attachment_file_name
  end
end

