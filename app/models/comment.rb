class Comment < ActiveRecord::Base
  belongs_to :translation
  belongs_to :user
end
