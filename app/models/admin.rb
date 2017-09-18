class Admin < ApplicationRecord
  def self.authenticate(login, password)
    Admin.find_by(login: login, password: password)
  end
end
