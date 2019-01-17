class User < ActiveRecord::Base
  validates_presence_of :username, :password
  has_secure_password
  has_many :tweets

  def slug
    self.username.gsub(/\s/, "-").gsub(/[^0-9A-Za-z\-]/, "").downcase
  end

  def self.find_by_slug(slug)
    self.all.find { |username| username.slug == slug }
  end
end
