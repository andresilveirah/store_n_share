class Content < ActiveRecord::Base
  belongs_to :user
  has_many :attachments
  has_and_belongs_to_many :shared_users, class_name: 'User'
  
  accepts_nested_attributes_for :attachments, allow_destroy: true
  
  auto_html_for :url do
    html_escape
    youtube
    link :target => "_blank", :rel => "nofollow"
    dailymotion
    google_video
    instagram
    ted
    vimeo
    simple_format
  end
end
