class Content < ActiveRecord::Base
  belongs_to :user
  has_many :attachments
  
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
