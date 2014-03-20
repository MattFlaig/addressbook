class Contact < ActiveRecord::Base
	require 'pry'
  validates :name, :email, :phonenumber, :city, presence: true
  belongs_to :user

  def self.search_by_name(search_term)
    return [] if search_term.blank?
    where("name || email || phonenumber || city LIKE?", "%#{search_term}%")
  end

end
