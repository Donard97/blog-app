class ApplicationRecord < ActiveRecord::Base
  def current_user
    User.first
  end
end
