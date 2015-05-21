class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  default_scope { order('updated_at DESC') }
  
  def to_param
    "#{id} #{title}".parameterize
  end

end
